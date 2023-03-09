package com.ruoyi.system.service.impl;

import java.util.ArrayList;
import java.util.List;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.LoraTerminal;
import com.ruoyi.system.service.ILoraTerminalService;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.LoginReturnMapper;
import com.ruoyi.system.domain.LoginReturn;
import com.ruoyi.system.service.ILoginReturnService;

import javax.annotation.Resource;

import static com.ruoyi.api.constant.DataConversion.*;
import static com.ruoyi.api.constant.DataConversion.findTh;
import static com.ruoyi.api.constant.SensorType.*;
import static com.ruoyi.api.constant.SensorType.LEVEL;

/**
 * 【请填写功能名称】Service业务层处理
 *
 * @author ruoyi
 * @date 2022-11-23
 */
@Service
public class LoginReturnServiceImpl implements ILoginReturnService
{
    @Resource
    private LoginReturnMapper loginReturnMapper;

    @Resource
    private ILoginReturnService loginReturnService;

    @Resource
    private ILoraTerminalService loraTerminalService;
    /**
     * 查询【请填写功能名称】
     *
     * @param returnId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public LoginReturn selectLoginReturnByReturnId(Long returnId)
    {
        return loginReturnMapper.selectLoginReturnByReturnId(returnId);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param loginReturn 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<LoginReturn> selectLoginReturnList(LoginReturn loginReturn)
    {
        return loginReturnMapper.selectLoginReturnList(loginReturn);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param loginReturn 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertLoginReturn(LoginReturn loginReturn)
    {
        return loginReturnMapper.insertLoginReturn(loginReturn);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param loginReturn 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateLoginReturn(LoginReturn loginReturn)
    {
        return loginReturnMapper.updateLoginReturn(loginReturn);
    }

    @Override
    public int updatePayload(LoginReturn loginReturn)
    {
        return loginReturnMapper.updatePayload(loginReturn);
    }

    @Override
    public int updateLoginReturnBySn(LoginReturn loginReturn)
    {
        return loginReturnMapper.updateLoginReturnBySn(loginReturn);
    }

    @Override
    public int updateCycleBySn(LoginReturn loginReturn){
        return loginReturnMapper.updateCycleBySn(loginReturn);
    }

    @Override
    public int updateThresholdBySn(LoginReturn loginReturn){
        return loginReturnMapper.updateThresholdBySn(loginReturn);
    }

    @Override
    public int updatePayloadBySn(LoginReturn loginReturn){
        return loginReturnMapper.updateThresholdBySn(loginReturn);
    }
    /**
     * 批量删除【请填写功能名称】
     *
     * @param returnIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteLoginReturnByReturnIds(Long[] returnIds)
    {
        return loginReturnMapper.deleteLoginReturnByReturnIds(returnIds);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param returnId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteLoginReturnByReturnId(Long returnId)
    {
        return loginReturnMapper.deleteLoginReturnByReturnId(returnId);
    }

    @Override
    public ResultBuilder sendTerminalThresholdToNs(String sn){
        //向Ns发送App修改的终端信息：阈值
        //调用Http 发送post请求的方法
        //loraTerminal 是现在数据库中的该业务终端信息，用户获取其他字段信息
        LoginReturn loginReturn = loginReturnService.selectLoginReturnBySn(sn);

        int sensorType10 = Math.toIntExact(loginReturn.getSensorType());
        int sensorId10 = Math.toIntExact(loginReturn.getSensorId());

        String threshold10 = loginReturn.getThreshold().substring(0,loginReturn.getThreshold().length()-1);
        String[] th = threshold10.split(",");
        
        String appId02 = "00";
        String sensorType02 = int2Bin(sensorType10,6);
        String sensorId02 = int2Bin(sensorId10,8);
        String T02 = appId02 + sensorType02 + sensorId02;
        String t16 = bin2hex(T02);

        List<Integer> thh = new ArrayList<>();
        for (int i =0; i<th.length; i++){
            thh.add(i, Integer.valueOf(th[i]));
        }

        String arr = loginReturn.getThreshold();
        String sensorId = Integer.toHexString(sensorId10);
        String sensorType = Integer.toHexString(sensorType10);
        StringBuilder threshold = null;
        for (Integer integer : thh) {
            String thhh = Integer.toHexString(integer);
            assert threshold != null;
            threshold.append(thhh);
        }

        HttpUtils httpUtils = new HttpUtils();
//        String js = "{\"appServerId\":\"58d18f8b-8528-4140-88d4-de44187324cc\",\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        assert threshold != null;
        String js = JSONObject.toJSONString(threshold.toString());
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/node/queryTerminalGatewayList", js);
        //将Ns返回的结果转换为ResultBuilder
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        //提取ResultBuilder中的data：loraAppserverList (String)
        String loraAppserverList = resultBuilder.getData();
        //将String的loraAppserverList 转换为 String列表

        return new ResultBuilder();
    }


    /**
     * 给NS发送APP设置的业务终端的周期
     *
     * @param
     * @return 结果
     */
    @Override
    public ResultBuilder sendTerminalCycleToNs(LoginReturn loginReturn) {
        //向Ns发送App修改的终端信息：阈值
        //调用Http 发送post请求的方法
        //loraTerminal1 是现在数据库中的该业务终端信息，用户获取其他字段信息
        LoraTerminal loginReturn1 = loraTerminalService.selectLoraTerminalBySn(loginReturn.getSn());
//        LoginReturn loginReturn1 = loginReturnService.selectLoginReturnBySn(loginReturn.getSn());

        int sensorType10 = Math.toIntExact(loginReturn1.getSensorType());
        int sensorId10 = Math.toIntExact(loginReturn1.getSensorId());
        int cycle10 = Math.toIntExact(loginReturn1.getCycle());
        String appId02 = "00";
        String sensorType02 = int2Bin(sensorType10,6);
        String sensorId02 = int2Bin(sensorId10,8);
        String T02 = appId02 + sensorType02 + sensorId02;
        String T16 = bin2hex(T02);

        //TLV ： L = 2字节
        String L16 = "0002";
        String cycle16 = String.format("%04x",cycle10);
        //组帧
        String payload = T16 + L16 + cycle16;

        HttpUtils httpUtils = new HttpUtils();
        String js = "{\"APPEUI\":\""+ loginReturn.getAppEui() +"\",\"DevEui\":\"" + loginReturn.getSensorId() +"\",\"Payload\":\""+ payload +"\"}";
//        String js = JSONObject.toJSONString(payload);
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/node/queryTerminalGatewayList", js);
        //将Ns返回的结果转换为ResultBuilder
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        //提取ResultBuilder中的data：loraAppserverList (String)
        String loraAppserverList = resultBuilder.getData();
        //将String的loraAppserverList 转换为 String列表
        return new ResultBuilder();
    }





