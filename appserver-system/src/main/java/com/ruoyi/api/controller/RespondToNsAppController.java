package com.ruoyi.api.controller;

import com.ruoyi.common.utils.http.HttpUtils;

import static com.ruoyi.api.constant.IpAdress.IP54321;

/**
 * @author liuweiwang
 */
public class RespondToNsAppController {

    /**
     * 向NS发送返回信息
     */
    public static String respondToNsPost(String js){
        HttpUtils httpUtils = new HttpUtils();
        return httpUtils.postMethod(IP54321+"/api/DataFromAPPServer/recData",js);
    }

    public static String respondToApp(String js){
        HttpUtils httpUtils = new HttpUtils();
        return httpUtils.postMethod(IP54321+"/api/DataFromAPPServer/recData",js);
    }
}
