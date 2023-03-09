package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.LoraApp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 应用Mapper接口
 *
 * @author Weiwang
 * @date 2022-09-29
 */
public interface LoraAppMapper
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

    public List<String> selectLoraAppListAll();
    /**
     * 新增应用
     *
     * @param loraApp 应用
     * @return 结果
     */
    public int insertLoraApp(LoraApp loraApp);

    /**
     * 恢复App
     *
     * @param appEui
     * @return 结果
     */
    public int recoverLoraApp(String appEui);

    /**
     * 修改应用
     *
     * @param loraApp 应用
     * @return 结果
     */
    public int updateLoraApp(LoraApp loraApp);

    /**
     * 删除应用
     *
     * @param appId 应用主键
     * @return 结果
     */
    public int deleteLoraAppByAppId(Long appId);

    /**
     * 注销应用
     *
     * @param appEui
     * @return 结果
     */
    public int deleteLoraAppByAppEui(String appEui);

    /**
     * 删除应用
     *
     * @param appEui
     * @return 结果
     */
    public int thdeleteLoraAppByAppEui(String appEui);

    /**
     * 批量删除应用
     *
     * @param appIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLoraAppByAppIds(Long[] appIds);


    /**
     * 根据终端ID获取app选择框列表
     *
     * @param terminalId 终端ID
     * @return 选中appID列表
     */
    public List<Long> selectAppListByTerminalId(Long terminalId);

    /**
     * 查询用户所属岗位组
     *
     * @param userName 用户名
     * @return 结果
     */
    public List<LoraApp> selectAppsByTerminalName(String userName);


    /**
     * 校验app名称是否唯一
     *
     * @param appName 部门名称
     * @return 结果
     */
    public LoraApp checkAppNameUnique(@Param("appName") String appName);

    /**
     * 校验appEui是否唯一
     *
     * @param appEui 部门名称
     * @return 结果
     */
    public LoraApp checkAppEuiUnique(@Param("appEui") String appEui);

    /**
     * 校验appEui是否唯一
     *
     * @param appEui 部门名称
     * @return 结果
     */
    public LoraApp checkAppAuth(@Param("appEui") String appEui);


    public List<LoraApp> checkAppHavaByEui(String appEui);




}
