package com.ruoyi.system.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson2.JSON;
import com.rabbitmq.client.BuiltinExchangeType;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.ruoyi.api.constant.ResultBuilder;
import com.ruoyi.common.utils.http.HttpUtils;
import com.ruoyi.system.domain.*;
import com.ruoyi.system.mapper.LoraTerminalMapper;
import com.ruoyi.system.service.*;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeoutException;

import static com.ruoyi.api.constant.DataConversion.*;
import static com.ruoyi.api.constant.TerminalServiceCode.NEW_TERMINAL;


/**
 * 终端 Service业务层处理
 *
 * @author ruoyi
 * @date 2022-10-09
 */
@Service
public class LoraTerminalServiceImpl implements ILoraTerminalService {
    @Resource
    LoraTerminalMapper loraTerminalMapper;
    @Autowired
    ILoraAppserverService loraAppserverService;
    @Autowired
    ILoraTerminalService loraTerminalService;
    @Autowired
    ILoginReturnService loginReturnService;

    @Resource
    private ILoraAppService loraAppService;
    @Autowired
    RabbitTemplate rabbitTemplate;  //使用RabbitTemplate,这提供了接收/发送等等方法
    @Autowired
    private ISysConfigService configService;

    /**
     * 查询终端
     *
     * @param snId 终端 主键
     * @return 终端
     */
    @Override
    public LoraTerminal selectLoraTerminalBySnId(Long snId) {
        return loraTerminalMapper.selectLoraTerminalBySnId(snId);
    }

    @Override
    public LoraTerminal selectLoraTerminalBySn(String sn) {
        return loraTerminalMapper.selectLoraTerminalBySn(sn);
    }


    /**
     * 查询业务终端 列表
     *
     * @param loraTerminal 业务终端
     * @return 业务终端 集合
     */
    @Override
    public List<LoraTerminal> selectLoraTerminalList(LoraTerminal loraTerminal) {
        return loraTerminalMapper.selectLoraTerminalList(loraTerminal);
    }

    @Override
    public List<LoraTerminal> selectLoraTerminalListByEui(String terminalEui) {
        return loraTerminalMapper.selectLoraTerminalListByEui(terminalEui);
    }

    /**
     * 新增终端
     *
     * @param loraTerminal 终端
     * @return 结果
     */
    @Override
    public int insertLoraTerminal(LoraTerminal loraTerminal) {
        return loraTerminalMapper.insertLoraTerminal(loraTerminal);
    }

    /**
     * 修改终端
     *
     * @param loraTerminal 终端
     * @return 结果
     */
    @Override
    public int updateLoraTerminal(LoraTerminal loraTerminal) {
        return loraTerminalMapper.updateLoraTerminal(loraTerminal);
    }

    @Override
    public int updateLoraTerminalBySn(LoraTerminal loraTerminal) {
        return loraTerminalMapper.updateLoraTerminalBySn(loraTerminal);
    }

    @Override
    public int updateLoraTerminalCycleBySn(LoraTerminal loraTerminal) {
        LoginReturn loginReturn = new LoginReturn();
        loginReturn.setBusinessCycle(loraTerminal.getCycle());
        loginReturn.setSn(loraTerminal.getSn());
        System.out.println(loginReturn);
        loginReturnService.updateCycleBySn(loginReturn);
        return loraTerminalMapper.updateLoraTerminalCycleBySn(loraTerminal);
    }

    /**
     * 批量删除终端
     *
     * @param snIds 需要删除的终端 主键
     * @return 结果
     */
    @Override
    public int deleteLoraTerminalBySnIds(Long[] snIds) {
        return loraTerminalMapper.deleteLoraTerminalBySnIds(snIds);
    }


    /**
     * 删除终端 信息
     *
     * @param snId 终端 主键
     * @return 结果
     */
    @Override
    public int deleteLoraTerminalBySnId(Long snId) {
        return loraTerminalMapper.deleteLoraTerminalBySnId(snId);
    }


    /**
     * 删除终端 信息
     *
     * @return 结果
     */
    @Override
    public int deleteLoraTerminalBySn(String sn) {
        return loraTerminalMapper.deleteLoraTerminalBySn(sn);
    }

    @Override
    public int appDeleteLoraTerminalBySn(String sn) {
        return loraTerminalMapper.appDeleteLoraTerminalBySn(sn);
    }

    @Override
    public int deleteLoraTerminalByEui(String terminalEui) {
        return loraTerminalMapper.deleteLoraTerminalByEui(terminalEui);
    }

    /**
     * 通过sn查询业务终端信息
     *
     * @return 业务终端集合
     */
    @Override
    public List<LoraTerminal> checkTerminalHaveBySn(String sn) {
        return loraTerminalMapper.checkTerminalHavaBySn(sn);
    }

