package com.ruoyi.system.controller;

import com.alibaba.fastjson2.JSON;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.service.ILoginReturnService;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ILoraNodeService;
import com.ruoyi.system.service.ILoraTerminalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static com.ruoyi.api.constant.DataConversion.bin2hex;
import static com.ruoyi.api.constant.DataConversion.int2Bin;
import static com.ruoyi.api.constant.SensorType.*;
import static com.ruoyi.api.constant.TerminalServiceCode.*;

import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;

/**
 * 终端 Controller
 *
 * @author ruoyi
 * @date 2022-10-09
 */
@RestController
@RequestMapping("/equ/terminal")
public class LoraTerminalController extends BaseController
{
    @Autowired
    private ILoraTerminalService loraTerminalService;
    @Autowired
    private ILoraAppService loraAppService;

    @Autowired
    private ILoraNodeService loraNodeService;
    @Autowired
    private ILoginReturnService loginReturnService;
    @Resource
    protected HttpServletRequest request;


    //定时任务配置

    /**
     * 查询终端 列表
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:list')")
    @GetMapping("/list")
    public TableDataInfo list(LoraTerminal loraTerminal) throws JsonProcessingException,ArithmeticException {
//        loraTerminalService.sendTerminalThresholdToNs(loraTerminal);
//        try{
//            //单独的向Ns查询Terminal状态的方法
//            loraTerminalService.queryOnlineNodeList();
//        }catch (Exception e){
//            System.out.println("11111111");
//        }
//        try {
//            //向NS查询TerminalGateway关联情况，并且更新到数据库
//            loraTerminalService.queryTerminalGatawayList();
//        }catch (Exception e){
//        }
        startPage();
        List<LoraTerminal> list = loraTerminalService.selectLoraTerminalList(loraTerminal);
        return getDataTable(list);
    }

    /**
     * 导出终端 列表
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:export')")
    @Log(title = "终端 ", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, LoraTerminal loraTerminal)
    {
        List<LoraTerminal> list = loraTerminalService.selectLoraTerminalList(loraTerminal);
        ExcelUtil<LoraTerminal> util = new ExcelUtil<LoraTerminal>(LoraTerminal.class);
        util.exportExcel(response, list, "终端数据");
    }

    /**
     * 获取终端 详细信息
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:query')")
    @GetMapping(value = "/{terminalId}")
    public AjaxResult getInfo(@PathVariable("terminalId") Long snId)
    {
        LoraTerminal loraTerminal = loraTerminalService.selectLoraTerminalBySnId(snId);
        //向NS发送更新网关请求
//        HttpUtils httpUtils = new HttpUtils();
//        LoraAppserver loraAppserver = new LoraAppserver();
//        loraAppserver.setAppserverName(AppServerConstants.APPSERVER_NAME);
//        loraAppserver.setAppserverId(AppServerConstants.APPSERVER_Id);
//        loraAppserver.setAppserverKey(AppServerConstants.APPSERVER_KEY);
//        String param = loraAppserver.toString()+loraTerminal.getTerminalEui();
//        String result = httpUtils.sendPost("http://127.0.0.1:8080/api/node/nodeStateQueryByDevEUI",param);
//        System.out.println(result);
        return AjaxResult.success(loraTerminalService.selectLoraTerminalBySnId(snId));
    }

    /**
     * 新增业务终端
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:add')")
    @Log(title = "终端 ", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody LoraTerminal loraTerminal)
    {
        if (loraTerminal.getSensorId()>16 || loraTerminal.getSensorId() <0)
        {
            return AjaxResult.error("传感器地址范围是0~16，请查证后重新新建。");
        }
        //自动生成sn：sn=terminalEui+sensorId+sensorType
        loraTerminal.setSn(loraTerminal.getTerminalEui()
                +String.format("%03d",loraTerminal.getSensorId())
                +String.format("%02d",loraTerminal.getSensorType()));

        //新建Node通信终端对象，以验证是否存在该lora终端
        LoraNode loraNode = new LoraNode();
        loraNode.setTerminalEui(loraTerminal.getTerminalEui());

        //验证是否存在该lora终端
        if (loraNodeService.selectLoraNodeList(loraNode).size() == 0){
            return AjaxResult.error("不存在该lora终端,请先添加该lora终端至数据库。");
        }

        if (loraTerminalService.selectLoraTerminalBySn(loraTerminal.getSn()) != null){
            return AjaxResult.error("SN已存在。");
        }

        //验证是否存在该app
        if (loraAppService.selectLoraAppByAppEui(loraTerminal.getAppEui()) == null){
            return AjaxResult.error("不存在该app,请先添加该app至数据库。");
        }
                //为appEui赋值，方便后面新增业务填充
//        String appEui = loraAppService.selectLoraAppByAppName(loraTerminal.getAppName()).getAppEui();
        String appName = loraAppService.selectLoraAppByAppEui(loraTerminal.getAppEui()).getAppName();
//        String appName = loraAppService.selectLoraAppByAppEui(loraTerminal.getAppEui()).getAppName();
        loraTerminal.setAppName(appName);
                //新增业务loginReturn
        LoginReturn loginReturn = new LoginReturn();
        if (loraTerminal.getSensorType()!=4){
                    //新增业务loginReturn 随机+TDMA
            loginReturn.setTerminalEui(loraTerminal.getTerminalEui());
                    loginReturn.setSn(loraTerminal.getSn());
                    loginReturn.setSensorId(loraTerminal.getSensorId());
                    loginReturn.setSensorType(loraTerminal.getSensorType());
                    if (loraTerminal.getSensorType() ==  TILT ){
                        loraTerminal.setThresholdNow("2,2,2");
                        loraTerminal.setThresholdMax("20,20,50");
                        loraTerminal.setThresholdMin("1,1,1");
                        loginReturn.setThreshold("1,2,3,4,5,6,7,8,9");
                    }else if (loraTerminal.getSensorType() == VIBRATION){
                        loraTerminal.setThresholdNow("2,2,2");
                        loraTerminal.setThresholdMax("20,20,50");
                        loraTerminal.setThresholdMin("1,1,1");
                        loginReturn.setThreshold("1,2,3,4,5,6,7,8,9");
                    }else if (loraTerminal.getSensorType() == ENVIRONMENT){
                        loraTerminal.setThresholdNow("2,2,2,2");
                        loraTerminal.setThresholdMax("20,20,50,1");
                        loraTerminal.setThresholdMin("1,1,1,1");
                        loginReturn.setThreshold("1,2,3,4,5,6,7,8,9,10,11,12");
                    }else if (loraTerminal.getSensorType() == LEVEL){
                        loraTerminal.setThresholdNow("2,2");
                        loraTerminal.setThresholdMax("20,20");
                        loraTerminal.setThresholdMax("1,1");
                        loginReturn.setThreshold("1,2,3,4");
                    }
                    loginReturn.setTdmaCycle(33L);
                    loginReturn.setBusinessCycle(200L);
                    loginReturn.setAppType(0);
                    loginReturn.setVirtualSubnet(0);
                    String wordId21 =int2Bin(Math.toIntExact(loraTerminal.getSensorType()),4)
                            + int2Bin(Math.toIntExact(loraTerminal.getSensorId()),4);
                    loginReturn.setWorkId(bin2hex(wordId21));
//                    loginReturn1.setWorkId("2"+String.format("%03d",loraTerminal.getSensorId()));
        }else {
                //新增业务loginReturn 实时（报警器）
                loginReturn.setTerminalEui(loraTerminal.getTerminalEui());
                loginReturn.setSn(loraTerminal.getSn());
                loginReturn.setSensorId(loraTerminal.getSensorId());
                loginReturn.setSensorType(loraTerminal.getSensorType());
                loginReturn.setAppType(1);
                String wordId21 = int2Bin(Math.toIntExact(loraTerminal.getSensorType()),4)
                        + int2Bin(Math.toIntExact(loraTerminal.getSensorId()),4);
                loginReturn.setWorkId(bin2hex(wordId21));
//                loginReturn.setWorkId("3"+String.format("%03d",loraTerminal.getSensorId()));
        }
        System.out.println(loginReturn);

        loginReturnService.insertLoginReturn(loginReturn);
        //告诉App有新增的业务终端
                new Thread(() -> {
                    loraTerminalService.sendTerminalMsgToApp(loraTerminal, loraTerminal.getAppEui(),
                            NEW_TERMINAL
                    );
                }).start();
                loraTerminal.setRunState("1");
                return toAjax(loraTerminalService.insertLoraTerminal(loraTerminal));

    }

    @GetMapping(value = "/AppBackMsg")
    @ResponseBody
    public void appBackMsg() throws IOException {
        //打印日志及时间戳
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== enter addTerminal ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");
        //将接收到的数据转为LoraTerminal对象
        System.out.println("APP已收到。");

    }
        //判断是否具有此appEui信息


    /**
     * 修改终端
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:edit')")
    @Log(title = "终端 ", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody LoraTerminal loraTerminal) {
        System.out.println(loraTerminal);
        if (loraTerminal.getAppEui() != null) {
            LoraApp loraApp = loraAppService.selectLoraAppByAppEui(loraTerminal.getAppEui());
            if (loraApp == null) {
                return AjaxResult.error("没有该APP，请重试！");
            }
            loraTerminal.setAppName(loraApp.getAppName());

        }
        return toAjax(loraTerminalService.updateLoraTerminal(loraTerminal));
    }


    /**
     *删除终端
     */
    @PreAuthorize("@ss.hasPermi('equ:terminal:remove')")
    @Log(title = "终端 ", businessType = BusinessType.DELETE)
    @DeleteMapping("/{snIds}")
    public AjaxResult remove(@PathVariable Long[] snIds)
    {
        for (int i = 0; i < snIds.length; i++) {
            loraTerminalService.setStateT3LoraTerminalById(snIds[i]);
        }
        return AjaxResult.success();
    }

//    /**
//     *终端校准
//     */
//    @PreAuthorize("@ss.hasPermi('equ:terminal:calibration')")
//    @Log(title = "终端 ", businessType = BusinessType.DELETE)
//    @DeleteMapping("/{snIds}")
//    public AjaxResult calibration(@PathVariable String[] sns)
//    {
//        return toAjax(loraTerminalService.calibration(sns));
//    }


