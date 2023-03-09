package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 login_return
 *
 * @author ruoyi
 * @date 2022-11-25
 */
public class LoginReturn extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /**  */
    @Excel(name = "")
    private Long returnId;

    /**  */
    @Excel(name = "")
    private String workId;

    /** 业务周期 */
    @Excel(name = "业务周期")
    private Long businessCycle;

    /** TDMA周期 */
    @Excel(name = "TDMA周期")
    private Long tdmaCycle;

    /** 时隙宽度 */
    @Excel(name = "时隙宽度")
    private Long timeSlotWidth;

    /** 阈值 */
    @Excel(name = "阈值")
    private String threshold;

    /** 时间窗口 */
    @Excel(name = "时间窗口")
    private Long timeWindow;

    /**  */
    @Excel(name = "")
    private String sn;

    /** terminalEui */
    @Excel(name = "terminalEui")
    private String terminalEui;

    /** 帧结构 */
    @Excel(name = "帧结构")
    private String frame;

    /**  */
    @Excel(name = "")
    private Long sensorId;

    /**  */
    @Excel(name = "")
    private Integer sensorType;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String appEui;

    /** 入网状态 0：未入网 1：入网 */
    @Excel(name = "入网状态 0：未入网 1：入网")
    private String runState;

    /** 业务类型 */
    @Excel(name = "业务类型")
    private Integer appType;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String payload;

    private int ack;

    private int msgId;


    private Integer length;


    public Integer virtualSubnet;

    public void setReturnId(Long returnId)
    {
        this.returnId = returnId;
    }

    public Long getReturnId()
    {
        return returnId;
    }
    public void setWorkId( String workId)
    {
        this.workId = workId;
    }

    public  String getWorkId()
    {
        return workId;
    }
    public void setBusinessCycle(Long businessCycle)
    {
        this.businessCycle = businessCycle;
    }

    public Long getBusinessCycle()
    {
        return businessCycle;
    }

    public void setTdmaCycle(Long tdmaCycle)
    {
        this.tdmaCycle = tdmaCycle;
    }

    public Long getTdmaCycle()
    {
        return tdmaCycle;
    }
    public void setTimeSlotWidth(Long timeSlotWidth)
    {
        this.timeSlotWidth = timeSlotWidth;
    }

    public Long getTimeSlotWidth()
    {
        return timeSlotWidth;
    }
    public void setThreshold(String threshold)
    {
        this.threshold = threshold;
    }

    public String getThreshold()
    {
        return threshold;
    }
    public void setTimeWindow(Long timeWindow)
    {
        this.timeWindow = timeWindow;
    }

    public Long getTimeWindow()
    {
        return timeWindow;
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
    public void setFrame(String frame)
    {
        this.frame = frame;
    }

    public String getFrame()
    {
        return frame;
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
    public void setAppType(Integer appType)
    {
        this.appType = appType;
    }

    public Integer getAppType()
    {
        return appType;
    }
    public void setPayload(String payload)
    {
        this.payload = payload;
    }

    public String getPayload()
    {
        return payload;
    }

    public Integer getLength() {
        return length;
    }



    public void setLength(Integer length) {
        this.length = length;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("returnId", getReturnId())
                .append("workId", getWorkId())
                .append("businessCycle", getBusinessCycle())
                .append("tdmaCycle", getBusinessCycle())
                .append("timeSlotWidth", getTimeSlotWidth())
                .append("threshold", getThreshold())
                .append("timeWindow", getTimeWindow())
                .append("sn", getSn())
                .append("terminalEui", getTerminalEui())
                .append("frame", getFrame())
                .append("sensorId", getSensorId())
                .append("sensorType", getSensorType())
                .append("appEui", getAppEui())
                .append("runState", getRunState())
                .append("appType", getAppType())
                .append("payload", getPayload())
                .append("virtualSubnet",getVirtualSubnet())
                .toString();
    }

    @Override
    public String toCycleString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("workId", getWorkId())
                .append("appType", getAppType())
                .append("businessCycle", getBusinessCycle())
                .append("length", getLength())
                .append("payload", getPayload())
                .toString();
    }

    @Override
    public String toRandomString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("workId", getWorkId())
                .append("appType", getAppType())
                .append("timeWindow", getTimeWindow())
                .append("length", getLength())
                .append("payload", getPayload())
                .toString();
    }

    @Override
    public String toRealTimeString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("workId", getWorkId())
                .append("appType", getAppType())
                .append("length", getLength())
                .append("payload", getPayload())
                .toString();
    }

    @Override
    public String toAppEditString(){
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("appEui",getAppEui())
                .append("devEui", getTerminalEui())
                .append("appId", getWorkId())
                .append("payload", getPayload())
                .append("ACK", getAck())
                .append("msgId",getMsgId())
                .toString();
    }

    public Integer getVirtualSubnet() {
        return virtualSubnet;
    }

    public void setVirtualSubnet(Integer virtualSubnet) {
        this.virtualSubnet = virtualSubnet;
    }
    public int getAck() {
        return ack;
    }

    public void setAck(int ack) {
        this.ack = ack;
    }

    public int getMsgId() {
        return msgId;
    }

    public void setMsgId(int msgId) {
        this.msgId = msgId;
    }
}