    /**
     * 通过sn修改终端的状态
     *
     * @return 结果
     */
    @Override
    public int loginTerminal(String terminalEui) {
        return loraTerminalMapper.loginTerminal(terminalEui);
    }

    /**
     * 通过sn修改终端的状态
     *
     * @return 结果
     */
    @Override
    public int logoutTerminalByEui(String terminalEui) {
        return loraTerminalMapper.logoutTerminalByEui(terminalEui);
    }

    /**
     * 更新业务终端的最后发送消息时间
     *
     * @return 结果
     */
    @Override
    public int updateLastMsgTime(String terminalEui) {
        return loraTerminalMapper.updateLastMsgTime(terminalEui);
    }

    /**
     * 将包含解析后的数据的业务数据发给app
     *
     * @param loraTerminal,appEui,serviceType appserver帧数据
     */
    @Override
    public void sendTerminalMsgToApp(LoraTerminal loraTerminal, String appEui, int serviceType) {
        System.out.println("appEui    "  + appEui);
        //1：创建RabbitMQ连接工厂
        ConnectionFactory connectionFactory = new ConnectionFactory();
        //2：设置连接属性
        connectionFactory.setHost("112.74.93.170");
        connectionFactory.setUsername("admin");
        connectionFactory.setPassword("123456");
        Connection connection = null;
        Channel channel = null;
        //设置RabbitMq的交换机、队列、绑定关系
        try {
            connection = connectionFactory.newConnection();
            channel = connection.createChannel();
            /*
             创建交换机
             第一个参数  交换机的名称
             第二个参数  交换机的工作模式
             第三个参数  交换机是否被持久化
             第四个参数  交换机在没有绑定队列后是否自动删除
             第五个参数  一些参数
             */
            channel.exchangeDeclare(
//                    appEui,
                    "direct_sensor_exchange",
                    BuiltinExchangeType.DIRECT,
                    true,
                    false,
                    null
            );

            /*
             创建队列
             第一个参数  队列的名称
             第二个参数  交换机是否被持久化
             第三个参数  ...
             第四个参数  交换机在没有绑定队列后是否自动删除
             第五个参数  一些参数
             */
            channel.queueDeclare(
//                    "terminal",
                    "sensor.direct.queue",
                    true,
                    false,
                    false,
                    null
            );

            /*
             将交换机和队列进行绑定
             第一个参数  队列的名称
             第二个参数  交换机的名称
             第三个参数  绑定key的名称
             */
            channel.queueBind(
                    "sensor.direct.queue",
                    "direct_sensor_exchange",
                    "appEui"
            );
        } catch (IOException | TimeoutException e) {
            throw new RuntimeException(e);
        }
        //以数据传送的AppEui作为RabbitMq的交换机名称、routingKey
        String exchangeName = "direct_sensor_exchange";
        //给App发送的数据为map形式，包含：terminalEui、serviceType、payload、发送时间，其中payload也是一个map格式的数据
        Map<String, Object> map = new HashMap<>();
        //传感器Eui
        map.put("sn", loraTerminal.getSn());
        //服务类型（注册、入网、退网、删除）
        map.put("serviceId", serviceType);
        map.put("sensorType", loraTerminal.getSensorType());
        //将消息携带绑定键值：TestDirectRouting 发送到交换机TestDirectExchange
        rabbitTemplate.convertAndSend(exchangeName, "appEui", map);

    }

    /**
     * 根据terminalEui修改业务终端的运行状态
     *
     * @return 结果
     */
    @Override
    public int changeRunStateByterminalEui(LoraTerminal loraTerminal) {
        return loraTerminalMapper.changeRunStateByterminalEui(loraTerminal);
    }

