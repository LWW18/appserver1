package com.ruoyi.api.controller;

import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.system.domain.LoginReturn;
import com.ruoyi.system.domain.LoraData;
import com.ruoyi.system.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.io.IOException;
import java.io.InputStreamReader;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.*;

import static com.ruoyi.api.constant.CodeAndData.*;
import static com.ruoyi.api.constant.DataConversion.*;
import static com.ruoyi.api.controller.RespondToNsAppController.respondToNsPost;


/**
 * @Description: 从Ns端接收业务数据   发送方：Ns 接收方：AppServer
 * 接口地址：/api/appserver/bsData/recBsDataFromNs
 * @author: Wei wang
 * @create: 2022-10-20-10-47
 */
@RestController
@RequestMapping("/api/appserver/bsData")
public class BsDataController {
    private static final Logger logger = LoggerFactory.getLogger(BsDataController.class);

    @Resource
    ILoraDataService loraDataService;
    @Resource
    ILoraAppService loraAppService;
    @Resource
    ILoraTerminalService loraTerminalService;
    @Resource
    ILoraNodeService loraNodeService;
    @Resource
    ILoraGatewayService loraGatewayService;
    @Resource
    ILoginReturnService loginReturnService;
    @Resource
    protected HttpServletRequest request;

    /**
     * AppServer接收来自Ns的业务数据->解析->发送给app
     */
    @RequestMapping(value = "/recBsDataFromNs", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    public void addBsData() throws IOException {
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ====================      接收业务数据      ==================== ");
        logger.debug(" ====================  " + timestamp + "  ===================== ");
        //接收来自Ns发送的业务数据（json消息），并转换为loraData对象
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        LoraData loraData = JSON.parseObject(reader, LoraData.class);
        //trim()去除负载字符串中的空格 tip: 此方法只能删除字符串中的，不能删除首尾的
        String payload = loraData.getRecvData().replace(" ", "");
        //嵌入式发送的length是反的
        String length16 = turnLength(payload.substring(0, 2), payload.substring(2, 4));
        String code16 = payload.substring(6, 8);
        if (code16.equals(RESPONSEUP)) {
            return;
        }
        if (!TERMINAL.equals(code16)) {
            System.out.println("入网指令码错误。");
            return;
        }
        int length10 = Integer.parseInt(length16, 16) * 2;
        String version16 = payload.substring(4, 6);
        int version10 = Integer.parseInt(version16, 16);
        String flow16 = payload.substring(8, 12);
        //对数据包前导三个验证：
        if (length10 != payload.length()) {
            System.out.println("收到的长度不符。");
            return;
        }
        if (!PROTOCOLNUM2.equals(version16)) {
            System.out.println("业务数据接收失败，该版本号未记录。");
            return;
        }
        //携带解析数据后的业务数据
        loraData = loraDataService.decode(loraData, length10);
        //获取sensorId，也就是workId
        int sensorId = Integer.parseInt(loginReturnService.selectLoginReturnByTerminalEui(loraData.getTerminalEui()).getWorkId().substring(1, 2));
        //生成sn：sn=terminalEui（通信终端eui）+sensorId（传感器地址）+sensorType（传感器类型）
        loraData.setSensorId((long) sensorId);
        loraData.setSn(generateSn(loraData.getTerminalEui(), sensorId, loraData.getSensorType()));
        loraData.setMsgLength((long) (length10 / 2));
        loraData.setMsgVersion((long) version10);
        try{
            loraData.setAppName(loraAppService.selectLoraAppByAppEui(loraData.getAppEui()).getAppName());
        }catch (Exception e) {
            System.out.println("Error: " + e.getMessage());
        }
            //更新这条消息关联的业务终端、通信终端、网关接收数据的时间：last_msg_dt
        loraTerminalService.updateLastMsgTime(loraData.getSn());
        loraNodeService.updateLastMsgTime(loraData.getTerminalEui());
        loraGatewayService.updateLastMsgTime(loraData.getGwEui());
        //将数据发给app
        rabbitMqDataToApp(loraData);
        //将数据存入数据库
        loraDataService.insertLoraData(loraData);
        logger.debug(" ====================  " + "接收来自业务终端为" + loraData.getSn() + "的数据成功" + "  ==================== ");
        //编写返回信息
        String length,payloadBack;
        //新建此对象，查看APP是否修改阈值，如果修改，就搭在返回给NS的信息中
        LoginReturn loginReturn = loginReturnService.selectLoginReturnBySn(loraData.getSn());
        //编写返回给NS的json对象，包含：appEui、devEui、appId、payload、ack、msgId
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("appEui", loraData.getAppEui());
        jsonObject.put("devEui", loraData.getTerminalEui());
        System.out.println("报警标志   ："+loraData.getWarningFlag());
        //根据warningFlag判断此信息是随机/TDMA,
        if (loraData.getWarningFlag() == 0) {
            //如果是TDMA消息，则查看APP是否修改阈值，若修改，则更新返回负载
            jsonObject.put("appId", "1");
            //VirtualSubnet是一个标志，如为1，则说明app修改了阈值
            if (loginReturn.getVirtualSubnet() == 1) {
                String tlv = loginReturn.getPayload();
                length = int2Bin(10 + tlv.length() / 2, 16);
                payloadBack = bin2hex(length) + version16 + DATA_CONTROL + flow16 + SUCCESS + "000002" + tlv;
                //将更改标记置零
                loginReturn.setVirtualSubnet(0);
                loginReturnService.updateThresholdBySn(loginReturn);
            } else {
                length = int2Bin(7, 16);
                payloadBack = bin2hex(length) + version16 + DATA_SURE  + flow16 + "00";
            }
        } else {
            jsonObject.put("appId", "0");
                length = int2Bin(7, 16);
                payloadBack = bin2hex(length) + version16 + DATA_SURE + flow16 + "00";
//            }
        }
        jsonObject.put("payload", payloadBack);
        jsonObject.put("ack", "0000");
        jsonObject.put("msgId", "1");
        //将json转换为string
        String jss = jsonObject.toJSONString();
        //调用NS的返回接口
        String abc = respondToNsPost(jss);
        System.out.println(payloadBack);
        //打印NS的return
        System.out.println("NS返回的信息为：" + abc);
    }

    public void rabbitMqDataToApp(LoraData loraData) {
        ExecutorService threadPool = new ThreadPoolExecutor(2, 5,
                1L, TimeUnit.SECONDS,
                new LinkedBlockingQueue<>(3),
                Executors.defaultThreadFactory(),
                new ThreadPoolExecutor.AbortPolicy());
        threadPool.execute(() -> loraDataService.sendDataToApp(loraData));
    }



}