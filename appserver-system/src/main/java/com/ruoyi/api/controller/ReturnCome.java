package com.ruoyi.api.controller;


import com.alibaba.fastjson2.JSONObject;
import com.ruoyi.api.constant.ResultBuilder;
import lombok.extern.java.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


/**
 * @author liuweiwang
 */
@Controller
@Log
@RequestMapping(value = "/api/appServer/returnControl")
public class ReturnCome {
    private static final Logger logger = LoggerFactory.getLogger(LoraTerminalManagementFromNsController.class);
    /**
     *Ns发送控制命令的确认返回信息
     */
    @PostMapping(value = "/NsReturnControl")
    @ResponseBody
    public ResultBuilder nsReturnControl(@RequestBody JSONObject msg) {
        //打印日志及时间戳
        String appEui = msg.get("appEUI").toString();
        String terminalEui = msg.get("terminalEUI").toString();
        String payload = msg.get("recvData").toString();
        String result = msg.get("result").toString();
        System.out.println(appEui);
        System.out.println(terminalEui);
        System.out.println(payload);
        System.out.println(result);



        return new ResultBuilder(200);
    }
}
