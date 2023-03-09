package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.domain.entity.SysDictData;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.exception.ServiceException;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.LoraApp;
import com.ruoyi.system.service.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 应用Controller
 *
 * @author Weiwang
 * @date 2022-09-29
 */
@RestController
@RequestMapping("/app/appManagement")
public class LoraAppController extends BaseController {
    @Autowired
    private ILoraAppService loraAppService;

    @Autowired
    private ILoraNodeService loraNodeService;
    @Autowired
    private ILoraTerminalService loraTerminalService;
    @Autowired
    private ILoraDataService loraDataService;

    @Autowired
    private ISysDictDataService sysDictDataService;

    HttpUtils httpUtils = new HttpUtils();

    //日志及时间戳
    private static final Logger logger = LoggerFactory.getLogger(LoraAppController.class);

    /**
     * 查询应用列表
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:list')")
    @GetMapping("/list")
    public TableDataInfo list(LoraApp loraApp)
    {
        startPage();

        Date date = new Date();
        List<LoraApp> list = loraAppService.selectLoraAppList(loraApp);
        for (int i = 0; i < list.size(); i++) {
            System.out.println(date);
            System.out.println(list.get(i).getTimeto());
            System.out.println(list.get(i).getTimeto().after(date));
            if (list.get(i).getTimeto().after(date)){
                list.get(i).setAuthState("1");
                loraAppService.updateAppStatus(list.get(i));
            }
            else {
                list.get(i).setAuthState("0");
                loraAppService.updateAppStatus(list.get(i));
            }

        }
        return getDataTable(list);
    }

    /**
     * 导出应用列表
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:export')")
    @Log(title = "应用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LoraApp loraApp)
    {
        List<LoraApp> list = loraAppService.selectLoraAppList(loraApp);
        ExcelUtil<LoraApp> util = new ExcelUtil<LoraApp>(LoraApp.class);
        util.exportExcel(response, list, "应用数据");
    }

    /**
     * 获取应用详细信息
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:query')")
    @GetMapping(value = "/{appId}")
    public AjaxResult getInfo(@PathVariable("appId") Long appId)
    {
        return AjaxResult.success(loraAppService.selectLoraAppByAppId(appId));
    }

    /**
     * 新增应用
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:add')")
    @Log(title = "应用", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LoraApp loraApp)
    {
        logger.debug(" ==================== enter insertApp ====================");
        logger.debug(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));

       if(loraAppService.checkAppEuiUnique(loraApp)) {
            logger.debug("新增应用'" + loraApp.getAppName() + "'失败，输入的AppEui已存在");
            return AjaxResult.error("新增App'" + loraApp.getAppName() + "'失败，您输入的AppEui已存在。");
        }
        else {
           SysDictData sysDictData = new SysDictData();
           sysDictData.setDictValue(loraApp.getAppEui());
           sysDictData.setDictLabel(loraApp.getAppName());
           sysDictData.setDictType("lora_app_name");
           sysDictData.setDictSort(0L);
           sysDictData.setListClass("default");
           sysDictData.setIsDefault("N");
           sysDictData.setStatus("0");
           sysDictDataService.insertDictData(sysDictData);
            try {
                new Thread(() -> {
                    String js = loraApp.toString();
                    //调用postMethod方法
                    String result = httpUtils.postMethod("http://222.24.22.78:8080/api/APP/APPAddForNs", js);
                    System.out.println(result);
                }).start();
            }catch (Exception e){
            }
        }
        return toAjax(loraAppService.insertLoraApp(loraApp));
    }

    /**
     * 修改应用
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:edit')")
    @Log(title = "应用", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LoraApp loraApp)
    {
        logger.debug(" ==================== enter editApp ====================");
        logger.debug(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
//        if (UserConstants.NOT_UNIQUE.equals(loraAppService.checkAppNameUnique(loraApp))) {
//            logger.debug("修改应用'" + loraApp.getAppEui() + "'失败，App名称已存在");
//            return AjaxResult.error("修改App'" + loraApp.getAppName() + "'失败，App名称已存在");
//            //比对AppEui是否已存在
//        }else
            if(loraAppService.checkAppEuiUnique(loraApp)) {
            logger.debug("修改应用'" + loraApp.getAppEui() + "'失败，输入的AppEui已存在。");
            return AjaxResult.error("修改App'" + loraApp.getAppName() + "'失败，您输入的AppEui已存在。");
        } else {
                loraAppService.updateLoraApp(loraApp);
                loraNodeService.updateAppNameByEui(loraApp.getAppEui());
                loraTerminalService.updateAppNameByEui(loraApp.getAppEui());
                loraDataService.updateAppNameByEui(loraApp.getAppEui());
            try {
                new Thread(() -> {
                    String js = loraApp.toString();
                    //调用postMethod方法
                    String result = httpUtils.postMethod("http://222.24.22.78:8080/api/APP/APPEditForNs", js);
                    System.out.println(result);
                }).start();
            }catch (Exception e){
                System.out.println("1111111111111");
            }
        }

        return AjaxResult.success();
    }


    /**
     * 状态修改
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:edit')")
    @Log(title = "App管理", businessType = BusinessType.UPDATE)
    @PutMapping("/changeStatus")
    public AjaxResult changeStatus(@RequestBody LoraApp loraApp)
    {
        return toAjax(loraAppService.updateAppStatus(loraApp));
    }

    /**
     * 删除应用
     */
    @PreAuthorize("@ss.hasPermi('app:appManagement:remove')")
    @Log(title = "应用", businessType = BusinessType.DELETE)
    @DeleteMapping("/{appIds}")
    public AjaxResult remove(@PathVariable Long[] appIds)
    {

        int successNum = 0;
        int failureNum = 0;
        StringBuilder successMsg = new StringBuilder();
        StringBuilder failureMsg = new StringBuilder();
        try {

            for (int i = 0; i <= appIds.length ; i++){
                LoraApp loraApp = loraAppService.selectLoraAppByAppId(appIds[i]);
                if (Objects.equals(loraApp.getAuthState(), "1")){
                    failureNum++;
                    failureMsg.append( failureNum + "、 " + loraApp.getAppName());
                }else {
                    successNum++;
                    successMsg.append("<br/>" + failureNum + "、 " + loraApp.getAppName() + " 删除成功");
                    sysDictDataService.deleteDictDataByValue(loraApp.getAppEui());
                }
                //告诉NS删除应用
                new Thread(() -> {
                    String param = loraApp.toString();
                    String result = HttpUtils.sendPost("http://127.0.0.1:8080/api/APP/APPDeleteForNS",param);
                    System.out.println(result);
                }).start();
            }
        }catch (Exception e){
        }

        if (failureNum > 0)
        {
            failureMsg.insert(0, "很抱歉，删除失败！有 " + failureNum + " 个APP还处于授权状态：");
            throw new ServiceException(failureMsg.toString());
        }
        else
        {
            successMsg.insert(0, "应用删除成功！共 " + successNum + " 条，数据如下：");
        }

        return toAjax(loraAppService.deleteLoraAppByAppIds(appIds));
    }
}
