package com.ruoyi.api.controller;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.system.domain.LoginReturn;
import com.ruoyi.system.domain.LoraTerminal;
import com.ruoyi.system.domain.WarningCome;
import com.ruoyi.system.service.ILoginReturnService;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ILoraTerminalService;
import lombok.extern.java.Log;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.*;

import static com.ruoyi.api.constant.DataConversion.*;
import static com.ruoyi.api.constant.SensorType.*;

/**
 * @Description: App询问或者下发数据、设备状态
 * 接口地址：/api/appServer/appStatus/NsAskAppStatus
 * @author: Wei wang
 * @create: 2022-10-17-11-44
 */

@Controller
@Log
@RequestMapping(value = "/api/appServer/appAsk")
public class UpAppAskController extends BaseController {
    @Resource
    ILoraAppService loraAppService;
    @Resource
    ILoraTerminalService loraTerminalService;
    @Resource
    ILoginReturnService loginReturnService;

    @Resource
    protected HttpServletRequest request;

    /**
     * APP询问所有业务终端状态
     * App发送appEui，然后返回给它所有绑定了此appEui的终端列表
     */
    @PostMapping(value = "/AppAskTerminalStatus")
    @ResponseBody
    public List<LoraTerminal> checkTerminalStateFromApp(String appEui) {
        LoraTerminal loraTerminal = new LoraTerminal();
        loraTerminal.setAppEui(appEui);
        startPage();
        return loraTerminalService.selectLoraTerminalList(loraTerminal);
    }

    /**
     * APP删除终端
     * App删除终端，发送给我们sn，不用告诉NS
     */
    @PostMapping(value = "/AppDeleteTerminal")
    @ResponseBody
    public String appDeleteTerminal() throws IOException {
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        LoraTerminal loraTerminal = JSON.parseObject(reader, LoraTerminal.class);
        String sn = loraTerminal.getSn();
        loraTerminalService.appDeleteLoraTerminalBySn(sn);
        System.out.println(sn);
        return "success";
    }

