package com.ruoyi.system.service;

import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.system.domain.LoraNode;
import com.ruoyi.system.domain.LoraTerminal;

import java.util.List;

/**
 * 业务终端 Service接口
 *
 * @author ruoyi
 * @date  2022-10-09
 */
public interface ILoraTerminalService
{
    /**
     * 通过snId查询终端
     *
     * @param snId 业务终端 主键
     * @return 终端
     */
    public LoraTerminal selectLoraTerminalBySnId(Long snId);

    /**
     * 通过sn查询终端
     *
     * @param sn 业务终端 主键
     * @return 终端
     */
    public LoraTerminal selectLoraTerminalBySn(String sn);

    /**
     * 查询业务终端列表
     *
     * @param loraTerminal 业务终端
     * @return 业务终端 集合
     */
    public List<LoraTerminal> selectLoraTerminalList(LoraTerminal loraTerminal);

    public List<LoraTerminal> selectLoraTerminalListByEui(String terminalEui);

    /**
     * 新增业务终端
     *
     * @param loraTerminal 业务终端
     * @return 结果
     */
    public int insertLoraTerminal(LoraTerminal loraTerminal);

    /**
     * 通过snId修改业务终端
     *
     * @param loraTerminal 业务终端
     * @return 结果
     */
    public int updateLoraTerminal(LoraTerminal loraTerminal);

    /**
     * 通过sn修改业务终端
     *
     * @param loraTerminal 业务终端
     * @return 结果
     */
    public int updateLoraTerminalBySn(LoraTerminal loraTerminal);

    /**
     * 通过terminalEui修改业务终端的状态（上线）
     *
     * @param
     * @return 结果
     */
    public int updateLoraTerminalCycleBySn(LoraTerminal loraTerminal);

    /**
     * 通过snId批量删除业务终端
     *
     * @param snIds 需要删除的业务终端 主键集合
     * @return 结果
     */
    public int deleteLoraTerminalBySnIds(Long[] snIds);



    public int calibration(String[] sn, int time);

    /**
     * 通过snId删除业务终端 信息
     *
     * @param snId 业务终端 主键
     * @return 结果
     */
    public int deleteLoraTerminalBySnId(Long snId);



    /**
     * 通过sn删除业务终端 信息
     *
     * @param sn
     * @return 结果
     */
    public int deleteLoraTerminalBySn(String sn);

    public int appDeleteLoraTerminalBySn(String sn);



    /**
     * 通过terminalEui修改业务终端的状态（上线）
     *
     * @param terminalEui
     * @return 结果
     */

    public int deleteLoraTerminalByEui(String terminalEui);

    /**
     * 通过sn查询业务终端信息
     *
     * @param sn
     * @return 业务终端集合
     */
    public List<LoraTerminal> checkTerminalHaveBySn(String sn);

    /**
     * 通过sn修改终端的状态
     *
     * @param terminalEui
     * @return 结果
     */
    public int loginTerminal(String terminalEui);

    /**
     * 通过sn修改终端的状态
     *
     * @param terminalEui
     * @return 结果
     */
    public int logoutTerminalByEui(String terminalEui);

    /**
     * 更新业务终端的最后发送消息时间
     *
     * @param terminalEui
     * @return 结果
     */
    public int updateLastMsgTime(String terminalEui);

    /**
     * 给App发送Terminal信息
     *
     * @param loraTerminal,appEui,serviceType
     * @return 结果
     */
    public void sendTerminalMsgToApp(LoraTerminal loraTerminal,String appEui,int serviceType);

    /**
     * 根据terminalEui修改业务终端的运行状态
     *
     * @param loraTerminal
     * @return 结果
     */
    public int changeRunStateByterminalEui(LoraTerminal loraTerminal);

    /**
     * 向Ns请求lora终端信息，然后更新在业务终端中
     *
     * @param
     * @return 结果
     */
    public void queryOnlineNodeList();

    /**
     * 向Ns请求lora终端信息，然后更新在业务终端中
     *
     * @param
     * @return 结果
     */
    public void queryTerminalGatawayList();

    /**
     * 修改业务终端绑定的gatewayEui
     *
     * @param
     * @return 结果
     */
    public int changeGatewayByEui(LoraTerminal loraTerminal);



    public String sendAlarmCommandToNs(LoraTerminal loraTerminal,int control);

    public void checkTerminalBySn(String sn,String appEui);

    String importNode(List<LoraNode> nodeList, Boolean isUpdateSupport, String operName);

    public int setStateT3LoraTerminalById(Long snId);

    public int setStateT2LoraTerminalByEui(String terminalEui);

    public int updateAppNameByEui(String appEui);
}