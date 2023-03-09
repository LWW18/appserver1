package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 网关对象 lora_gateway
 *
 * @author ruoyi
 * @date 2022-11-11
 */
public class LoraGateway extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 网关ID，整数，0~4,294,967,296 */
    @Excel(name = "网关ID，整数，0~4,294,967,296")
    private String gwEui;

    /** 网关名称 */
    @Excel(name = "网关名称")
    private String name;

    /** 网关固件版本 */
    @Excel(name = "网关固件版本")
    private String fwVersion;

    /** 网关当前状态  0.未注册（平台侧网关初始化完成后的状态-创建后）1.	工作状态；2.	不在线（接入注册完成，网关不在线）；3.	被BAR状态；4.	异常状态；（ 1供电切断，改电池供电 2 LOAR 发送阻塞 3 LOAR 接收阻塞）5.	OTA版本升级状态； */
    @Excel(name = "网关当前状态  0.未注册", readConverterExp = "平=台侧网关初始化完成后的状态-创建后")
    private Integer runState;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createDt;

    /** 注册时间，接收到第一次注册消息时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "注册时间，接收到第一次注册消息时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date regDt;

    /** 最后一次连接时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "最后一次连接时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastConnDt;

    /** 最后一次发送消息时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "最后一次发送消息时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date lastMsgDt;

    /** 电池剩余容量，0~100，电池容量百分比 */
    @Excel(name = "电池剩余容量，0~100，电池容量百分比")
    private Long battery;

    /** 供电类型，1、市电，2、太阳能，3poe，4电池 */
    @Excel(name = "供电类型，1、市电，2、太阳能，3poe，4电池")
    private Integer powerType;

    /** 网关位置：4546.40891,N,12639.65641,E字段1：纬度ddmm.mmmm，度分格式字段2：纬度N（北纬）或S（南纬）字段3：经度dddmm.mmmm，度分格式字段4：经度E（东经）或W（西经）位数不够后面补‘\\0’。 */
    @Excel(name = "网关位置：4546.40891,N,12639.65641,E字段1：纬度ddmm.mmmm，度分格式字段2：纬度N", readConverterExp = "北=纬")
    private String gps;

    /** 共有几个Lora接口，由网关注册时更新。 */
    @Excel(name = "共有几个Lora接口，由网关注册时更新。")
    private Long loraCount;

    /** 本次登录的IP地址 */
    @Excel(name = "本次登录的IP地址")
    private String remoteIpAddress;

    /** 控制字1字节，待定 */
    @Excel(name = "控制字1字节，待定")
    private Integer controlWord;

    /** 网络ID（NetID）2字节 */
    @Excel(name = "网络ID", readConverterExp = "N=etID")
    private Long netId;

    /** 网关ID2字节 */
    @Excel(name = "网关ID2字节")
    private Long gatewayId;

    /** 网络连接类型 1 4G;2 WAN；3 WLAN */
    @Excel(name = "网络连接类型 1 4G;2 WAN；3 WLAN")
    private Long linkType;

    /** 可用Lora数 */
    @Excel(name = "可用Lora数")
    private Long usableLoraCount;

    /** FRP(内网穿透)开启状态，0：开启，1：关闭，3：正在修改 */
    @Excel(name = "FRP(内网穿透)开启状态，0：开启，1：关闭，3：正在修改")
    private Integer frpState;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setGwEui(String gwEui)
    {
        this.gwEui = gwEui;
    }

    public String getGwEui()
    {
        return gwEui;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setFwVersion(String fwVersion)
    {
        this.fwVersion = fwVersion;
    }

    public String getFwVersion()
    {
        return fwVersion;
    }
    public void setRunState(Integer runState)
    {
        this.runState = runState;
    }

    public Integer getRunState()
    {
        return runState;
    }
    public void setCreateDt(Date createDt)
    {
        this.createDt = createDt;
    }

    public Date getCreateDt()
    {
        return createDt;
    }
    public void setRegDt(Date regDt)
    {
        this.regDt = regDt;
    }

    public Date getRegDt()
    {
        return regDt;
    }
    public void setLastConnDt(Date lastConnDt)
    {
        this.lastConnDt = lastConnDt;
    }

    public Date getLastConnDt()
    {
        return lastConnDt;
    }
    public void setLastMsgDt(Date lastMsgDt)
    {
        this.lastMsgDt = lastMsgDt;
    }

    public Date getLastMsgDt()
    {
        return lastMsgDt;
    }
    public void setBattery(Long battery)
    {
        this.battery = battery;
    }

    public Long getBattery()
    {
        return battery;
    }
    public void setPowerType(Integer powerType)
    {
        this.powerType = powerType;
    }

    public Integer getPowerType()
    {
        return powerType;
    }
    public void setGps(String gps)
    {
        this.gps = gps;
    }

    public String getGps()
    {
        return gps;
    }
    public void setLoraCount(Long loraCount)
    {
        this.loraCount = loraCount;
    }

    public Long getLoraCount()
    {
        return loraCount;
    }
    public void setRemoteIpAddress(String remoteIpAddress)
    {
        this.remoteIpAddress = remoteIpAddress;
    }

    public String getRemoteIpAddress()
    {
        return remoteIpAddress;
    }
    public void setControlWord(Integer controlWord)
    {
        this.controlWord = controlWord;
    }

    public Integer getControlWord()
    {
        return controlWord;
    }
    public void setNetId(Long netId)
    {
        this.netId = netId;
    }

    public Long getNetId()
    {
        return netId;
    }
    public void setGatewayId(Long gatewayId)
    {
        this.gatewayId = gatewayId;
    }

    public Long getGatewayId()
    {
        return gatewayId;
    }
    public void setLinkType(Long linkType)
    {
        this.linkType = linkType;
    }

    public Long getLinkType()
    {
        return linkType;
    }
    public void setUsableLoraCount(Long usableLoraCount)
    {
        this.usableLoraCount = usableLoraCount;
    }

    public Long getUsableLoraCount()
    {
        return usableLoraCount;
    }
    public void setFrpState(Integer frpState)
    {
        this.frpState = frpState;
    }

    public Integer getFrpState()
    {
        return frpState;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("gwEui", getGwEui())
                .append("name", getName())
                .append("fwVersion", getFwVersion())
                .append("runState", getRunState())
                .append("createDt", getCreateDt())
                .append("regDt", getRegDt())
                .append("lastConnDt", getLastConnDt())
                .append("lastMsgDt", getLastMsgDt())
                .append("battery", getBattery())
                .append("powerType", getPowerType())
                .append("gps", getGps())
                .append("loraCount", getLoraCount())
                .append("remoteIpAddress", getRemoteIpAddress())
                .append("controlWord", getControlWord())
                .append("netId", getNetId())
                .append("gatewayId", getGatewayId())
                .append("linkType", getLinkType())
                .append("usableLoraCount", getUsableLoraCount())
                .append("frpState", getFrpState())
                .toString();
    }
}
