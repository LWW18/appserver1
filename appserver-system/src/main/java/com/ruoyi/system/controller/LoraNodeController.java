package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.core.domain.entity.SysUser;
import com.ruoyi.system.domain.LoraApp;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ILoraTerminalService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.system.domain.LoraNode;
import com.ruoyi.system.service.ILoraNodeService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * Lora终端Controller
 *
 * @author ruoyi
 * @date 2022-11-23
 */
@RestController
@RequestMapping("/system/node")
public class LoraNodeController extends BaseController
{
    @Autowired
    private ILoraNodeService loraNodeService;
    @Autowired
    private ILoraAppService loraAppService;
    @Autowired
    private ILoraTerminalService loraTerminalService;


    /**
     * 查询Lora终端列表
     */
    @PreAuthorize("@ss.hasPermi('system:node:list')")
    @GetMapping("/list")
    public TableDataInfo list(LoraNode loraNode)
    {
        startPage();
        List<LoraNode> list = loraNodeService.selectLoraNodeList(loraNode);
        return getDataTable(list);
    }

    /**
     * 导出Lora终端列表
     */
    @PreAuthorize("@ss.hasPermi('system:node:export')")
    @Log(title = "Lora终端", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LoraNode loraNode)
    {
        List<LoraNode> list = loraNodeService.selectLoraNodeList(loraNode);
        ExcelUtil<LoraNode> util = new ExcelUtil<LoraNode>(LoraNode.class);
        util.exportExcel(response, list, "Lora终端数据");
    }

//    /**
//     * 导出Lora终端列表
//     */
//    @PreAuthorize("@ss.hasPermi('system:node:export')")
//    @Log(title = "Lora终端", businessType = BusinessType.EXPORT)
//    @PostMapping("/export/{terminalIds}")
//    public void export1(HttpServletResponse response, Long[] terminalIds)
//    {
//        List<LoraNode> list = loraNodeService.selectLoraNodeListByIds(terminalIds);
//        ExcelUtil<LoraNode> util = new ExcelUtil<LoraNode>(LoraNode.class);
//        util.exportExcel( list, "Lora终端数据");
//    }

    /**
     * 删除Lora终端
     */
    @PreAuthorize("@ss.hasPermi('system:node:remove')")
    @Log(title = "Lora终端", businessType = BusinessType.DELETE)
    @DeleteMapping("/{terminalIds}")
    public AjaxResult remove(@PathVariable Long[] terminalIds)
    {
        for (int i = 0; i < terminalIds.length; i++) {
            loraNodeService.setStateT3LoraNode(terminalIds[i]);
           LoraNode loraNode =  loraNodeService.selectLoraNodeByTerminalId(terminalIds[i]);
            loraTerminalService.setStateT2LoraTerminalByEui(loraNode.getTerminalEui());
        }
        return AjaxResult.success();
    }

    /**
     * 获取Lora终端详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:node:query')")
    @GetMapping(value = "/{terminalId}")
    public AjaxResult getInfo(@PathVariable("terminalId") Long terminalId)
    {
        return AjaxResult.success(loraNodeService.selectLoraNodeByTerminalId(terminalId));
    }

    /**
     * 新增Lora
     */
    @PreAuthorize("@ss.hasPermi('system:node:add')")
    @Log(title = "Lora终端", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LoraNode loraNode)
    {
        if (loraNodeService.selectNodeByEui(loraNode.getTerminalEui()) != null){
            return AjaxResult.error("终端EUI已存在。");
        }
        LoraApp loraApp = loraAppService.selectLoraAppByAppEui(loraNode.getAppEui());
        loraNode.setAppName(loraApp.getAppName());
        loraNode.setRunState("1");
        loraNode.setActiveState(0);
//        loraNode.setAppName(loraAppService.selectLoraAppByAppEui(loraNode.getAppEui()).getAppName());
        return toAjax(loraNodeService.insertLoraNode(loraNode));
    }

    /**
     * 修改Lora终端
     */
    @PreAuthorize("@ss.hasPermi('system:node:edit')")
    @Log(title = "Lora终端", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LoraNode loraNode) {
        System.out.println(loraNode);
        if (loraNode.getAppEui() != null) {
            LoraApp loraApp = loraAppService.selectLoraAppByAppEui(loraNode.getAppEui());
            if (loraApp == null) {
                return AjaxResult.error("没有该APP，请重试！");
            }
            loraNode.setAppName(loraApp.getAppName());
        }
        return toAjax(loraNodeService.updateLoraNode(loraNode));
    }



    @Log(title = "通信终端", businessType = BusinessType.IMPORT)
    @PreAuthorize("@ss.hasPermi('system:node:import')")
    @PostMapping("/importNode")
    public AjaxResult importData(MultipartFile file, boolean updateSupport) throws Exception
    {
        ExcelUtil<LoraNode> util = new ExcelUtil<LoraNode>(LoraNode.class);
        List<LoraNode> nodeList = util.importExcel(file.getInputStream());
        String operName = getUsername();
        String message = loraNodeService.importNode(nodeList, updateSupport, operName);
        return AjaxResult.success(message);
    }

    @PostMapping("/importTemplate")
    public void importTemplate(HttpServletResponse response)
    {
        ExcelUtil<LoraNode> util = new ExcelUtil<LoraNode>(LoraNode.class);
        util.importTemplateExcel(response, "通信终端数据");
    }
}
