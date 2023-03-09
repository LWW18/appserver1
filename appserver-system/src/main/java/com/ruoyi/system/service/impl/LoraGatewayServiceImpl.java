package com.ruoyi.system.service.impl;

import java.util.List;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson2.JSON;
import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.LoraAppserver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LoraGatewayMapper;
import com.ruoyi.system.domain.LoraGateway;
import com.ruoyi.system.service.ILoraGatewayService;

/**
 * 网关Service业务层处理
 *
 * @author ruoyi
 * @date 2022-11-05
 */
@Service
public class LoraGatewayServiceImpl implements ILoraGatewayService
{
    @Autowired
    private LoraGatewayMapper loraGatewayMapper;

    @Autowired
    private ILoraGatewayService loraGatewayService;
    /**
     * 查询网关
     *
     * @param gatewayId 网关主键
     * @return 网关
     */
    @Override
    public LoraGateway selectLoraGatewayByGatewayId(Long gatewayId)
    {
        return loraGatewayMapper.selectLoraGatewayByGatewayId(gatewayId);
    }

    /**
     * 查询网关列表
     *
     * @param loraGateway 网关
     * @return 网关
     */
    @Override
    public List<LoraGateway> selectLoraGatewayList(LoraGateway loraGateway)
    {
        return loraGatewayMapper.selectLoraGatewayList(loraGateway);
    }

    /**
     * 新增网关
     *
     * @param loraGateway 网关
     * @return 结果
     */
    @Override
    public int insertLoraGateway(LoraGateway loraGateway)
    {
        return loraGatewayMapper.insertLoraGateway(loraGateway);
    }

    /**
     * 修改网关
     *
     * @param loraGateway 网关
     * @return 结果
     */
    @Override
    public int updateLoraGateway(LoraGateway loraGateway)
    {
        return loraGatewayMapper.updateLoraGateway(loraGateway);
    }

    /**
     * 批量删除网关
     *
     * @param gatewayIds 需要删除的网关主键
     * @return 结果
     */
    @Override
    public int deleteLoraGatewayByGatewayIds(Long[] gatewayIds)
    {
        return loraGatewayMapper.deleteLoraGatewayByGatewayIds(gatewayIds);
    }

    /**
     * 删除网关信息
     *
     * @param gatewayId 网关主键
     * @return 结果
     */
    @Override
    public int deleteLoraGatewayByGatewayId(Long gatewayId)
    {
        return loraGatewayMapper.deleteLoraGatewayByGatewayId(gatewayId);
    }

    /**
     * 更新网关的发送时间
     *
     * @return 结果
     */
    @Override
    public int updateLastMsgTime(String gatewayEui)
    {
        return loraGatewayMapper.updateLastMsgTime(gatewayEui);
    }

    /**
     * 根据Eui搜索网关列表
     *
     * @return 结果
     */
    @Override
    public List<LoraGateway> checkGatewayHaveByEui(String gatewayEui){
        return loraGatewayMapper.checkGatewayHaveByEui(gatewayEui);
    }


    /**
     * 向NS获取网关信息
     *
     */
    @Override
    public void queryGatawatyList(){
        //向Ns获取最新的网关列表
        //调用Http 发送post请求的方法
        HttpUtils httpUtils = new HttpUtils();
        //请求参数为Json，我们先把Appserver对象列出来，再转成Json格式
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverName("01223");
        loraAppserver.setAppserverId("58d18f8b-8528-4140-88d4-de44187324cc");
        loraAppserver.setAppserverKey("01234567");

        String js = "{\"appServerId\":\"58d18f8b-8528-4140-88d4-de44187324cc\",\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/gateway/queryGatewayList", js);

        //将Ns返回的结果转换为ResultBuilder
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);

        //提取ResultBuilder中的data：loraGatewayList (String)
        String loraGatewayList = resultBuilder.getData();
        //将String的loarAppserverList 转换为 String列表
        List<LoraGateway> loraGatewayList1 = JSON.parseArray(loraGatewayList,LoraGateway.class);
        for (LoraGateway loraGateway : loraGatewayList1) {
            if (loraGatewayService.checkGatewayHaveByEui(loraGateway.getGwEui()).size() != 0) {
                updateLoraGateway(loraGateway);
            } else {
                insertLoraGateway(loraGateway);
            }
        }
    }
}
