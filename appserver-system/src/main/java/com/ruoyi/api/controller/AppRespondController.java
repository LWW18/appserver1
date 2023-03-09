package com.ruoyi.api.controller;

import com.alibaba.fastjson2.JSON;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.LoraTerminal;
import lombok.extern.java.Log;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * @Description: 与APP进行交流时，APP的回应接收器
 * @author: Wei wang
 * @create: 2022-10-17-11-44
 */

@Controller
@Log
@RequestMapping(value = "/api/appServer/appRespond")
public class AppRespondController extends BaseController {
    @Resource
    protected HttpServletRequest request;

    @GetMapping(value = "/appAlarmCommandBackMsg")
    @ResponseBody
    public void appAlarmCommandBackMsg() throws IOException {
        System.out.println("1234543212343");
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== enter appAlarmCommandBackMsg ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");
        //将接收到的数据转为LoraTerminal对象
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        LoraTerminal loraTerminal = JSON.parseObject(reader, LoraTerminal.class);
        System.out.println(loraTerminal);
        String js = "已将报警命令发送。";
        HttpUtils httpUtils = new HttpUtils();
        httpUtils.postMethod("http://112.74.93.170:54321/api/DataFromAPPServer/recData",js);
    }
}