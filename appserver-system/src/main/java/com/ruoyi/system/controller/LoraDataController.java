package com.ruoyi.system.controller;

import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.LoraData;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ILoraDataService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

/**
 * appserver帧数据Controller
 *
 * @author Weiwang
 * @date 2022-09-27
 */
@RestController
@RequestMapping("/data/dataManagement")
public class LoraDataController extends BaseController {
    @Autowired
    private ILoraDataService loraDataService;

    /**
     * 查询appserver帧数据列表
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:list')")
    @GetMapping("/list")
    public TableDataInfo list(LoraData loraData) {
        //通过appName获取到appEui 便于查询
        startPage();
        System.out.println(loraData);
        List<LoraData> list = loraDataService.selectLoraDataList(loraData);
        return getDataTable(list);
    }


    /**
     * 查询appserver帧数据列表
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:list')")
    @GetMapping("/warningList")
    public TableDataInfo warningList(LoraData loraData) {
        //通过appName获取到appEui 便于查询
            loraData.setWarningFlag(1);
        startPage();
        List<LoraData> list = loraDataService.selectLoraDataList(loraData);
        return getDataTable(list);
    }


    /**
     * 导出appserver帧数据列表
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:export')")
    @Log(title = "appserver帧数据", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LoraData loraData) {
        List<LoraData> list = loraDataService.selectLoraDataList(loraData);
        ExcelUtil<LoraData> util = new ExcelUtil<LoraData>(LoraData.class);
        util.exportExcel(response, list, "appserver帧数据数据");
    }

    /**
     * 导出appserver帧数据列表
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:exportwarning')")
    @Log(title = "appserver帧数据", businessType = BusinessType.EXPORT)
    @PostMapping("/exportwarning")
    public void exportwarning(HttpServletResponse response, LoraData loraData) {
        loraData.setWarningFlag(1);
        List<LoraData> list = loraDataService.selectLoraDataList(loraData);
        ExcelUtil<LoraData> util = new ExcelUtil<LoraData>(LoraData.class);
        util.exportExcel(response, list, "appserver帧数据数据");
    }



    /**
     * 获取appserver帧数据详细信息
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:query')")
    @GetMapping(value = "/{dataId}")
    public AjaxResult getInfo(@PathVariable("dataId") Long dataId) {
        return AjaxResult.success(loraDataService.selectLoraDataByDataId(dataId));
    }

    /**
     * 新增appserver帧数据
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:add')")
    @Log(title = "appserver帧数据", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LoraData loraData) {
        return toAjax(loraDataService.insertLoraData(loraData));
    }

    /**
     * 修改appserver帧数据
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:edit')")
    @Log(title = "appserver帧数据", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LoraData loraData) {
        return toAjax(loraDataService.updateLoraData(loraData));
    }

    /**
     * 删除appserver帧数据
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:remove')")
    @Log(title = "appserver帧数据", businessType = BusinessType.DELETE)
    @DeleteMapping("/{dataIds}")
    public AjaxResult remove(@PathVariable Long[] dataIds) {
        return toAjax(loraDataService.deleteLoraDataByDataIds(dataIds));
    }

    /**
     * 查询appserver帧数据列表(不分页)
     */
    @PreAuthorize("@ss.hasPermi('data:dataManagement:list')")
    @GetMapping("/AllDatalist")
    public TableDataInfo AllDatalist(LoraData loraData) {
        //通过appName获取到appEui 便于查询
//        startPage();
        List<LoraData> list = loraDataService.selectLoraDataList(loraData);
        return getDataTable(list);
    }

    @GetMapping("/viewNum")
    public int[] ViewNum () {

        Date date = new Date();
        int[] data= new int[7];
        for (int i = 0; i < 7; i++) {
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            System.out.println("今天的日期：" + df.format(date));
//            System.out.println("i天前的日期：" + df.format(new Date(date.getTime() - ((long) i * 24 * 60 * 60 * 1000))));
//            List<LoraData> loraData= loraDataService.viewNum(df.format(new Date(date.getTime() - ((long) i * 24 * 60 * 60 * 1000))));
            List<LoraData> loraData= loraDataService.viewNum(df.format(new Date(date.getTime() - ((long) (i-1) * 24 * 60 * 60 * 1000))),df.format(new Date(date.getTime() - ((long) i * 24 * 60 * 60 * 1000))));
            int names = loraData.size();
            data[i] = names;
        }
        return data;
    }




}
