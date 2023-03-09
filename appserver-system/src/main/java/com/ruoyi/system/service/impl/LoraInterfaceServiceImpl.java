package com.ruoyi.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LoraInterfaceMapper;
import com.ruoyi.system.domain.LoraInterface;
import com.ruoyi.system.service.ILoraInterfaceService;

/**
 * 【请填写功能名称】Service业务层处理
 * 
 * @author ruoyi
 * @date 2023-02-13
 */
@Service
public class LoraInterfaceServiceImpl implements ILoraInterfaceService 
{
    @Autowired
    private LoraInterfaceMapper loraInterfaceMapper;

    /**
     * 查询【请填写功能名称】
     * 
     * @param id 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public LoraInterface selectLoraInterfaceById(Long id)
    {
        return loraInterfaceMapper.selectLoraInterfaceById(id);
    }

    @Override
    public LoraInterface selectLoraInterfaceByGwEui(String gwEui)
    {
        return loraInterfaceMapper.selectLoraInterfaceByGwEui(gwEui);
    }

    /**
     * 查询【请填写功能名称】列表
     * 
     * @param loraInterface 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<LoraInterface> selectLoraInterfaceList(LoraInterface loraInterface)
    {
        return loraInterfaceMapper.selectLoraInterfaceList(loraInterface);
    }

    /**
     * 新增【请填写功能名称】
     * 
     * @param loraInterface 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertLoraInterface(LoraInterface loraInterface)
    {
        return loraInterfaceMapper.insertLoraInterface(loraInterface);
    }

    /**
     * 修改【请填写功能名称】
     * 
     * @param loraInterface 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateLoraInterface(LoraInterface loraInterface)
    {
        return loraInterfaceMapper.updateLoraInterface(loraInterface);
    }

    /**
     * 批量删除【请填写功能名称】
     * 
     * @param ids 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteLoraInterfaceByIds(Long[] ids)
    {
        return loraInterfaceMapper.deleteLoraInterfaceByIds(ids);
    }

    /**
     * 删除【请填写功能名称】信息
     * 
     * @param id 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteLoraInterfaceById(Long id)
    {
        return loraInterfaceMapper.deleteLoraInterfaceById(id);
    }
}
