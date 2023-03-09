package com.ruoyi.system.mapper;

import com.ruoyi.system.domain.LoraData;
import com.ruoyi.system.domain.LoraTerminal;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * appserver帧数据Mapper接口
 * 
 * @author Weiwang
 * @date 2022-09-27
 */
public interface LoraDataMapper 
{

    /**
     * 查询appserver帧数据
     * 
     * @param dataId appserver帧数据主键
     * @return appserver帧数据
     */
    public LoraData selectLoraDataByDataId(Long dataId);

    /**
     * 查询appserver帧数据列表(所有 or WarningMsg)
     * 
     * @param loraData appserver帧数据
     * @return appserver帧数据集合
     */
    public List<LoraData> selectLoraDataList(LoraData loraData);

    /**
     * 查询 WarningMsg
     *
     * @param appEui
     * @return appserver帧数据集合
     */
    public List<LoraData> selectWarningMsgList(String appEui);

    /**
     * 查询 WarningMsg
     *
     * @param  terminalEui
     * @return appserver帧数据集合
     */
    public int readWarningMsg(String terminalEui);

    /**
     * 解析数据
     *
     * @param loraData
     * @return appserver帧数据集合
     */
    public int analysisLoraData(LoraData loraData);


    /**
     * 新增appserver帧数据
     *
     * @param loraData appserver帧数据
     * @return 结果
     */
    public int insertLoraData(LoraData loraData);

    /**
     * 修改appserver帧数据
     * 
     * @param loraData appserver帧数据
     * @return 结果
     */
    public int updateLoraData(LoraData loraData);

    /**
     * 删除appserver帧数据
     * 
     * @param dataId appserver帧数据主键
     * @return 结果
     */
    public int deleteLoraDataByDataId(Long dataId);

    /**
     * 批量删除appserver帧数据
     * 
     * @param dataIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLoraDataByDataIds(Long[] dataIds);

    public int analysisBsData(LoraData loraData);

    /**
     * 查询部门是否存在用户
     *
     * @param terminalEui 部门ID
     * @return 结果
     */
    public int checkTerminalHava(String terminalEui);
    /**
     * 查询部门是否存在用户
     *
     * @param terminalEui 部门ID
     * @return 结果
     */
    public int checkTerminalLogout(String terminalEui);

    public int updateRecvTime(Long dateId);
    public List<LoraData> viewNum(@Param("data1") String data1, @Param("data2")String data2);

    public int updateAppNameByEui(LoraData loraData);
}
