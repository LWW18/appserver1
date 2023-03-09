package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 业务终端（传感器） 对象 lora_terminal
 *
 * @author ruoyi
 * @date 2022-11-07
 */
public class LoraTerminal extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 终端id */
    private Long snId;

    /** sn = terminalEUI + sensorID */
    @Excel(name = "sn = terminalEUI + sensorID")
    private String sn;

    /** lora终端出厂Eui */
    @Excel(name = "lora终端出厂Eui")
    private String terminalEui;

    /** 关联的网关eui */
    @Excel(name = "关联的网关eui")
    private String gatewayEui;

    /** 传感器id：0~255 */
    @Excel(name = "传感器id：0~255")
    private Long sensorId;

    /** 服务类型(传感器类型) */
    @Excel(name = "服务类型(传感器类型)")
    private Integer sensorType;

    /** 终端设备的AppEUI */
    @Excel(name = "终端设备的AppEUI")
    private String appEui;

    /** 0 在线 1离线 默认在线 */
    @Excel(name = "0 在线 1离线 默认在线")
    private String runState;

    /** 0 未激活1 已激活 默认未激活 */
    @Excel(name = "0 未激活1 已激活 默认未激活")
    private String activeState;

    /** 最后一次发送消息时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后一次发送消息时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastMsgDt;

    /** 关联appID */
    @Excel(name = "关联appID")
    private Long appId;

    private String appName;

    private LoraApp app;

    /** MAC协议类型包括面向事件的随机接入（01）、面向传感器监测的周期接入（02）、面向广播与控制下行连接（03）等。 */
    @Excel(name = "MAC协议类型包括面向事件的随机接入", readConverterExp = "0=1")
    private String macType;

    /** 周期 */
    @Excel(name = "周期")
    private Long cycle;

    /** 传感器阈值最大值 */
    @Excel(name = "传感器阈值最大值")
    private String thresholdMax;

    /** 传感器阈值最小值 */
    @Excel(name = "传感器阈值最小值")
    private String thresholdMin;

    /** 传感器阈值当前值 */
    @Excel(name = "传感器阈值当前值")
    private String thresholdNow;

    /** TDMA周期 */
    @Excel(name = "TDMA周期")
    private Long tdmaCycle;

    /** TDMA时隙宽度 */
    @Excel(name = "TDMA时隙宽度")
    private Long tdmaWidth;





    /** 业务id：0~255 */
    @Excel(name = "传感器id：0~255")
    private String workId;


    public void setSnId(Long snId)
    {
        this.snId = snId;
    }

    public Long getSnId()
    {
        return snId;
    }
    public void setSn(String sn)
    {
        this.sn = sn;
    }

    public String getSn()
    {
        return sn;
    }
    public void setTerminalEui(String terminalEui)
    {
        this.terminalEui = terminalEui;
    }

    public String getTerminalEui()
    {
        return terminalEui;
    }
    public void setGatewayEui(String gatewayEui)
    {
        this.gatewayEui = gatewayEui;
    }

    public String getGatewayEui()
    {
        return gatewayEui;
    }
    public void setSensorId(Long sensorId)
    {
        this.sensorId = sensorId;
    }

    public Long getSensorId()
    {
        return sensorId;
    }
    public void setSensorType(Integer sensorType)
    {
        this.sensorType = sensorType;
    }

    public Integer getSensorType()
    {
        return sensorType;
    }
    public void setAppEui(String appEui)
    {
        this.appEui = appEui;
    }

    public String getAppEui()
    {
        return appEui;
    }
    public void setRunState(String runState)
    {
        this.runState = runState;
    }

    public String getRunState()
    {
        return runState;
    }
    public void setActiveState(String activeState)
    {
        this.activeState = activeState;
    }

    public String getActiveState()
    {
        return activeState;
    }
    public void setLastMsgDt(Date lastMsgDt)
    {
        this.lastMsgDt = lastMsgDt;
    }

    public Date getLastMsgDt()
    {
        return lastMsgDt;
    }
    public void setAppId(Long appId)
    {
        this.appId = appId;
    }

    public Long getAppId()
    {
        return appId;
    }

    public void setWorkId(String workId)
    {
        this.workId = workId;
    }

    public String getWorkId()
    {
        return workId;
    }




    public void setCycle(Long cycle)
    {
        this.cycle = cycle;
    }

    public Long getCycle()
    {
        return cycle;
    }
    public void setTdmaCycle(Long tdmaCycle)
    {
        this.tdmaCycle = tdmaCycle;
    }

    public Long getTdmaCycle()
    {
        return tdmaCycle;
    }
    public void setTdmaWidth(Long tdmaWidth)
    {
        this.tdmaWidth = tdmaWidth;
    }

    public Long getTdmaWidth()
    {
        return tdmaWidth;
    }




    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("snId", getSnId())
                .append("sn", getSn())
                .append("terminalEui", getTerminalEui())
                .append("gatewayEui", getGatewayEui())
                .append("sensorId", getSensorId())
                .append("sensorType", getSensorType())
                .append("appEui", getAppEui())
                .append("runState", getRunState())
                .append("activeState", getActiveState())
                .append("lastMsgDt", getLastMsgDt())
                .append("appId", getAppId())
                .append("appName",getAppName())
                .append("macType", getMacType())
                .append("thresholdMax", getThresholdMax())
                .append("thresholdMin", getThresholdMin())
                .append("thresholdNow", getThresholdNow())
                .append("cycle", getCycle())
                .append("tdmaCycle", getTdmaCycle())
                .append("tdmaWidth", getTdmaWidth())
                .append("workId", getWorkId())
                .toString();
    }

    public LoraTerminal() {
    }

    public LoraTerminal(Long snId, String sn, String terminalEui, String gatewayEui, Long sensorId, Integer sensorType,
                        String appEui, String runState, String activeState, Date lastMsgDt, Long appId, String appName,
                        LoraApp app, String macType, String thresholdMax,String thresholdMin, String thresholdNow,
                        Long cycle, Long tdmaCycle, Long tdmaWidth,String workId) {
        this.snId = snId;
        this.sn = sn;
        this.terminalEui = terminalEui;
        this.gatewayEui = gatewayEui;
        this.sensorId = sensorId;
        this.sensorType = sensorType;
        this.appEui = appEui;
        this.runState = runState;
        this.activeState = activeState;
        this.lastMsgDt = lastMsgDt;
        this.appId = appId;
        this.appName = appName;
        this.app = app;
        this.macType = macType;
        this.thresholdMax = thresholdMax;
        this.thresholdMin = thresholdMin;
        this.thresholdNow = thresholdNow;
        this.cycle = cycle;
        this.tdmaCycle = tdmaCycle;
        this.tdmaWidth = tdmaWidth;
        this.workId = workId;
    }

    public LoraApp getApp() {
        return app;
    }

    public void setApp(LoraApp app) {
        this.app = app;
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }

    public void setMacType(String macType)
    {
        this.macType = macType;
    }

    public String getMacType()
    {
        return macType;
    }

    public String getThresholdMax() {
        return thresholdMax;
    }

    public void setThresholdMax(String thresholdMax) {
        this.thresholdMax = thresholdMax;
    }

    public String getThresholdMin() {
        return thresholdMin;
    }

    public void setThresholdMin(String thresholdMin) {
        this.thresholdMin = thresholdMin;
    }

    public String getThresholdNow() {
        return thresholdNow;
    }

    public void setThresholdNow(String thresholdNow) {
        this.thresholdNow = thresholdNow;
    }
}
