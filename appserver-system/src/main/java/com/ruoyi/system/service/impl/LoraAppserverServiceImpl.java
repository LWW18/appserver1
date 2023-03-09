package com.ruoyi.system.service.impl;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.constant.AppServerConstants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LoraAppserverMapper;
import com.ruoyi.system.domain.LoraAppserver;
import com.ruoyi.system.service.ILoraAppserverService;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2022-11-08
 */
@Service
public class LoraAppserverServiceImpl implements ILoraAppserverService
{
    @Autowired
    private LoraAppserverMapper loraAppserverMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public LoraAppserver selectLoraAppserverById(Long id)
    {
        return loraAppserverMapper.selectLoraAppserverById(id);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param loraAppserver 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<LoraAppserver> selectLoraAppserverList(LoraAppserver loraAppserver)
    {
        return loraAppserverMapper.selectLoraAppserverList(loraAppserver);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param loraAppserver 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertLoraAppserver(LoraAppserver loraAppserver)
    {
        return loraAppserverMapper.insertLoraAppserver(loraAppserver);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param loraAppserver 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateLoraAppserver(LoraAppserver loraAppserver)
    {
        return loraAppserverMapper.updateLoraAppserver(loraAppserver);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteLoraAppserverByIds(Long[] ids)
    {
        return loraAppserverMapper.deleteLoraAppserverByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteLoraAppserverById(Long id)
    {
        return loraAppserverMapper.deleteLoraAppserverById(id);
    }


    @Autowired
    ILoraAppserverService loraAppserverService;
    HttpUtils httpUtils = new HttpUtils();

    /**
     * 向NS注册此AppServer
     *
     * @param
     * @return
     */
    @Override
    public void appServerAuthorize(){
        //appServer向NS发送授权消息
        //并且根据返回的AppserverId修改数据库信息
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverKey(AppServerConstants.APPSERVER_KEY);
        loraAppserver.setAppserverName(AppServerConstants.APPSERVER_NAME);
        String js = "{\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/APPServer/APPServerAuthorize", js);
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        loraAppserver.setAppserverId(resultBuilder.getData());
        loraAppserverService.updateLoraAppserver(loraAppserver);
    }

    /**
     * 向NS修改此AppServer
     *
     * @param
     * @return
     */
    @Override
    public void appServerEdit(){
        //appServer向NS发送授权消息
        //并且根据返回的AppserverId修改数据库信息
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverKey(AppServerConstants.APPSERVER_KEY);
        loraAppserver.setAppserverName(AppServerConstants.APPSERVER_NAME);
        String js = "{\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/APPServer/APPServerEdit", js);
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        loraAppserver.setAppserverId(resultBuilder.getData());
        loraAppserverService.updateLoraAppserver(loraAppserver);
    }


}
