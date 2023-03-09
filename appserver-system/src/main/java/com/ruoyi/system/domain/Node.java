package com.ruoyi.system.domain;

import lombok.Data;
import lombok.ToString;

import java.util.Date;

/**
 * @projectName：VIoT
 * @packageName：com.lpc.entity
 * @classDesc：
 * @creator：rocliu
 * @createTime：2018/7/20 上午10:12
 * @version：V1.0
 */
@Data
@ToString
public class Node {

    private Long id;

    private Byte devType;

    private String devEUI;

    private Integer devAddr;

    private String nwkSKey;

    private String appSkey;

    private String appkey;

    private String appEUI;

    private Date lastMsgDT;



    public String getAppEUI() {
        return appEUI;
    }

    public void setAppEUI(String appEUI) {
        this.appEUI = appEUI;
    }

    private String runState;

    private Boolean activeState;

    private Float battery;

    private Integer macType;

    private Integer fCnt;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Byte getDevType() {
        return devType;
    }

    public void setDevType(Byte devType) {
        this.devType = devType;
    }

    public String getDevEUI() {
        return devEUI;
    }

    public void setDevEUI(String devEUI) {
        this.devEUI = devEUI;
    }

    public Integer getDevAddr() {
        return devAddr;
    }

    public void setDevAddr(Integer devAddr) {
        this.devAddr = devAddr;
    }

    public String getNwkSKey() {
        return nwkSKey;
    }

    public void setNwkSKey(String nwkSKey) {
        this.nwkSKey = nwkSKey;
    }

    public String getAppSkey() {
        return appSkey;
    }

    public void setAppSkey(String appSkey) {
        this.appSkey = appSkey;
    }

    public String getAppkey() {
        return appkey;
    }

    public void setAppkey(String appkey) {
        this.appkey = appkey;
    }

    public String getRunState() {
        return runState;
    }

    public void setRunState(String runState) {
        this.runState = runState;
    }

    public Boolean getActiveState() {
        return activeState;
    }

    public void setActiveState(Boolean activeState) {
        this.activeState = activeState;
    }

    public Float getBattery() {
        return battery;
    }

    public void setBattery(Float battery) {
        this.battery = battery;
    }

    public Integer getMacType() {
        return macType;
    }

    public void setMacType(Integer macType) {
        this.macType = macType;
    }

    public Integer getfCnt() {
        return fCnt;
    }

    public void setfCnt(Integer fCnt) {
        this.fCnt = fCnt;
    }
}
