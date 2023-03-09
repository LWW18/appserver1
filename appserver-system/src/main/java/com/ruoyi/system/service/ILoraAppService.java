package com.ruoyi.system.service;

import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.system.domain.LoraApp;

import java.util.List;

/**
 * 应用Service接口
 *
 * @author Weiwang
 * @date 2022-09-29
 */
public interface ILoraAppService
{
    /**
     * 查询应用
     *
     * @param appId 应用主键
     * @return 应用
     */
    public LoraApp selectLoraAppByAppId(Long appId);

    public LoraApp selectLoraAppByAppName(String appName);
    public LoraApp selectLoraAppByAppEui(String appEui);

    /**
     * 查询应用列表
     *
     * @param loraApp 应用
     * @return 应用集合
     */
    public List<LoraApp> selectLoraAppList(LoraApp loraApp);

    /**
     * 查询所有应用列表
     *
     * @param
     * @return 应用集合
     */
    public List<String> selectLoraAppListAll();

    /**
 * 新增应用
 *
 * @param loraApp 应用
 * @return 结果
 */
    public int insertLoraApp(LoraApp loraApp);

    /**
     * 恢复应用
     *
     * @param appEui
     * @return 结果
     */
    public int recoverLoraApp(String appEui);


    /**
     * 修改用户状态
     *
     * @param loraApp 用户信息
     * @return 结果
     */
    public int updateAppStatus(LoraApp loraApp);
    /**
     * 修改应用
     *
     * @param loraApp 应用
     * @return 结果
     */
    public int updateLoraApp(LoraApp loraApp);

    /**
     * 批量删除应用
     *
     * @param appIds 需要删除的应用主键集合
     * @return 结果
     */
    public int deleteLoraAppByAppIds(Long[] appIds);

    /**
     * 删除应用信息
     *
     * @param appId 应用主键
     * @return 结果
     */
    public int deleteLoraAppByAppId(Long appId);


    /**
     * 删除应用信息
     *
     * @param appEui
     * @return 结果
     */
    public int deleteLoraAppByAppEui(String appEui);

    /**
     * 删除应用信息
     *
     * @param appEui
     * @return 结果
     */
    public int thdeleteLoraAppByAppEui(String appEui);


    /**
     * 校验App名称是否唯一
     *
     * @param app app信息
     * @return 结果
     */
//    public String checkAppNameUnique(LoraApp app);

    /**
     * 校验AppEui是否唯一
     *
     * @param app app信息
     * @return 结果
     */
    public Boolean checkAppEuiUnique(LoraApp app);

    /**
     * 校验AppEui是否唯一
     *
     * @param appEui appEui
     * @return 结果
     */
    public Boolean checkAppAuth(String appEui);

    public List<LoraApp> checkAppHaveByEui(String appEui);

    public ResultBuilder checkAppAuthFromNs(LoraApp loraApp);


}