    @Override
    public LoginReturn selectLoginReturnBySn(String sn)
    {
        return loginReturnMapper.selectLoginReturnBySn(sn);
    }

    @Override
    public LoginReturn selectLoginReturnByEuiId(LoginReturn loginReturn)
    {
        return loginReturnMapper.selectLoginReturnByEuiId(loginReturn);
    }

    @Override
    public LoginReturn selectLoginReturnByTerminalEui(String terminslEui)
    {
        return loginReturnMapper.selectLoginReturnByTerminalEui(terminslEui);
    }

    @Override
    public int loginApp(String sn)
    {
        return loginReturnMapper.loginApp(sn);
    }

    @Override
    public int logoutTerminalByEui (String terminalEUi)
    {
        return loginReturnMapper.logoutTerminalByEui(terminalEUi);
    }
    @Override
    public void checkTerminalBySn (String sn,String appEui)
    {
        if (loginReturnService.selectLoginReturnBySn(sn) == null){
        LoginReturn loginReturn = new LoginReturn();
        loginReturn.setSn(sn);
        loginReturn.setAppEui(appEui);
        loginReturn.setTerminalEui(sn.substring(0,sn.length()-5));
        loginReturn.setSensorId((long) Integer.parseInt(sn.substring(sn.length() - 5, sn.length() - 2)));
        loginReturn.setSensorType(Math.toIntExact(Long.parseLong(sn.substring(sn.length() - 2))));
            String wordId21 =int2Bin(Math.toIntExact(loginReturn.getSensorType()),4)
                    + int2Bin(Math.toIntExact(loginReturn.getSensorId()),4);
            loginReturn.setWorkId(bin2hex(wordId21));
            if (loginReturn.getSensorType()!=WARNING){
                //新增业务loginReturn 随机+TDMA
                if (loginReturn.getSensorType() ==  TILT ){
                    loginReturn.setThreshold("1,20,20,1,20,20,1,30,50");
                }else if (loginReturn.getSensorType() == VIBRATION){
                    loginReturn.setThreshold("1,2,20,1,2,20,1,2,50");
                }else if (loginReturn.getSensorType() == ENVIRONMENT){
                    loginReturn.setThreshold("1,40,20,1,40,20,1,40,50,1,40,50");
                }else if (loginReturn.getSensorType() == LEVEL){
                    loginReturn.setThreshold("1,2,3,4");
                }
                loginReturn.setTdmaCycle(33L);
                loginReturn.setBusinessCycle(200L);
                loginReturn.setAppType(0);
                loginReturn.setVirtualSubnet(0);
            }else {
                loginReturn.setAppType(1);
            }
            System.out.println(loginReturn);

            System.out.println("====================不存在sn为'" + sn + "'的返回信息，已新增====================");
            loginReturnService.insertLoginReturn(loginReturn);
        }
    }

    @Override
    public List<String> writeLoginTerminalReturnMsg(String sn){
        List<String> loginReturnList = new ArrayList<>();
        LoginReturn loginReturn = loginReturnService.selectLoginReturnBySn(sn);
        if (loginReturn.getSensorType() != WARNING) {
            //编写二进制随机APPIds信息（负载）：cycle：周期 th：阈值
            String businessCycle = int2Bin(Math.toIntExact(loginReturn.getBusinessCycle()), 16);
            String tdmaCycle = int2Bin(Math.toIntExact(loginReturn.getTdmaCycle()), 16);
            String th = writeThBack(loginReturn.getSensorType(), findTh(loginReturn.getThreshold()));
            //编写二进制负载->十六进制负载
            String js1 = "{\"workId\":" + "0000" +
                    ",\"appType\":" + 1 +
                    ",\"cycle\":" + loginReturn.getBusinessCycle() +
                    ",\"timeWindow\":" + "0000" +
                    ",\"payload\":" + "\"" + bin2hex(businessCycle) + "\"" +
                    "}";
            //将以上信息编写入返回信息集合中
            loginReturnList.add(0, js1);
            String js2 = "{\"workId\":" + "0000" +
                    ",\"appType\":" + 0 +
                    ",\"timeWindow\":" + loginReturn.getTimeWindow() +
                    ",\"payload\":" + "\"" + bin2hex(tdmaCycle) + th + "\"" +
                    "}";
            //将以上信息编写入返回信息集合中
            loginReturnList.add(1, js2);
            System.out.println("发送的入网回应   " + bin2hex(tdmaCycle) + th);
        }
        //报警器的返回信息
        else {
            String sbb = "{\"workId\":" + loginReturn.getWorkId() +
                    ",\"appType\":" + "2" +
                    "}";
            //将以上信息编写入返回信息集合中
            loginReturnList.add(0, sbb);
        }
        return loginReturnList;
    }
}




