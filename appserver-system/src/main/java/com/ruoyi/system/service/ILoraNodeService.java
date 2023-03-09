package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.LoraNode;

/**
 * 传感器 Service接口
 *
 * @author ruoyi
 * @date 2022-11-21
 */
public interface ILoraNodeService
{
    /**
     * 查询传感器
     *
     * @param terminalId 传感器 主键
     * @return 传感器
     */
    public LoraNode selectLoraNodeByTerminalId(Long terminalId);

    /**
     * 查询传感器 列表
     *
     * @param loraNode 传感器
     * @return 传感器 集合
     */
    public List<LoraNode> selectLoraNodeList(LoraNode loraNode);

    /**
     * 新增传感器
     *
     * @param loraNode 传感器
     * @return 结果
     */
    public int insertLoraNode(LoraNode loraNode);

    /**
     * 修改传感器
     *
     * @param loraNode 传感器
     * @return 结果
     */
    public int updateLoraNode(LoraNode loraNode);

    public int setStateT3LoraNode(Long terminalId);

    /**
     * 批量删除传感器
     *
     * @param terminalIds 需要删除的传感器 主键集合
     * @return 结果
     */
    public int deleteLoraNodeByTerminalIds(Long[] terminalIds);

    public List<LoraNode> selectLoraNodeListByIds(Long[] terminlIds);
    /**
     * 删除传感器 信息
     *
     * @param terminalId 传感器 主键
     * @return 结果
     */
    public int deleteLoraNodeByTerminalId(Long terminalId);


    public int loginTerminal(String terminalEui);

    /**
     * 通过sn修改终端的状态
     *
     * @param
     * @return 结果
     */
    public int logoutTerminal(String terminalEui);

    /**
     * 删除业务终端 信息
     *
     * @param
     * @return 结果
     */
    public int deleteLoraTerminalByEui(String terminalEui);

    public int updateLastMsgTime(String terminalEui);

    public void checkNodeByEui(String terminalEui,String appEui);

    /**
     * 导入用户数据
     *
     * @param nodeList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    public String importNode(List<LoraNode> nodeList, Boolean isUpdateSupport, String operName);

    public LoraNode selectNodeByEui(String terminalEui);

    public int updateAppNameByEui(String appEui);
}