    /**
     * APP发送周期、阈值信息
     * APP调用 此接口，发送Json对象的String类型
     */
    @RequestMapping(value = "/AppEditTerminal", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    @ResponseBody
    public String appEditTerminal() throws IOException {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ====================      APP修改配置      ==================== ");
        logger.debug(" ====================  " + timestamp + "  ===================== ");
        //1.将从app侧接收到的JSON对象转换为LoraTerminal对象
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        LoginReturn loginReturn = JSON.parseObject(reader, LoginReturn.class);
        System.out.println("修改的内容为： 1.周期：" + loginReturn.getBusinessCycle()+"   2.阈值："+loginReturn.getThreshold());
        //2.判断APPServer数据库 lora_terminal 中是否存在该SN的信息
        if (loraTerminalService.selectLoraTerminalBySn(loginReturn.getSn()) == null) {
            return "APPServer没有找到该SN的业务终端信息。";
        }
        LoraTerminal loraTerminal = new LoraTerminal();
        //3.判断有APP有没有修改周期cycle
        if (loginReturn.getBusinessCycle() != null) {
            //修改loginReturn\loraTerminal中的周期
            loraTerminal.setSn(loginReturn.getSn());
            loraTerminal.setCycle(loginReturn.getBusinessCycle());
            System.out.println("修改后的周期：" + loraTerminal.getCycle());
            //tips：这个方法里包含了修改LoginReturn的cycle
            loraTerminalService.updateLoraTerminalCycleBySn(loraTerminal);
        }
        //4.判断有APP有没有修改阈值Threshold
        if (loginReturn.getThreshold() != null) {
            loraTerminal.setSn(loginReturn.getSn());
            loraTerminal.setThresholdNow(loginReturn.getThreshold());
            loraTerminalService.updateLoraTerminalBySn(loraTerminal);
            String ths = loginReturnService.selectLoginReturnBySn(loginReturn.getSn()).getThreshold();
            String[] th = ths.split(",");
            String[] three = loginReturn.getThreshold().split(",");
            for (int i = 0; i < three.length; i++) {
                //把数替换成threw[i]
                Arrays.fill(th, 1 + i * 3, 2 + i * 3, three[i]);
            }
            ths = Arrays.toString(th);
            ths = ths.replace(" ", "");
            ths = ths.replace("[", "");
            ths = ths.replace("]", "");
            th = ths.split(",");

            LoginReturn loginReturn1 = new LoginReturn();
            loginReturn1.setSn(loginReturn.getSn());
            loginReturn1.setThreshold(ths);

            String tlv = "";
            String length = "0004";
            if (loginReturn.getSensorType() == TILT) {
                tlv = "06" + length + floatToIeee754(Float.parseFloat(th[1])) +
                        "07" + length + floatToIeee754(Float.parseFloat(th[4])) +
                        "08" + length + floatToIeee754(Float.parseFloat(th[7]));
            } else if (loginReturn.getSensorType() == VIBRATION) {
                tlv = "26" + length + floatToIeee754(Float.parseFloat(th[1])) +
                        "27" + length + floatToIeee754(Float.parseFloat(th[4])) +
                        "28" + length + floatToIeee754(Float.parseFloat(th[7]));
            } else if (loginReturn.getSensorType() == ENVIRONMENT) {
                tlv = "42" + length + floatToIeee754(Float.parseFloat(th[1])) +
                        "43" + length + floatToIeee754(Float.parseFloat(th[4])) +
                        "44" + length + floatToIeee754(Float.parseFloat(th[7])) +
                        "45" + length + floatToIeee754(Float.parseFloat(th[10]));
            } else if (loginReturn.getSensorType() == LEVEL) {
                tlv = "54" + length + floatToIeee754(Float.parseFloat(th[1])) +
                        "55" + length + floatToIeee754(Float.parseFloat(th[4]));
            }
            loginReturn1.setPayload(tlv);
            loginReturn1.setVirtualSubnet(1);
            System.out.println("修改后的阈值：" + loginReturn1.getThreshold() + "payload为：" + loginReturn1.getPayload());
            loginReturnService.updateThresholdBySn(loginReturn1);
        }
        return "success";
    }

    /**
     * APP发送报警命令
     */

    @RequestMapping(value = "/appAlarmCommand", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    @ResponseBody
    public String appAlarmCommand() throws IOException{
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== enter appAlarmCommand ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");
        //判断是否具有此appEui信息
            //将接收到的数据转为LoginTerminal对象
           InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
           WarningCome warningCome = JSON.parseObject(reader, WarningCome.class);
           String appEui = warningCome.getAppEui();
           String[] sns = warningCome.getSns();
           int control = warningCome.getControl();
//        if (loraAppService.selectLoraAppByAppEui(appEui) == null) {
//            return "fail";
//        }
        StringBuilder abc = new StringBuilder();
        //将接收到的数据转为LoraTerminal对象
        for (int i = 0; i < sns.length; i++) {
            String sn = sns[i];
            //判断是否具有此报警器信息
            if (loraTerminalService.selectLoraTerminalBySn(sn) == null) {
                abc.append(" ").append(sn);
                System.out.println(abc);
                continue;
            }
            LoraTerminal loraTerminal = new LoraTerminal();
            loraTerminal.setSn(sn);
            loraTerminal.setAppEui(appEui);
            System.out.println("收到来自appEui为" + loraTerminal.getAppEui() + "的app发送的指向" + loraTerminal.getSn() + "报警命令");
            ExecutorService threadPool = new ThreadPoolExecutor(2, 5,
                    1L, TimeUnit.SECONDS,
                    new LinkedBlockingQueue<>(3),
                    Executors.defaultThreadFactory(),
                    new ThreadPoolExecutor.AbortPolicy());
            threadPool.execute(() -> {
                loraTerminalService.sendAlarmCommandToNs(loraTerminal,control); //将修改信息发给Ns
            });
        }
        return "success";
    }

}