package com.ruoyi.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 lora_interface
 * 
 * @author ruoyi
 * @date 2023-02-13
 */
public class LoraInterface extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 发射功率 */
    @Excel(name = "发射功率")
    private Long transmitPower;

    /** 发射频率带宽 */
    @Excel(name = "发射频率带宽")
    private Long bandwidth;

    /** 扩频因子 */
    @Excel(name = "扩频因子")
    private Long spreadingFactor;

    /** 接口编号 */
    @Excel(name = "接口编号")
    private Long loraId;

    /** 波特率 */
    @Excel(name = "波特率")
    private Long band;

    /** 信道频率 */
    @Excel(name = "信道频率")
    private Long frequency;

    /** 网关eui */
    @Excel(name = "网关eui")
    private String gwEui;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setTransmitPower(Long transmitPower) 
    {
        this.transmitPower = transmitPower;
    }

    public Long getTransmitPower() 
    {
        return transmitPower;
    }
    public void setBandwidth(Long bandwidth) 
    {
        this.bandwidth = bandwidth;
    }

    public Long getBandwidth() 
    {
        return bandwidth;
    }
    public void setSpreadingFactor(Long spreadingFactor) 
    {
        this.spreadingFactor = spreadingFactor;
    }

    public Long getSpreadingFactor() 
    {
        return spreadingFactor;
    }
    public void setLoraId(Long loraId) 
    {
        this.loraId = loraId;
    }

    public Long getLoraId() 
    {
        return loraId;
    }
    public void setBand(Long band) 
    {
        this.band = band;
    }

    public Long getBand() 
    {
        return band;
    }
    public void setFrequency(Long frequency) 
    {
        this.frequency = frequency;
    }

    public Long getFrequency() 
    {
        return frequency;
    }
    public void setGwEui(String gwEui) 
    {
        this.gwEui = gwEui;
    }

    public String getGwEui() 
    {
        return gwEui;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("transmitPower", getTransmitPower())
            .append("bandwidth", getBandwidth())
            .append("spreadingFactor", getSpreadingFactor())
            .append("loraId", getLoraId())
            .append("band", getBand())
            .append("frequency", getFrequency())
            .append("gwEui", getGwEui())
            .toString();
    }
}
