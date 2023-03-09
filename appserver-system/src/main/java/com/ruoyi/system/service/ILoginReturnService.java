package com.ruoyi.system.service;

import java.util.List;

import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.system.domain.LoginReturn;
import com.ruoyi.system.domain.LoraTerminal;

/**
 * 【请填写功能名称】Service接口
 *
 * @author ruoyi
 * @date 2022-11-23
 */
public interface ILoginReturnService
{
    /**
     * 查询【请填写功能名称】
     *
     * @param returnId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public LoginReturn selectLoginReturnByReturnId(Long returnId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param loginReturn 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<LoginReturn> selectLoginReturnList(LoginReturn loginReturn);

    /**
     * 新增【请填写功能名称】
     *
     * @param loginReturn 【请填写功能名称】
     * @return 结果
     */
    public int insertLoginReturn(LoginReturn loginReturn);

    /**
     * 修改【请填写功能名称】
     *
     * @param loginReturn 【请填写功能名称】
     * @return 结果
     */
    public int updateLoginReturn(LoginReturn loginReturn);
    public int updatePayload(LoginReturn loginReturn);

    public int updateLoginReturnBySn(LoginReturn loginReturn);

    public int updateCycleBySn(LoginReturn loginReturn);

    public int updateThresholdBySn(LoginReturn loginReturn);

    public int updatePayloadBySn(LoginReturn loginReturn);
    /**
     * 批量删除【请填写功能名称】
     *
     * @param returnIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteLoginReturnByReturnIds(Long[] returnIds);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param returnId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteLoginReturnByReturnId(Long returnId);

    public ResultBuilder sendTerminalCycleToNs(LoginReturn loginReturn);

    public ResultBuilder sendTerminalThresholdToNs(String sn);

    public LoginReturn selectLoginReturnBySn(String sn);
    public LoginReturn selectLoginReturnByEuiId(LoginReturn loginReturn);
    public LoginReturn selectLoginReturnByTerminalEui(String terminalEui);

    public int loginApp(String sn);

    public int logoutTerminalByEui(String terminalEui);

    public void checkTerminalBySn(String sn,String appEui);

    public List<String> writeLoginTerminalReturnMsg(String sn);
}
