package com.ruoyi.system.domain;

import com.ruoyi.common.annotation.Excel;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * @author liuweiwang
 */
public class WarningCome {

    private static final long serialVersionUID = 1L;


    private String[] sns;

    private String appEui;
    private Integer control;

    private Integer time;

    public String[] getSns() {
        return sns;
    }

    public void setSns(String[] sns) {
        this.sns = sns;
    }

    public String getAppEui() {
        return appEui;
    }

    public void setAppEui(String appEui) {
        this.appEui = appEui;
    }

    public Integer getControl() {
        return control;
    }

    public void setControl(Integer control) {
        this.control = control;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("appEui", getAppEui())
                .append("sns", getSns())
                .append("control", getControl())
                .append("time",getTime())
                .toString();
    }

    public Integer getTime() {
        return time;
    }

    public void setTime(Integer time) {
        this.time = time;
    }
}
