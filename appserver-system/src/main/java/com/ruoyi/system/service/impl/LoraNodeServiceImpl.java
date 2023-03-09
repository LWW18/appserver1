package com.ruoyi.system.service.impl;

import java.util.List;

import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanValidators;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ISysConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LoraNodeMapper;
import com.ruoyi.system.domain.LoraNode;
import com.ruoyi.system.service.ILoraNodeService;

import javax.annotation.Resource;
import javax.validation.Validator;

/**
 * 传感器 Service业务层处理
 *
 * @author ruoyi
 * @date 2022-11-21
 */
@Service
public class LoraNodeServiceImpl implements ILoraNodeService
{
    private static final Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);
    @Resource
    private LoraNodeMapper loraNodeMapper;

    @Resource
    private ISysConfigService configService;

    @Resource
    private ILoraAppService loraAppService;
    @Resource
    protected Validator validator;

    /**
     * 查询传感器
     *
     * @param terminalId 传感器 主键
     * @return 传感器
     */
    @Override
    public LoraNode selectLoraNodeByTerminalId(Long terminalId)
    {
        return loraNodeMapper.selectLoraNodeByTerminalId(terminalId);
    }

    /**
     * 查询传感器 列表
     *
     * @param loraNode 传感器
     * @return 传感器
     */
    @Override
    public List<LoraNode> selectLoraNodeList(LoraNode loraNode)
    {
        return loraNodeMapper.selectLoraNodeList(loraNode);
    }

    /**
     * 新增传感器
     *
     * @param loraNode 传感器
     * @return 结果
     */
    @Override
    public int insertLoraNode(LoraNode loraNode)
    {
        return loraNodeMapper.insertLoraNode(loraNode);
    }

    /**
     * 修改传感器
     *
     * @param loraNode 传感器
     * @return 结果
     */
    @Override
    public int updateLoraNode(LoraNode loraNode)
    {
        return loraNodeMapper.updateLoraNode(loraNode);
    }

    @Override
    public int setStateT3LoraNode(Long terminalId){
        return loraNodeMapper.setStateT3LoraNode(terminalId);
    }

    /**
     * 批量删除传感器
     *
     * @param terminalIds 需要删除的传感器 主键
     * @return 结果
     */
    @Override
    public int deleteLoraNodeByTerminalIds(Long[] terminalIds)
    {
        return loraNodeMapper.deleteLoraNodeByTerminalIds(terminalIds);
    }

    @Override
    public List<LoraNode> selectLoraNodeListByIds(Long[] terminslIds){
        return loraNodeMapper.selectLoraNodeListByIds(terminslIds);
    }

    /**
     * 删除传感器 信息
     *
     * @param terminalId 传感器 主键
     * @return 结果
     */
    @Override
    public int deleteLoraNodeByTerminalId(Long terminalId)
    {
        return loraNodeMapper.deleteLoraNodeByTerminalId(terminalId);
    }

    /**
     * 通过sn修改终端的状态
     *
     * @param terminalEui
     * @return 结果
     */
    @Override
    public int  loginTerminal(String terminalEui)
    {
        return loraNodeMapper.loginTerminal(terminalEui);
    }

    /**
     * 通过sn修改终端的状态
     *
     * @param terminalEui
     * @return 结果
     */
    @Override
    public int logoutTerminal(String terminalEui)
    {
        return loraNodeMapper.logoutTerminal(terminalEui);
    }


    /**
     * 删除终端 信息
     *
     * @param terminalEui
     * @return 结果
     */
    @Override
    public int deleteLoraTerminalByEui(String terminalEui)
    {
        return loraNodeMapper.deleteLoraTerminalByEui(terminalEui);
    }

    @Override
    public int updateLastMsgTime(String terminalEui)
    {
        return loraNodeMapper.updateLastMsgTime(terminalEui);
    }
    @Override
    public void checkNodeByEui(String terminalEui,String appEui)
    {
        LoraNode loraNode = new LoraNode();
        loraNode.setTerminalEui(terminalEui);
        if (selectLoraNodeList(loraNode).size() == 0) {
            loraNode.setAppEui(appEui);
            loraNode.setActiveState(1);
            loraNode.setRunState(String.valueOf(1));
            insertLoraNode(loraNode);
            System.out.println("====================不存在terminalEui为'" + loraNode.getTerminalEui() + "'的终端，已新增====================");
        }
    }

    @Override
    public String importNode(List<LoraNode> nodeList, Boolean isUpdateSupport, String operName) {
        {
            if (StringUtils.isNull(nodeList) || nodeList.size() == 0)
            {
                throw new ServiceException("导入用户数据不能为空！");
            }
            int successNum = 0;
            int failureNum = 0;
            StringBuilder successMsg = new StringBuilder();
            StringBuilder failureMsg = new StringBuilder();
            for (LoraNode node : nodeList)
            {
                try
                {
                    // 验证是否存在这个用户
                    LoraNode u = loraNodeMapper.selectNodeByEui(node.getTerminalEui());
                    if (StringUtils.isNull(u))
                    {
                        BeanValidators.validateWithException(validator, node);
                        this.insertLoraNode(node);
                        successNum++;
                        successMsg.append("<br/>" + successNum + "、账号 " + node.getTerminalEui() + " 导入成功");
                    }
                    else if (isUpdateSupport)
                    {
                        BeanValidators.validateWithException(validator, node);
                        this.updateLoraNode(node);
                        successNum++;
                        successMsg.append("<br/>" + successNum + "、账号 " + node.getTerminalEui() + " 更新成功");
                    }
                    else
                    {
                        failureNum++;
                        failureMsg.append("<br/>" + failureNum + "、账号 " + node.getTerminalEui() + " 已存在");
                    }
                }
                catch (Exception e)
                {
                    failureNum++;
                    String msg = "<br/>" + failureNum + "、账号 " + node.getTerminalEui() + " 导入失败：";
                    failureMsg.append(msg + e.getMessage());
                    log.error(msg, e);
                }
            }
            if (failureNum > 0)
            {
                failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
                throw new ServiceException(failureMsg.toString());
            }
            else
            {
                successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
            }
            return successMsg.toString();
        }
    }

    @Override
    public LoraNode selectNodeByEui(String terminalEui){
        return loraNodeMapper.selectNodeByEui(terminalEui);
    }

    @Override
    public int updateAppNameByEui(String appEui){
        LoraNode loraNode = new LoraNode();
        loraNode.setAppEui(appEui);
        loraNode.setAppName(loraAppService.selectLoraAppByAppEui(appEui).getAppName());
        return loraNodeMapper.updateAppNameByEui(loraNode);
    }
}
