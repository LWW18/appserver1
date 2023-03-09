package com.ruoyi.system.domain;

import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;


/**
 * 终端-网关关联表
 *
 * @author ruoyi
 * @date 2022-11-07
 */
public class TerminalGateway extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** lora终端eui */
    private String terminalEui;

    /** 网关eui */
    private String GatewayEui;



    public void setTerminalEui(String terminalEui)
    {
        this.terminalEui = terminalEui;
    }

    public String getTerminalEui()
    {
        return terminalEui;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)

                .append("terminalEui", getTerminalEui())
                .append("gatewayEui", getGatewayEui())

                .toString();
    }


    public String getGatewayEui() {
        return GatewayEui;
    }

    public void setGatewayEui(String gatewayEui) {
        GatewayEui = gatewayEui;
    }
}
