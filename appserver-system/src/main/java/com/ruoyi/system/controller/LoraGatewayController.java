package com.ruoyi.system.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import com.ruoyi.api.util.TimerUtil;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.LoraInterface;
import com.ruoyi.system.domain.LoraTerminal;
import com.ruoyi.system.service.ILoraInterfaceService;
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
import com.ruoyi.system.domain.LoraGateway;
import com.ruoyi.system.service.ILoraGatewayService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 网关Controller
 *
 * @author ruoyi
 * @date 2022-11-05
 */
@RestController
@RequestMapping("/system/gateway")
public class LoraGatewayController extends BaseController {
    @Autowired
    private ILoraGatewayService loraGatewayService;
    @Autowired
    private ILoraTerminalService loraTerminalService;

    @Autowired
    private ILoraInterfaceService loraInterfaceService;

    HttpUtils httpUtils = new HttpUtils();

    //appServer向NS发送授权消息
    //并且根据返回的AppserverId修改数据库信息

    TimerUtil timerUtil;

    //从Ns获取最新的终端运行状态方法
//    public String AskGateway(){
//        //向Ns获取最新的业务终端运行状态
//        //（其实Ns只知道Lora终端的运行状态，所以通过查询传感器绑定的终端，将该终端下所有传感器设备设置为同样的运行状态
//        //调用Http 发送post请求的方法
//        HttpUtils httpUtils = new HttpUtils();
//        //请求参数为Json，我们先把Appserver对象列出来，再转成Json格式
//        LoraAppserver loraAppserver = new LoraAppserver();
//        loraAppserver.setAppserverName("01223");
//        loraAppserver.setAppserverId("58d18f8b-8528-4140-88d4-de44187324cc");
//        loraAppserver.setAppserverKey("01234567");
//
//        String js = "{\"appServerId\":\"58d18f8b-8528-4140-88d4-de44187324cc\",\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
//        //调用postMethod方法
//        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/node/queryGatewayList", js);
//
//        //将Ns返回的结果转换为ResultBuilder
//        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
//        //提取ResultBuilder中的data：loraAppserverList (String)
//        String loraAppserverList = resultBuilder.getData();
//        //将String的loarAppserverList 转换为 String列表
//        List<Node> loraAppserverList1 = JSON.parseArray(loraAppserverList,Node.class);
//        for (int i = 0; i< loraAppserverList1.size(); i++){
//            System.out.println(loraAppserverList1.get(i));
//            LoraGateway loraGateway = new LoraGateway();
//            loraGateway.setTerminalEui(loraAppserverList1.get(i).getDevEUI());
//            loraGateway.setRunState(loraAppserverList1.get(i).getRunState());
//            loraGatewayService.changeRunStateByterminalEui(loraTerminal1);
//        }
//        return null;
//    };

    /**
     * 查询网关列表
     */
    @PreAuthorize("@ss.hasPermi('system:gateway:list')")
    @GetMapping("/list")
    public TableDataInfo list(LoraGateway loraGateway) {
        //定时方法
//        Runnable runnable = () -> {
//            loraGatewayService.queryGatawatyList();
//        };
//        final long time = 5;
//        final int period = 100;
//        timerUtil = new TimerUtil();
//        timerUtil.scheduleAtFixedRate(runnable,time,period);
//        System.out.println("模拟调用数据监控接口已开启！模拟数据变化频率：" + period + "秒");
//        try {
//            loraGatewayService.queryGatawatyList();
//        }catch (Exception e){
//
//        }
        startPage();
        List<LoraGateway> list = loraGatewayService.selectLoraGatewayList(loraGateway);
        return getDataTable(list);
    }

    /**
     * 导出网关列表
     */
    @PreAuthorize("@ss.hasPermi('system:gateway:export')")
    @Log(title = "网关", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LoraGateway loraGateway) {
        List<LoraGateway> list = loraGatewayService.selectLoraGatewayList(loraGateway);
        ExcelUtil<LoraGateway> util = new ExcelUtil<LoraGateway>(LoraGateway.class);
        util.exportExcel(response, list, "网关数据");
    }

    /**
     * 获取网关详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:gateway:query')")
    @GetMapping(value = "/{gatewayId}")
    public AjaxResult getInfo(@PathVariable("gatewayId") Long gatewayId) {
        return AjaxResult.success(loraGatewayService.selectLoraGatewayByGatewayId(gatewayId));
    }

    /**
     * 新增网关
     */
    @PreAuthorize("@ss.hasPermi('system:gateway:add')")
    @Log(title = "网关", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LoraGateway loraGateway) {
        return toAjax(loraGatewayService.insertLoraGateway(loraGateway));
    }

    /**
     * 修改网关
     */
    @PreAuthorize("@ss.hasPermi('system:gateway:edit')")
    @Log(title = "网关", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LoraGateway loraGateway) {
        return toAjax(loraGatewayService.updateLoraGateway(loraGateway));
    }

    /**
     * 删除网关
     */
    @PreAuthorize("@ss.hasPermi('system:gateway:remove')")
    @Log(title = "网关", businessType = BusinessType.DELETE)
    @DeleteMapping("/{gatewayIds}")
    public AjaxResult remove(@PathVariable Long[] gatewayIds) {
        return toAjax(loraGatewayService.deleteLoraGatewayByGatewayIds(gatewayIds));
    }

    /**
     * 查询网关名下业务数据列表
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:query')")
    @GetMapping("/terminalList/{gatewayId}")
    public TableDataInfo termialList(@PathVariable("gatewayId") String gatewayId) {

        LoraGateway loraGateway = loraGatewayService.selectLoraGatewayByGatewayId(Long.valueOf(gatewayId));
        LoraTerminal loraTerminal = new LoraTerminal();
        loraTerminal.setGatewayEui(loraGateway.getGwEui());
        startPage();
        List<LoraTerminal> list = loraTerminalService.selectLoraTerminalList(loraTerminal);
        return getDataTable(list);
    }



    /**
     * 获取【请填写功能名称】详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:interface:query')")
    @GetMapping("/interface/{gwEui}")
    public TableDataInfo getInfo(@PathVariable("gwEui") String gwEui)
    {
        LoraInterface loraInterface = new LoraInterface();
        loraInterface.setGwEui(gwEui);
        startPage();
        List<LoraInterface> list = loraInterfaceService.selectLoraInterfaceList(loraInterface);
        return getDataTable(list);
    }


}
