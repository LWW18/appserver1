package com.ruoyi.api.controller;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.ILoginReturnService;
import com.ruoyi.system.service.ILoraNodeService;
import com.ruoyi.system.service.ILoraTerminalService;
import lombok.extern.java.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import java.util.List;
import java.util.Objects;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.*;

import static com.ruoyi.api.constant.CodeAndData.ERROR_APPID;
import static com.ruoyi.api.constant.TerminalServiceCode.*;

/**
 * @Description: 终端入网、退网、删除
 * @author: Wei wang
 * @create: 2022-11-21-12-00
 */
@Controller
@Log
@RequestMapping(value = "/api/appServer/terminalManagement", method = RequestMethod.POST)
public class LoraTerminalManagementFromNsController extends BaseController {

    /**
     * 日志
     */
    private static final Logger logger = LoggerFactory.getLogger(LoraTerminalManagementFromNsController.class);
    @Resource
    private ILoraTerminalService loraTerminalService;
    @Resource
    private ILoraNodeService loraNodeService;
    @Resource
    private ILoginReturnService loginReturnService;
    @Resource
    protected HttpServletRequest request;

    /**
     * 通信终端入网
     */
    @RequestMapping(value = "/loginTerminal", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult loginTerminal() throws IOException {
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ====================  enter loginTerminal  ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");

        //将接收到的数据转为LoginTerminal对象
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        LoginTerminal loginTerminal = JSON.parseObject(reader, LoginTerminal.class);

        if (Objects.equals(loginTerminal.getAppIds()[0], ERROR_APPID)){
            System.out.println(loginTerminal.getTerminalEui()+ "的appId不规范,可能是通信终端没有扫描到传感器。");
            return new AjaxResult(600,"appId不规范");
        }
        //检验数据库中是否有此终端，若无，则补充该终端信息(测试时使用)
        loraNodeService.checkNodeByEui(loginTerminal.getTerminalEui(), loginTerminal.getAppEui());
        //检验数据库中是否相关传感器，若无，则补充该传感器信息（包括补充业务）嵌入式的传感器类型记录，比AS-1
        String sn = loginTerminal.getTerminalEui()
                + String.format("%03d", Integer.parseInt(loginTerminal.getAppIds()[0].substring(1, 2)))
                + String.format("%02d", Integer.parseInt(loginTerminal.getAppIds()[0].substring(0, 1)) - 1);
        loraTerminalService.checkTerminalBySn(sn, loginTerminal.getAppEui());
        //检验数据库中是否相关传感器配置信息，若无，则补充该传感器信息（包括补充业务）
        if (loginReturnService.selectLoginReturnBySn(sn) == null) {
            loginReturnService.checkTerminalBySn(sn, loginTerminal.getAppEui());
        }

        //激活终端、传感器、业务
        loraNodeService.loginTerminal(loginTerminal.getTerminalEui());
        loraTerminalService.loginTerminal(loginTerminal.getTerminalEui());
        loginReturnService.loginApp(sn);

        //告诉app业务终端入网：
        for (int i = 0; i < loraTerminalService.selectLoraTerminalListByEui(loginTerminal.getTerminalEui()).size(); i++) {
            rabbitMqTerminalToApp(loraTerminalService.selectLoraTerminalListByEui(loginTerminal.getTerminalEui()).get(i),
                    loginTerminal.getAppEui(),
                    ONLINE_TERMINAL);
        }
        //loginReturnList: 数据库中对应的appId列表，将作为返回信息集合使用
        //编写返回信息
        List<String> loginReturnList = loginReturnService.writeLoginTerminalReturnMsg(sn);
        //编写总的返回信息
        String js = "{" +
                "\"appEui\":" + loginTerminal.getAppEui() + "," +
                "\"terminalEUi\":" + loginTerminal.getTerminalEui() + "," +
                "\"appIDs\":" + loginReturnList +
                "}";
        //返回入网成功结果
        return new AjaxResult(200, "success", js);
    }

    /**
     * 通信终端退网（修改在线状态run_state）
     */
    @RequestMapping(value = "/logoutTerminal", method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult logoutTerminal(String terminalEui) {
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== logout logoutTerminal ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");

        //通信终端、业务终端、业务退网
        loraNodeService.logoutTerminal(terminalEui);
        loraTerminalService.logoutTerminalByEui(terminalEui);
        loginReturnService.logoutTerminalByEui(terminalEui);
        logger.debug("====================terminalEui为'" + terminalEui + "'的终端退网成功====================");
        //新建LoraTerminal对象，设置其terminalEui，据此来查找有几个传感器，来告诉app
        LoraTerminal loraTerminal = new LoraTerminal();
        loraTerminal.setTerminalEui(terminalEui);
        //告诉app业务终端退网
        for (int i = 0; i < loraTerminalService.selectLoraTerminalListByEui(terminalEui).size(); i++) {
            System.out.println("1111111");
            rabbitMqTerminalToApp(loraTerminalService.selectLoraTerminalListByEui(terminalEui).get(i), loraTerminal.getAppEui(), OUTLINE_TERMINAL);
        }
        return AjaxResult.success();
    }

    /**
     * 删除（注销）lora终端信息
     */
    @RequestMapping(value = "/deleteTerminal", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.GET)
    @ResponseBody
    public AjaxResult deleteTerminal() throws IOException {
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== enter deleteApp ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");
        //将接收到的数据转为LoraNode对象
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        LoraNode loraNode = JSON.parseObject(reader, LoraNode.class);
        //删除lora终端信息
        loraNodeService.deleteLoraTerminalByEui(loraNode.getTerminalEui());
        //删除该lora终端下绑定的业务终端
        loraTerminalService.deleteLoraTerminalByEui(loraNode.getTerminalEui());
        logger.debug("====================terminalEui为'" + (loraNode.getTerminalEui()) + "'的lora终端删除成功====================");
        LoraTerminal loraTerminal = new LoraTerminal();
        loraTerminal.setTerminalEui(loraNode.getTerminalEui());
        //告诉App删除
        for (int i = 0; i < loraTerminalService.selectLoraTerminalList(loraTerminal).size(); i++) {
            rabbitMqTerminalToApp(loraTerminalService.selectLoraTerminalList(loraTerminal).get(i),
                    loraNode.getAppEui(),
                    DELETE_TERMINAL);
        }
        return AjaxResult.success();
    }

    public void rabbitMqTerminalToApp(LoraTerminal loraTerminal, String appEui, int serviceType) {
        ExecutorService threadPool = new ThreadPoolExecutor(2, 5,
                1L, TimeUnit.SECONDS,
                new LinkedBlockingQueue<>(3),
                Executors.defaultThreadFactory(),
                new ThreadPoolExecutor.AbortPolicy());
        threadPool.execute(() -> loraTerminalService.sendTerminalMsgToApp(loraTerminal,
                appEui,
                serviceType));
    }
}


