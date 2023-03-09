package com.ruoyi.system.service.impl;

import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.api.constant.StatusCode;
import com.ruoyi.api.controller.NsAskController;
import com.ruoyi.common.constant.UserConstants;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.system.domain.LoraApp;
import com.ruoyi.system.mapper.LoraAppMapper;
import com.ruoyi.system.service.ILoraAppService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 应用Service业务层处理
 *
 * @author Weiwang
 * @date 2022-09-29
 */
@Service
public class LoraAppServiceImpl implements ILoraAppService
{

    private static final Logger logger = LoggerFactory.getLogger( NsAskController.class);
    SimpleDateFormat a = new SimpleDateFormat("yyyy年 MM月dd日 HH时mm分ss秒");
    @Autowired
    private LoraAppMapper loraAppMapper;

    /**
     * 查询应用
     *
     * @param appId 应用主键
     * @return 应用
     */
    @Override
    public LoraApp selectLoraAppByAppId(Long appId)
    {
        return loraAppMapper.selectLoraAppByAppId(appId);
    }

    @Override
    public LoraApp selectLoraAppByAppName(String appName)
    {
        return loraAppMapper.selectLoraAppByAppName(appName);
    }

    @Override
    public LoraApp selectLoraAppByAppEui(String appEui)
    {
        return loraAppMapper.selectLoraAppByAppEui(appEui);
    }

    /**
     * 查询应用列表
     *
     * @param loraApp 应用
     * @return 应用
     */
    @Override
    public List<LoraApp> selectLoraAppList(LoraApp loraApp)
    {
        return loraAppMapper.selectLoraAppList(loraApp);
    }

    @Override
    public List<String> selectLoraAppListAll()
    {
        return loraAppMapper.selectLoraAppListAll();
    }

    /**
     * 新增应用
     *
     * @param loraApp 应用
     * @return 结果
     */
    @Override
    @Transactional
    public int insertLoraApp(LoraApp loraApp)
    {
        int rows = loraAppMapper.insertLoraApp(loraApp);
        return rows;
    }


    /**
     * 恢复应用
     *
     * @param appEui 应用
     * @return 结果
     */
    @Override
    public int recoverLoraApp(String appEui)
    {
        return loraAppMapper.recoverLoraApp(appEui);
    }


    /**
     * 恢复应用
     *
     * @param loraApp 应用
     * @return 结果
     */
    @Override
    public int updateAppStatus(LoraApp loraApp)
    {
        return loraAppMapper.updateLoraApp(loraApp);
    }

    /**
     * 修改应用
     *
     * @param loraApp 应用
     * @return 结果
     */
    @Override
    public int updateLoraApp(LoraApp loraApp)
    {
        return loraAppMapper.updateLoraApp(loraApp);
    }

    /**
     * 批量删除应用
     *
     * @param appIds 需要删除的应用主键
     * @return 结果
     */
    @Override
    public int deleteLoraAppByAppIds(Long[] appIds)
    {
        return loraAppMapper.deleteLoraAppByAppIds(appIds);
    }

    /**
     * 删除应用信息
     *
     * @param appId 应用主键
     * @return 结果
     */
    @Override
    public int deleteLoraAppByAppId(Long appId)
    {
        return loraAppMapper.deleteLoraAppByAppId(appId);
    }

    /**
     * 删除应用信息
     *
     * @param appEui
     * @return 结果
     */
    @Override
    public int deleteLoraAppByAppEui(String appEui)
    {
        return loraAppMapper.deleteLoraAppByAppEui(appEui);
    }

    /**
     * 删除应用信息
     *
     * @param appEui
     * @return 结果
     */
    @Override
    public int thdeleteLoraAppByAppEui(String appEui)
    {
        return loraAppMapper.thdeleteLoraAppByAppEui(appEui);
    }
    /**
     * 校验App名称是否唯一
     *
     * @param app 信息
     * @return 结果
     */
//    @Override
//    public String checkAppNameUnique(LoraApp app){
//
//        Long appId = StringUtils.isNull(app.getAppId()) ? -1L : app.getAppId();
//        LoraApp info = loraAppMapper.checkAppNameUnique(app.getAppName());
//        if (StringUtils.isNotNull(info) && info.getAppId().longValue() != appId.longValue())
//        {
//            return UserConstants.NOT_UNIQUE;
//        }
//        return UserConstants.UNIQUE;
//    }

    /**
     * 校验AppEui是否唯一
     *
     * @param app 信息
     * @return 结果
     */
    @Override
    public Boolean checkAppEuiUnique(LoraApp app){
        Long appId = StringUtils.isNull(app.getAppId()) ? -1L : app.getAppId();
        LoraApp info = loraAppMapper.checkAppEuiUnique(app.getAppEui());
        if (StringUtils.isNotNull(info) && info.getAppId().longValue() != appId.longValue())
        {
        return UserConstants.UNIQUE;
        }else {
            return UserConstants.NOT_UNIQUE;
        }
    }


    @Override
    public Boolean checkAppAuth(String appEui){
        LoraApp info = loraAppMapper.checkAppAuth(appEui);
        System.out.println(info);
        System.out.println("=======================================");
        if (info != null){
            return UserConstants.NOT_UNIQUE;
        }else {
            return UserConstants.UNIQUE;
        }
    }

    @Override
    public List<LoraApp> checkAppHaveByEui(String appEui){
        return loraAppMapper.checkAppHavaByEui(appEui);
    }

    @Override
    public ResultBuilder checkAppAuthFromNs(LoraApp loraApp){
        System.out.println(loraApp);
        if (checkAppEuiUnique(loraApp)) {
            if (checkAppAuth(loraApp.getAppEui())){
                logger.debug("appEui为”" + loraApp.getAppEui() + "“的应用已授权,可正常使用");
                return new ResultBuilder(StatusCode.APP_AUTH);
            } else {
                logger.debug("appEui为“" + loraApp.getAppEui() + "”的应用未授权");
                return new ResultBuilder(StatusCode.APP_UNAUTH);
            }
        }else {
            logger.debug("不存在appEui为：“" + loraApp.getAppEui() + "”的应用");
            return new ResultBuilder(StatusCode.APP_UNEXIST);
        }
    }



}