    /**
     * 向Ns请求lora终端信息，然后更新在业务终端中
     */
    @Override
    public void queryOnlineNodeList() {

        //向Ns获取最新的业务终端运行状态
        //（其实Ns只知道Lora终端的运行状态，所以通过查询传感器绑定的终端，将该终端下所有传感器设备设置为同样的运行状态
        //调用Http 发送post请求的方法
        HttpUtils httpUtils = new HttpUtils();
        //请求参数为Json，我们先把Appserver对象列出来，再转成Json格式
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverName("01223");
        loraAppserver.setAppserverId("58d18f8b-8528-4140-88d4-de44187324cc");
        loraAppserver.setAppserverKey("01234567");
        String js1 = loraAppserver.toString();
        HashMap<String, Object> map = new HashMap<>();
        map.put("appServerId", loraAppserver.getAppserverId());
        map.put("appServerName", loraAppserver.getAppserverName());
        map.put("appServerKey", loraAppserver.getAppserverKey());
        String map1 = map.toString();
        String js = "{\"appServerId\":\"58d18f8b-8528-4140-88d4-de44187324cc\",\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http:localhost:8080/api/node/queryOnlineNodeList", map1);
        //将Ns返回的结果转换为ResultBuilder
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        //提取ResultBuilder中的data：loraAppserverList (String)
        String loraAppserverList = resultBuilder.getData();
        //将String的loarAppserverList 转换为 String列表
        List<Node> loraAppserverList1 = JSON.parseArray(loraAppserverList, Node.class);
        for (int i = 0; i < loraAppserverList1.size(); i++) {
            LoraTerminal loraTerminal1 = new LoraTerminal();
            loraTerminal1.setTerminalEui(loraAppserverList1.get(i).getDevEUI());
            loraTerminal1.setRunState(loraAppserverList1.get(i).getRunState());
            loraTerminalService.changeRunStateByterminalEui(loraTerminal1);
        }
        queryTerminalGatawayList();
    }

    /**
     * 向Ns请求lora终端网关关联信息，然后更新在业务终端中
     */
    @Override
    public void queryTerminalGatawayList() {
        //向Ns获取最新的业务终端运行状态
        //（其实Ns只知道Lora终端的运行状态，所以通过查询传感器绑定的终端，将该终端下所有传感器设备设置为同样的运行状态
        //调用Http 发送post请求的方法
        HttpUtils httpUtils = new HttpUtils();
        //请求参数为Json，我们先把Appserver对象列出来，再转成Json格式
        LoraAppserver loraAppserver = new LoraAppserver();
        loraAppserver.setAppserverName("01223");
        loraAppserver.setAppserverId("58d18f8b-8528-4140-88d4-de44187324cc");
        loraAppserver.setAppserverKey("01234567");
        String js1 = loraAppserver.toString();

        HashMap<String, Object> map = new HashMap<>();
        map.put("appServerId", loraAppserver.getAppserverId());
        map.put("appServerName", loraAppserver.getAppserverName());
        map.put("appServerKey", loraAppserver.getAppserverKey());
        String map1 = map.toString();

        String js = "{\"appServerId\":\"58d18f8b-8528-4140-88d4-de44187324cc\",\"appServerName\":\"01223\",\"appServerKey\":\"01234567\"}";
        //调用postMethod方法
        String result = httpUtils.postMethod("http://222.24.22.78:8080/api/node/queryTerminalGatewayList", map1);
        //将Ns返回的结果转换为ResultBuilder
        ResultBuilder resultBuilder = JSONObject.parseObject(result, ResultBuilder.class);
        //提取ResultBuilder中的data：loraAppserverList (String)
        String loraAppserverList = resultBuilder.getData();
        //将String的loraAppserverList 转换为 String列表

        List<TerminalGateway> loraTerminalGatewayList1 = JSON.parseArray(loraAppserverList, TerminalGateway.class);
        for (TerminalGateway terminalGateway : loraTerminalGatewayList1) {
            LoraTerminal loraTerminal1 = new LoraTerminal();
            loraTerminal1.setTerminalEui(terminalGateway.getTerminalEui());
            loraTerminal1.setGatewayEui(terminalGateway.getGatewayEui());
            loraTerminalService.changeGatewayByEui(loraTerminal1);
        }
    }

    /**
     * 修改业务终端绑定的gatewayEui
     *
     * @return 结果
     */
    @Override
    public int changeGatewayByEui(LoraTerminal loraTerminal) {
        return loraTerminalMapper.changeGatewayByEui(loraTerminal);
    }

    /**
     * 给NS发送报警命令
     *
     * @return 结果
     */
    @Override
    public String sendAlarmCommandToNs(LoraTerminal loraTerminal,int control) {
        //向Ns发送App请求报警器命令
        HttpUtils httpUtils = new HttpUtils();
        //新建LoraTerminal对象，通过sn来确定loraTerminal
        String sn = loraTerminal.getSn();
        String devEui = sn.substring(0,sn.length()-5);
        String length = "000B";
        String version = "02";
        String code = "04";
        String flow ="0000";
        String TLV = "6100010"+control;
        System.out.println("TLV    " + TLV);
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("appEui", "10110001");
        jsonObject.put("devEui", devEui);
        jsonObject.put("appId", "2");
        jsonObject.put("payload", length + version + code + flow + "02" + TLV);
        jsonObject.put("ack", "0000");
        jsonObject.put("msgId", "1");
        String js = jsonObject.toJSONString();
        System.out.println(js);
        String result = httpUtils.postMethod("http://112.74.93.170:54321/api/DataFromAPPServer/recData", js);
        //将Ns返回的结果转换为ResultBuilder
        System.out.println("以将返回信息发送至ns");
        //将Ns返回的结果转换为ResultBuilder
        System.out.println("ns返回的信息： " + result);
        return "resultBuilder";
    }

    @Override
    public int calibration(String[] sns,int time) {
        //TLV
        for (String sn : sns) {
            String t1 = "09";
            String L1 = "0001";
            String V1 = "00";
            String T2 = "0A";
            String L2 = "0004";
            String V2 = bin2hex(int2Bin(time,8));
            String TLV = t1 + L1 + V1 + T2 + L2 + V2;
            LoginReturn loginReturn = new LoginReturn();
            loginReturn.setSn(sn);
            loginReturn.setPayload(TLV);
            loginReturn.setVirtualSubnet(1);
            loginReturnService.updateThresholdBySn(loginReturn);
        }
        return 132;
    }

    @Override
    public void checkTerminalBySn(String sn,String appEui) {
        LoraTerminal loraTerminal = new LoraTerminal();
        if (loraTerminalService.selectLoraTerminalBySn(sn) == null){
            loraTerminal.setSn(sn);
            loraTerminal.setTerminalEui(sn.substring(0,sn.length()-5));
            loraTerminal.setSensorId(Long.valueOf(sn.substring(sn.length()-5,sn.length()-2)));
            loraTerminal.setSensorType(Integer.valueOf(sn.substring(sn.length()-1)));
            new Thread(() -> {
                loraTerminalService.sendTerminalMsgToApp(loraTerminal, appEui,
                        NEW_TERMINAL
                );
            }).start();
            loraTerminalService.insertLoraTerminal(loraTerminal);
            System.out.println("====================不存在sn为'" + sn + "'的传感器，已新增====================");
        }

    }

    @Override
    public int setStateT3LoraTerminalById(Long snId){
        return loraTerminalMapper.setStateT3LoraTerminalById(snId);
    }

    @Override
    public int setStateT2LoraTerminalByEui(String terminalEui){
        return loraTerminalMapper.setStateT2LoraTerminalByEui(terminalEui);
    }
    /**
     * 导入用户数据
     *
     * @param nodeList 用户数据列表
     * @param isUpdateSupport 是否更新支持，如果已存在，则进行更新数据
     * @param operName 操作用户
     * @return 结果
     */
    @Override
    public String importNode(List<LoraNode> nodeList, Boolean isUpdateSupport, String operName)
    {
        return null;
//        if (StringUtils.isNull(nodeList) || nodeList.size() == 0)
//        {
//            throw new ServiceException("导入用户数据不能为空！");
//        }
//        int successNum = 0;
//        int failureNum = 0;
//        StringBuilder successMsg = new StringBuilder();
//        StringBuilder failureMsg = new StringBuilder();
//        String password = configService.selectConfigByKey("sys.user.initPassword");
//        for (LoraNode node : nodeList)
//        {
//            try
//            {
//                // 验证是否存在这个用户
//                LoraNode nod = loraTerminalMapper.selectUserByUserName(node.getUserName());
//                if (StringUtils.isNull(nod))
//                {
//                    BeanValidators.validateWithException(validator, user);
//                    user.setPassword(SecurityUtils.encryptPassword(password));
//                    user.setCreateBy(operName);
//                    this.insertUser(user);
//                    successNum++;
//                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 导入成功");
//                }
//                else if (isUpdateSupport)
//                {
//                    BeanValidators.validateWithException(validator, user);
//                    user.setUpdateBy(operName);
//                    this.updateUser(user);
//                    successNum++;
//                    successMsg.append("<br/>" + successNum + "、账号 " + user.getUserName() + " 更新成功");
//                }
//                else
//                {
//                    failureNum++;
//                    failureMsg.append("<br/>" + failureNum + "、账号 " + user.getUserName() + " 已存在");
//                }
//            }
//            catch (Exception e)
//            {
//                failureNum++;
//                String msg = "<br/>" + failureNum + "、账号 " + user.getUserName() + " 导入失败：";
//                failureMsg.append(msg + e.getMessage());
//                log.error(msg, e);
//            }
//        }
//        if (failureNum > 0)
//        {
//            failureMsg.insert(0, "很抱歉，导入失败！共 " + failureNum + " 条数据格式不正确，错误如下：");
//            throw new ServiceException(failureMsg.toString());
//        }
//        else
//        {
//            successMsg.insert(0, "恭喜您，数据已全部导入成功！共 " + successNum + " 条，数据如下：");
//        }
//        return successMsg.toString();
//    }
}

    @Override
    public int updateAppNameByEui(String appEui){
        LoraTerminal loraTerminal = new LoraTerminal();
        loraTerminal.setAppEui(appEui);
        loraTerminal.setAppName(loraAppService.selectLoraAppByAppEui(appEui).getAppName());
        return loraTerminalMapper.updateAppNameByEui(loraTerminal);
    }

}

