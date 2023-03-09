package com.ruoyi.api.constant;

import com.alibaba.fastjson2.JSONObject;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 返回语句格式
 *
 * @author Weiwang
 */

@Data
@ToString
public class ResultBuilder {
    public ResultBuilder(String data, int code, String message) {
         this.data = data;
         this.code = code;
         this.message = message;
         this.responseTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
     }

     public ResultBuilder(String data, StatusCode statusCode) {
        this.data = data;
        this.code = statusCode.getCode();
        this.message = statusCode.getMessage();
        this.responseTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

     public ResultBuilder(StatusCode statusCode) {
        this.code = statusCode.getCode();
        this.message = statusCode.getMessage();
        this.responseTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

     public ResultBuilder(StatusCode statusCode, String extendMsg) {
        this.code = statusCode.getCode();
        this.message = statusCode.getMessage();
        this.data = extendMsg;
        this.responseTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

     public ResultBuilder(int code, String message) {
        this.code = code;
        this.message = message;
        this.responseTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

     public ResultBuilder(int code) {
        this.code = code;
        this.responseTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
    }

     private int code;

     private String message;

     private String data;

     private String responseTime;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getResponseTime() {
        return responseTime;
    }

    public void setResponseTime(String responseTime) {
        this.responseTime = responseTime;
    }

    public ResultBuilder(int code, String message, String data, String responseTime) {
        this.code = code;
        this.message = message;
        this.data = data;
        this.responseTime = responseTime;
    }

    public ResultBuilder() {
    }

    public JSONObject toJSONObject() {
        JSONObject out = new JSONObject();
        out.put("code", code);
        out.put("message", message);
        out.put("data", data);
        out.put("responseTime", responseTime);
         return out;
     }



    @Override
    public String toString() {
       return toJSONObject().toString();
   }

}
