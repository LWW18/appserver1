package com.ruoyi.api.controller;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson2.JSON;
import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.LoraApp;
import com.ruoyi.system.domain.LoraAppserver;
import com.ruoyi.system.domain.LoraTerminal;
import com.ruoyi.system.domain.TerminalGateway;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ILoraTerminalService;
import lombok.extern.java.Log;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;


/**
 * @Description: Ns询问App的状态 发送方：Ns 接收方：AppServer
 *                 接口地址：/api/appServer/appStatus/NsAskAppStatus
 * @author: Wei wang
 * @create: 2022-10-17-11-44
 */

@Controller
@Log
@RequestMapping(value = "/api/appServer/appStatus",method = RequestMethod.GET)
public class NsAskController extends BaseController {

    @Resource
    ILoraAppService loraAppService;
    @Resource
    ILoraTerminalService loraTerminalService;

    /**
     *Ns询问App的状态
     * 返回resultBuilder型：
     *     APP_UNAUTH(2004,"App未授权")
     *     APP_AUTH(2005,"App已授权")
     *     APP_UNEXIST(2006,"App不存在")
     */
    @GetMapping(value = "/NsAskAppStatus")
    @ResponseBody
    public ResultBuilder checkAppAuthFromNs(LoraApp loraApp) {
        return loraAppService.checkAppAuthFromNs(loraApp);
    }

    public void recDataFromAs(){
        //向Ns获取最新的业务终端运行状态
        //（其实Ns只知道Lora终端的运行状态，所以通过查询传感器绑定的终端，将该终端下所有传感器设备设置为同样的运行状态
        //调用Http 发送post请求的方法
        HttpUtils httpUtils = new HttpUtils();
        //请求参数为Json，我们先把Appserver对象列出来，再转成Json格式
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverName("01223");
        loraAppserver.setAppserverId("58d18f8b-8528-4140-88d4-de44187324cc");
        loraAppserver.setAppserverKey("01234567");
        String js1 =   loraAppserver.toString();

        HashMap<String,Object> map = new HashMap<>();
        map.put("appServerId",loraAppserver.getAppserverId());
        map.put("appServerName",loraAppserver.getAppserverName());
        map.put("appServerKey",loraAppserver.getAppserverKey());
        String map1 = map.toString();

        String js = "{\"appServerId\":\"58d18f8b-8528-4140-88d4-de44187324cc\",\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/node/queryTerminalGatewayList", map1);
        //将Ns返回的结果转换为ResultBuilder
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        //提取ResultBuilder中的data：loraAppserverList (String)
        String loraAppserverList = resultBuilder.getData();
        //将String的loarAppserverList 转换为 String列表

        List<TerminalGateway> loraTerminalGatewayList1 = JSON.parseArray(loraAppserverList,TerminalGateway.class);
        for (TerminalGateway terminalGateway : loraTerminalGatewayList1) {
            LoraTerminal loraTerminal1 = new LoraTerminal();
            loraTerminal1.setTerminalEui(terminalGateway.getTerminalEui());
            loraTerminal1.setGatewayEui(terminalGateway.getGatewayEui());
            loraTerminalService.changeGatewayByEui(loraTerminal1);
        }
    }




    }