    @GetMapping("/terlist")
    public int[] terlist()
    {
        LoraTerminal loraTerminal = new LoraTerminal();
        int[] arr= new int[5];
        for(long type = 1 ; type< 6; type ++ ){

            loraTerminal.setSensorType((int) type);
            List<LoraTerminal> list = loraTerminalService.selectLoraTerminalList(loraTerminal);
            arr[(int)type-1]=list.size();
//            System.out.println("type:" +type + "  num: " + list.size());
        }
        return arr;
    }

    @GetMapping("/runStateList")
    public int[] runStateList(LoraTerminal loraTerminal)
    {
        int[] arr= new int[2];
        for(int run = 0 ; run< 2; run ++ ){
            loraTerminal.setRunState(Integer.toString(run));
            List<LoraTerminal> list = loraTerminalService.selectLoraTerminalList(loraTerminal);
            arr[run]=list.size();
        }
        return arr;
    }


    /**
     * 校验
     */
    @RequestMapping(value = "/calibration", produces = MediaType.APPLICATION_JSON_VALUE, method = RequestMethod.POST)
    @ResponseBody
    public AjaxResult calibration() throws IOException {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== enter deleteApp ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");
        //将接收到的数据转为LoraNode对象
        InputStreamReader reader = new InputStreamReader(request.getInputStream(), StandardCharsets.UTF_8);
        WarningCome warningCome = JSON.parseObject(reader, WarningCome.class);
        System.out.println(warningCome);
        String[] sns = warningCome.getSns();
        int time = warningCome.getTime();
        return toAjax(loraTerminalService.calibration(sns,time));
    }

}