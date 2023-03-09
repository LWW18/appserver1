package com.ruoyi.system.mapper;

import java.util.List;
import com.ruoyi.system.domain.LoraAppserver;

/**
 * 【请填写功能名称】Mapper接口
 *
 * @author ruoyi
 * @date 2022-11-08
 */
public interface LoraAppserverMapper
{
    /**
     * 查询【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public LoraAppserver selectLoraAppserverById(Long id);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param loraAppserver 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<LoraAppserver> selectLoraAppserverList(LoraAppserver loraAppserver);

    /**
     * 新增【请填写功能名称】
     *
     * @param loraAppserver 【请填写功能名称】
     * @return 结果
     */
    public int insertLoraAppserver(LoraAppserver loraAppserver);

    /**
     * 修改【请填写功能名称】
     *
     * @param loraAppserver 【请填写功能名称】
     * @return 结果
     */
    public int updateLoraAppserver(LoraAppserver loraAppserver);

    /**
     * 删除【请填写功能名称】
     *
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteLoraAppserverById(Long id);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteLoraAppserverByIds(Long[] ids);
}
