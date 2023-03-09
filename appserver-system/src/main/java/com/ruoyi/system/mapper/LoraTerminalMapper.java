package com.ruoyi.system.mapper;

import java.util.List;

import com.ruoyi.system.domain.LoraNode;
import com.ruoyi.system.domain.LoraTerminal;
import org.omg.CORBA.PUBLIC_MEMBER;

/**
 * 终端 Mapper接口
 *
 * @author ruoyi
 * @date 2022-10-09
 */
public interface LoraTerminalMapper
{
    /**
     * 查询终端
     *
     * @param snId 终端 主键
     * @return 终端
     */
    public LoraTerminal selectLoraTerminalBySnId(Long snId);
    public LoraTerminal selectLoraTerminalBySn(String sn);
    public LoraTerminal selectAppBySn(String sn);

    /**
     * 查询终端 列表
     *
     * @param loraTerminal 终端
     * @return 终端 集合
     */
    public List<LoraTerminal> selectLoraTerminalList(LoraTerminal loraTerminal);

    /**
     * 查询终端 列表
     *
     * @param terminalEui 终端
     * @return 终端 集合
     */
    public List<LoraTerminal> selectLoraTerminalListByEui(String terminalEui);



    /**
     * 新增终端
     *
     * @param loraTerminal 终端
     * @return 结果
     */
    public int insertLoraTerminal(LoraTerminal loraTerminal);


    /**
     * 修改对用snId的业务终端
     *
     * @param loraTerminal 终端
     * @return 结果
     */
    public int updateLoraTerminal(LoraTerminal loraTerminal);

    /**
     * 修改对应sn的业务终端
     *
     * @param loraTerminal 终端
     * @return 结果
     */
    public int updateLoraTerminalBySn(LoraTerminal loraTerminal);

    /**
     * 修改对应sn的业务终端的随机周期
     *
     * @param loraTerminal 终端
     * @return 结果
     */
    public int updateLoraTerminalCycleBySn(LoraTerminal loraTerminal);
    /**
     * 删除终端
     *
     * @param snId 终端 主键
     * @return 结果
     */
    public int deleteLoraTerminalBySnId(Long snId);



    /**
     * 通过sn删除终端
     *
     * @param sn
     * @return 结果
     */
    public int deleteLoraTerminalBySn(String sn);

    public int appDeleteLoraTerminalBySn(String sn);

    /**
     * 通过terminalEui删除终端
     *
     * @param terminalEui
     * @return 结果
     */
    public int deleteLoraTerminalByEui(String terminalEui);

    /**
     * 批量删除终端
     *
     * @param snIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLoraTerminalBySnIds(Long[] snIds);

    /**
     * 通过terminalEui修改业务终端的状态（上线）
     *
     * @param terminalEui
     * @return 结果
     */
    public int loginTerminal(String terminalEui);

    public int logoutTerminalByEui(String terminalEui);

    /**
     * 校验sn是否唯一
     *
     * @param sn
     * @return 结果
     */
    public List<LoraTerminal> checkTerminalHavaBySn(String sn);

    public int updateLastMsgTime(String terminal);

    public int  changeRunStateByterminalEui(LoraTerminal loraTerminal);

    public int changeGatewayByEui(LoraTerminal loraTerminal);

    public int setStateT3LoraTerminalById(Long snId);

    public int setStateT2LoraTerminalByEui(String terminalEui);

    public int updateAppNameByEui(LoraTerminal loraTerminal);
}