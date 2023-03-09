package com.ruoyi.system.service;

import com.ruoyi.system.domain.LoraData;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * appserver帧数据Service接口
 * 
 * @author Weiwang
 * @date 2022-09-27
 */

public interface ILoraDataService {
    /**
     * 查询appserver帧数据
     *
     * @param dataId appserver帧数据主键
     * @return appserver帧数据
     */
    public LoraData selectLoraDataByDataId(Long dataId);

    /**
     * 查询appserver帧数据列表
     *
     * @param loraData appserver帧数据
     * @return appserver帧数据集合
     */
    public List<LoraData> selectLoraDataList(LoraData loraData);



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
     * 批量删除appserver帧数据
     *
     * @param dataIds 需要删除的appserver帧数据主键集合
     * @return 结果
     */
    public int deleteLoraDataByDataIds(Long[] dataIds);

    /**
     * 删除appserver帧数据信息
     *
     * @param dataId appserver帧数据主键
     * @return 结果
     */
    public int deleteLoraDataByDataId(Long dataId);

    /**
     * 数据放置于发给app的缓存池中
     *
     * @param loraData
     * @return 结果
     */
    public void sendDataToApp(LoraData loraData);

    public int updateRecvTime(Long dateId);

    public LoraData decode(LoraData loraData, int length) throws IOException;

    public List<LoraData> viewNum(String data1,String data2);

    public int updateAppNameByEui(String appEui);



}
