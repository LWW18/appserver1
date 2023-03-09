package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LoraGateway;

/**
 * 网关Service接口
 *
 * @author ruoyi
 * @date 2022-11-05
 */
public interface ILoraGatewayService
{
    /**
     * 查询网关
     *
     * @param gatewayId 网关主键
     * @return 网关
     */
    public LoraGateway selectLoraGatewayByGatewayId(Long gatewayId);

    /**
     * 查询网关列表
     *
     * @param loraGateway 网关
     * @return 网关集合
     */
    public List<LoraGateway> selectLoraGatewayList(LoraGateway loraGateway);

    /**
     * 新增网关
     *
     * @param loraGateway 网关
     * @return 结果
     */
    public int insertLoraGateway(LoraGateway loraGateway);

    /**
     * 修改网关
     *
     * @param loraGateway 网关
     * @return 结果
     */
    public int updateLoraGateway(LoraGateway loraGateway);

    /**
     * 批量删除网关
     *
     * @param gatewayIds 需要删除的网关主键集合
     * @return 结果
     */
    public int deleteLoraGatewayByGatewayIds(Long[] gatewayIds);

    /**
     * 删除网关信息
     *
     * @param gatewayId 网关主键
     * @return 结果
     */
    public int deleteLoraGatewayByGatewayId(Long gatewayId);
    public int updateLastMsgTime(String gatewayEui);

    public void queryGatawatyList();

    public List<LoraGateway> checkGatewayHaveByEui(String gatewayEui);
}
