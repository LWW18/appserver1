package com.ruoyi.system.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.annotation.Excel;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 应用对象 lora_app
 *
 * @author ruoyi
 * @date 2022-11-06
 */
public class LoraApp extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 应用id */
    private Long appId;

    /** appEui */
    @Excel(name = "appEui")
    private String appEui;

    /** app密钥 */
    @Excel(name = "app密钥")
    private String appSecret;

    /** 应用名称 */
    @Excel(name = "应用名称")
    private String appName;

    /** 应用描述 */
    @Excel(name = "应用描述")
    private String descript;

    /** 连接终端数量 */
    @Excel(name = "连接终端数量")
    private Long terminals;

    /** 管理者名字 */
    @Excel(name = "管理者名字")
    private String managerName;

    /** 联系电话 */
    @Excel(name = "联系电话")
    private String phone;

    /** 授权结束日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "授权结束日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date timeto;

    /** 授权状态 0：已授权 1：未授权 */
    @Excel(name = "授权状态 0：已授权 1：未授权")
    private String authState;

    /** APP版本号 */
    @Excel(name = "APP版本号")
    private String version;

    /** 公司 */
    @Excel(name = "公司")
    private String company;

    /** 授权起始日期 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "授权起始日期", width = 30, dateFormat = "yyyy-MM-dd")
    private Date authStarttime;

    public void setAppId(Long appId)
    {
        this.appId = appId;
    }

    public Long getAppId()
    {
        return appId;
    }
    public void setAppEui(String appEui)
    {
        this.appEui = appEui;
    }

    public String getAppEui()
    {
        return appEui;
    }
    public void setAppSecret(String appSecret)
    {
        this.appSecret = appSecret;
    }

    public String getAppSecret()
    {
        return appSecret;
    }
    public void setAppName(String appName)
    {
        this.appName = appName;
    }

    public String getAppName()
    {
        return appName;
    }
    public void setDescript(String descript)
    {
        this.descript = descript;
    }

    public String getDescript()
    {
        return descript;
    }
    public void setTerminals(Long terminals)
    {
        this.terminals = terminals;
    }

    public Long getTerminals()
    {
        return terminals;
    }
    public void setManagerName(String managerName)
    {
        this.managerName = managerName;
    }

    public String getManagerName()
    {
        return managerName;
    }
    public void setPhone(String phone)
    {
        this.phone = phone;
    }

    public String getPhone()
    {
        return phone;
    }
    public void setTimeto(Date timeto)
    {
        this.timeto = timeto;
    }

    public Date getTimeto()
    {
        return timeto;
    }
    public void setAuthState(String authState)
    {
        this.authState = authState;
    }

    public String getAuthState()
    {
        return authState;
    }
    public void setVersion(String version)
    {
        this.version = version;
    }

    public String getVersion()
    {
        return version;
    }
    public void setCompany(String company)
    {
        this.company = company;
    }

    public String getCompany()
    {
        return company;
    }
    public void setAuthStarttime(Date authStarttime)
    {
        this.authStarttime = authStarttime;
    }

    public Date getAuthStarttime()
    {
        return authStarttime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("appId", getAppId())
                .append("appEui", getAppEui())
                .append("appSecret", getAppSecret())
                .append("appName", getAppName())
                .append("descript", getDescript())
                .append("terminals", getTerminals())
                .append("managerName", getManagerName())
                .append("phone", getPhone())
                .append("timeto", getTimeto())
                .append("authState", getAuthState())
                .append("version", getVersion())
                .append("company", getCompany())
                .append("createTime", getCreateTime())
                .append("authStarttime", getAuthStarttime())
                .toString();
    }
}
