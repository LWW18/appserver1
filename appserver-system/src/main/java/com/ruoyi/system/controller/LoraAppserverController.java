package com.ruoyi.system.controller;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.constant.AppServerConstants;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.LoraAppserver;
import com.ruoyi.system.service.ILoraAppserverService;

/**
 * AppServerController
 *    appServer向NS发送授权消息
 *    并且根据返回的AppserverId修改数据库信息
 *
 * @author ruoyi
 * @date 2022-11-10
 */
@RestController
@RequestMapping("/system/appserver")
public class LoraAppserverController extends BaseController
{
    @Autowired
    private ILoraAppserverService loraAppserverService;

    HttpUtils httpUtils = new HttpUtils();



    /**
     * 修改
     */
    @PreAuthorize("@ss.hasPermi('system:appserver:edit')")
    @Log(title = "【请填写功能名称】", businessType = BusinessType.UPDATE)
    @PutMapping
    public int auth()
    {
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverKey(AppServerConstants.APPSERVER_KEY);
        loraAppserver.setAppserverName(AppServerConstants.APPSERVER_NAME);
        String js = loraAppserver.toString();
//        String js = "{\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/APPServer/APPServerAuthorize", js);
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        return resultBuilder.getCode();
    }
}
