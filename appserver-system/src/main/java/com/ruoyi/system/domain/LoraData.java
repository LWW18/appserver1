package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * appserver帧数据对象 lora_data
 *
 * @author ruoyi
 * @date 2023-02-22
 */
public class LoraData extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 数据ID */
    private Long dataId;

    /** 终端设备Eui */
    @Excel(name = "终端设备Eui")
    private String terminalEui;

    /** 传感器ID */
    @Excel(name = "传感器ID")
    private Long sensorId;

    /** 传感器sn */
    @Excel(name = "传感器sn")
    private String sn;

    /** 网关eui */
    @Excel(name = "网关eui")
    private String gwEui;

    /** appEui */
    @Excel(name = "appEui")
    private String appEui;

    /** 传感器数据类型 */
    @Excel(name = "传感器数据类型")
    private Integer sensorType;

    /** 接收数据的十六进制字符串 */
    @Excel(name = "接收数据的十六进制字符串")
    private String recvData;

    /** 解析后的数据内容 */
    @Excel(name = "解析后的数据内容")
    private String recvAfterdata;

    /** appserver接收时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "appserver接收时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date recvTime;

    /** 消息内容长度 */
    @Excel(name = "消息内容长度")
    private Long msgLength;

    /** 是否已读 */
    @Excel(name = "是否已读")
    private String readFlag;

    /** 消息版本号 */
    @Excel(name = "消息版本号")
    private Long msgVersion;

    /** 是否为报警消息，是报警消息：1 */
    @Excel(name = "是否为报警消息，是报警消息：1")
    private int warningFlag;

    /** 业务类型 */
    @Excel(name = "业务类型")
    private Integer appType;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private String appName;

    public void setDataId(Long dataId)
    {
        this.dataId = dataId;
    }

    public Long getDataId()
    {
        return dataId;
    }
    public void setTerminalEui(String terminalEui)
    {
        this.terminalEui = terminalEui;
    }

    public String getTerminalEui()
    {
        return terminalEui;
    }
    public void setSensorId(Long sensorId)
    {
        this.sensorId = sensorId;
    }

    public Long getSensorId()
    {
        return sensorId;
    }
    public void setSn(String sn)
    {
        this.sn = sn;
    }

    public String getSn()
    {
        return sn;
    }
    public void setGwEui(String gwEui)
    {
        this.gwEui = gwEui;
    }

    public String getGwEui()
    {
        return gwEui;
    }
    public void setAppEui(String appEui)
    {
        this.appEui = appEui;
    }

    public String getAppEui()
    {
        return appEui;
    }
    public void setSensorType(Integer sensorType)
    {
        this.sensorType = sensorType;
    }

    public Integer getSensorType()
    {
        return sensorType;
    }
    public void setRecvData(String recvData)
    {
        this.recvData = recvData;
    }

    public String getRecvData()
    {
        return recvData;
    }
    public void setRecvAfterdata(String recvAfterdata)
    {
        this.recvAfterdata = recvAfterdata;
    }

    public String getRecvAfterdata()
    {
        return recvAfterdata;
    }
    public void setRecvTime(Date recvTime)
    {
        this.recvTime = recvTime;
    }

    public Date getRecvTime()
    {
        return recvTime;
    }
    public void setMsgLength(Long msgLength)
    {
        this.msgLength = msgLength;
    }

    public Long getMsgLength()
    {
        return msgLength;
    }
    public void setReadFlag(String readFlag)
    {
        this.readFlag = readFlag;
    }

    public String getReadFlag()
    {
        return readFlag;
    }
    public void setMsgVersion(Long msgVersion)
    {
        this.msgVersion = msgVersion;
    }

    public Long getMsgVersion()
    {
        return msgVersion;
    }
    public void setWarningFlag(int warningFlag)
    {
        this.warningFlag = warningFlag;
    }

    public int getWarningFlag()
    {
        return warningFlag;
    }
    public void setAppType(Integer appType)
    {
        this.appType = appType;
    }

    public Integer getAppType()
    {
        return appType;
    }
    public void setAppName(String appName)
    {
        this.appName = appName;
    }

    public String getAppName()
    {
        return appName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("dataId", getDataId())
                .append("terminalEui", getTerminalEui())
                .append("sensorId", getSensorId())
                .append("sn", getSn())
                .append("gwEui", getGwEui())
                .append("appEui", getAppEui())
                .append("sensorType", getSensorType())
                .append("recvData", getRecvData())
                .append("recvAfterdata", getRecvAfterdata())
                .append("recvTime", getRecvTime())
                .append("msgLength", getMsgLength())
                .append("readFlag", getReadFlag())
                .append("msgVersion", getMsgVersion())
                .append("warningFlag", getWarningFlag())
                .append("appType", getAppType())
                .append("appName", getAppName())
                .toString();
    }
}
