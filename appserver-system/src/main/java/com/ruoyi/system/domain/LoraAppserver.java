package com.ruoyi.system.domain;

import java.util.Date;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.domain.BaseEntity;

/**
 * 【请填写功能名称】对象 lora_appserver
 *
 * @author ruoyi
 * @date 2022-11-07
 */
public class LoraAppserver extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    private Integer id;

    private String appserverId;

    private String appserverName;

    private String appserverKey;

    private Date authorizeTime;

    private String runState;
    private String lastMsgDt;

    public void setId(Integer id)
    {
        this.id = id;
    }

    public Integer getId()
    {
        return id;
    }
    public void setAppserverId(String appserverId)
    {
        this.appserverId = appserverId;
    }

    public String getAppserverId()
    {
        return appserverId;
    }
    public void setAppserverName(String appserverName)
    {
        this.appserverName = appserverName;
    }

    public String getAppserverName()
    {
        return appserverName;
    }
    public void setAppserverKey(String appserverKey)
    {
        this.appserverKey = appserverKey;
    }

    public String getAppserverKey()
    {
        return appserverKey;
    }
    public void setAuthorizeTime(Date authorizeTime)
    {
        this.authorizeTime = authorizeTime;
    }

    public Date getAuthorizeTime()
    {
        return authorizeTime;
    }
    public void setLastMsgDt(String lastMsgDt)
    {
        this.lastMsgDt = lastMsgDt;
    }

    public String getLastMsgDt()
    {
        return lastMsgDt;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("appserverId", getAppserverId())
                .append("appserverName", getAppserverName())
                .append("appserverKey", getAppserverKey())
                .append("authorizeTime", getAuthorizeTime())
                .append("lastMsgDt", getLastMsgDt())
                .toString();
    }

    public String getRunState() {
        return runState;
    }

    public void setRunState(String runState) {
        this.runState = runState;
    }
}
