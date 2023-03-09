package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.List;
import java.util.Objects;

/**
 * @Description:
 * @author: Weiwang
 * @create: 2022-11-24-11-41
 */
public class LoginTerminal extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** terminalEui */
    @Excel(name = "terminalEui")
    private String terminalEui;

    /** terminalEui */
    @Excel(name = "appEui")
    private String appEui;

    /** 帧结构 */
    @Excel(name = "帧结构")
    private String[] appIds;

    public String[] getAppIds() {
        return appIds;
    }

    public void setAppIds(String[] appIds) {
        this.appIds = appIds;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        LoginTerminal that = (LoginTerminal) o;
        return Objects.equals(terminalEui, that.terminalEui) && Objects.equals(appEui, that.appEui) && Objects.equals(appIds, that.appIds);
    }

    @Override
    public int hashCode() {
        return Objects.hash(terminalEui, appEui, appIds);
    }

    public String getTerminalEui() {
        return terminalEui;
    }

    public void setTerminalEui(String terminalEui) {
        this.terminalEui = terminalEui;
    }

    public String getAppEui() {
        return appEui;
    }

    public void setAppEui(String appEui) {
        this.appEui = appEui;
    }

    public LoginTerminal() {
    }

    public LoginTerminal(String terminalEui, String appEui, String[] appIds) {
        this.terminalEui = terminalEui;
        this.appEui = appEui;
        this.appIds = appIds;
    }
}

