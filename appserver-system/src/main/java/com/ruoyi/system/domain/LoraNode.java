package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 传感器 对象 lora_node
 *
 * @author ruoyi
 * @date 2022-11-21
 */
public class LoraNode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 终端id */
    private Long terminalId;

    /** 终端EUI */
    @Excel(name = "终端EUI")
    private String terminalEui;

    /** 0 未激活1 已激活 */
    private Integer activeState;

    /** 运行状态 */
    private String runState;

    /** 电池电量 */
    private Long battery;

    /** 最后一次发送消息时间 */

    private Date lastMsgDt;

    /** 网关id */
    @Excel(name = "网关EUI")
    private String gatewayEui;

    /** 关联appEui */
    @Excel(name = "关联appEui")
    private String appEui;

    /** 关联appEui */

    private String appName;

    /** mac是否具有随机类型：否：0   是：1 */

    private String random;

    /** mac是否具有TDMA类型：否：0 是：1 */

    private String tdma;

    /** mac是否具有实时类型：否：0 是：1 */

    private String realTime;

    public void setTerminalId(Long terminalId)
    {
        this.terminalId = terminalId;
    }

    public Long getTerminalId()
    {
        return terminalId;
    }
    public void setTerminalEui(String terminalEui)
    {
        this.terminalEui = terminalEui;
    }

    public String getTerminalEui()
    {
        return terminalEui;
    }
    public void setActiveState(Integer activeState)
    {
        this.activeState = activeState;
    }

    public Integer getActiveState()
    {
        return activeState;
    }
    public void setRunState(String runState)
    {
        this.runState = runState;
    }

    public String getRunState()
    {
        return runState;
    }
    public void setBattery(Long battery)
    {
        this.battery = battery;
    }

    public Long getBattery()
    {
        return battery;
    }
    public void setLastMsgDt(Date lastMsgDt)
    {
        this.lastMsgDt = lastMsgDt;
    }

    public Date getLastMsgDt()
    {
        return lastMsgDt;
    }
    public void setGatewayEui(String gatewayEui)
    {
        this.gatewayEui = gatewayEui;
    }

    public String getGatewayEui()
    {
        return gatewayEui;
    }
    public void setAppEui(String appEui)
    {
        this.appEui = appEui;
    }

    public String getAppEui()
    {
        return appEui;
    }
    public void setRandom(String random)
    {
        this.random = random;
    }

    public String getRandom()
    {
        return random;
    }
    public void setTdma(String tdma)
    {
        this.tdma = tdma;
    }

    public String getTdma()
    {
        return tdma;
    }
    public void setRealTime(String realTime)
    {
        this.realTime = realTime;
    }

    public String getRealTime()
    {
        return realTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("terminalId", getTerminalId())
                .append("terminalEui", getTerminalEui())
                .append("activeState", getActiveState())
                .append("runState", getRunState())
                .append("battery", getBattery())
                .append("lastMsgDt", getLastMsgDt())
                .append("gatewayEui", getGatewayEui())
                .append("appEui", getAppEui())
                .append("appName", getAppName())
                .append("random", getRandom())
                .append("tdma", getTdma())
                .append("realTime", getRealTime())
                .toString();
    }

    public String getAppName() {
        return appName;
    }

    public void setAppName(String appName) {
        this.appName = appName;
    }
}
