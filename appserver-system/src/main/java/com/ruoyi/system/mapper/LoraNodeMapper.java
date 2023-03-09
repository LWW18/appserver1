package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.LoginReturn;
import com.ruoyi.system.domain.LoraNode;

/**
 * 传感器 Mapper接口
 *
 * @author ruoyi
 * @date 2022-11-21
 */
public interface LoraNodeMapper
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

    /**
     * 删除传感器
     *
     * @param terminalId 传感器 主键
     * @return 结果
     */
    public int deleteLoraNodeByTerminalId(Long terminalId);

    /**
     * 批量删除传感器
     *
     * @param terminalIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLoraNodeByTerminalIds(Long[] terminalIds);

    public List<LoraNode> selectLoraNodeListByIds(Long[] terminalIds);

    public int loginTerminal(String terminalEui);

    public int logoutTerminal(String terminalEui);

    /**
     * 删除终端
     *
     * @param sn
     * @return 结果
     */
    public int deleteLoraTerminalByEui(String terminalEui);

    public int updateLastMsgTime(String terminalEui);

    public int setStateT3LoraNode(Long terminalId);

    public LoraNode selectNodeByEui(String terminalEui);

    public int updateAppNameByEui(LoraNode loraNode);


}
