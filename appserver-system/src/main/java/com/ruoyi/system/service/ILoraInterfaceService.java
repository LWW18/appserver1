package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.LoraInterface;

/**
 * 【请填写功能名称】Service接口
 * 
 * @author ruoyi
 * @date 2023-02-13
 */
public interface ILoraInterfaceService 
{
    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public LoraInterface selectLoraInterfaceById(Long id);

    public LoraInterface selectLoraInterfaceByGwEui(String gwEui);

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param loraInterface 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<LoraInterface> selectLoraInterfaceList(LoraInterface loraInterface);

    /**
     * 新增【请填写功能名称】
     * 
     * @param loraInterface 【请填写功能名称】
     * @return 结果
     */
    public int insertLoraInterface(LoraInterface loraInterface);

    /**
     * 修改【请填写功能名称】
     * 
     * @param loraInterface 【请填写功能名称】
     * @return 结果
     */
    public int updateLoraInterface(LoraInterface loraInterface);

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteLoraInterfaceByIds(Long[] ids);

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteLoraInterfaceById(Long id);
}
