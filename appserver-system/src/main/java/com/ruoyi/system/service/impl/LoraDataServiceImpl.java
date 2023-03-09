package com.ruoyi.system.service.impl;

import com.rabbitmq.client.BuiltinExchangeType;
import com.rabbitmq.client.Channel;
import com.rabbitmq.client.Connection;
import com.rabbitmq.client.ConnectionFactory;
import com.ruoyi.api.controller.BsDataController;
import com.ruoyi.system.domain.LoraData;
import com.ruoyi.system.domain.LoraTerminal;
import com.ruoyi.system.mapper.LoraDataMapper;
import com.ruoyi.system.service.ILoraAppService;
import com.ruoyi.system.service.ILoraDataService;
import io.lettuce.core.dynamic.annotation.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.ruoyi.api.constant.DataConversion.*;
import static com.ruoyi.api.constant.SensorType.*;


/**
 * appserver帧数据Service业务层处理
 *
 * @author Weiwang
 * @date 2022-09-27
 */
@Service
public class LoraDataServiceImpl implements ILoraDataService {

    @Autowired
    private LoraDataMapper loraDataMapper;

    @Resource
    private ILoraAppService loraAppService;

    @Autowired
    RabbitTemplate rabbitTemplate;

    private static final Logger logger = LoggerFactory.getLogger(BsDataController.class);
    String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

    /**
     * 查询appserver帧数据
     *
     * @param dataId appserver帧数据主键
     * @return appserver帧数据
     */
    @Override
    public LoraData selectLoraDataByDataId(Long dataId) {
        return loraDataMapper.selectLoraDataByDataId(dataId);
    }

    /**
     * 查询appserver帧数据列表
     *
     * @param loraData appserver帧数据
     * @return appserver帧数据
     */
    @Override
    public List<LoraData> selectLoraDataList(LoraData loraData) {
        return loraDataMapper.selectLoraDataList(loraData);
    }


    /**
     * 新增appserver帧数据
     *
     * @param loraData appserver帧数据
     * @return 结果
     */
    @Override
    public int insertLoraData(LoraData loraData) {
        return loraDataMapper.insertLoraData(loraData);
    }

    /**
     * 修改appserver帧数据
     *
     * @param loraData appserver帧数据
     * @return 结果
     */
    @Override
    public int updateLoraData(LoraData loraData) {
        return loraDataMapper.updateLoraData(loraData);
    }

    /**
     * 批量删除appserver帧数据
     *
     * @param dataIds 需要删除的appserver帧数据主键
     * @return 结果
     */
    @Override
    public int deleteLoraDataByDataIds(Long[] dataIds) {
        return loraDataMapper.deleteLoraDataByDataIds(dataIds);
    }

    /**
     * 删除appserver帧数据信息
     *
     * @param dataId appserver帧数据主键
     * @return 结果
     */
    @Override
    public int deleteLoraDataByDataId(Long dataId) {
        return loraDataMapper.deleteLoraDataByDataId(dataId);
    }


    /**
     * 将包含解析后的数据的业务数据发给app
     *
     * @param loraData appserver帧数据
     */
    @Override
    public void sendDataToApp(LoraData loraData) {
        String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        logger.debug(" ==================== 向APP发送解析后的业务数据 ==================== ");
        logger.debug(" ====================  " + timestamp + "  ==================== ");
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
             第一个参数  交换机的名称__交换机的名字为appEui
             第二个参数  交换机的工作模式__direct
             第三个参数  交换机是否被持久化
             第四个参数  交换机在没有绑定队列后是否自动删除
             第五个参数  一些参数
             */
            channel.exchangeDeclare(
                    loraData.getAppEui(),
                    BuiltinExchangeType.DIRECT,
                    true,
                    false,
                    null
            );

            //判断是否为实时业务的数据
            if (loraData.getWarningFlag() != 1) {
                /*
                 创建正常数据队列
                 第一个参数  队列的名称：appEui+data
                 第二个参数  交换机是否被持久化
                 第三个参数  ...
                 第四个参数  交换机在没有绑定队列后是否自动删除
                 第五个参数  一些参数
                 */
                channel.queueDeclare(
                        "data.direct.queue",
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
                        "data.direct.queue",
                        loraData.getAppEui(),
                        "bsData"
                );

            } else {
                channel.queueDeclare(
                        "warning.direct.queue",
                        true,
                        false,
                        false,
                        null
                );
                channel.queueBind(
                        "warning.direct.queue",
                        loraData.getAppEui(),
                        "warning"
                );
            }

            //以数据传送的AppEui作为RabbitMq的交换机名称、以"AppEui+data/warningData"为routingKey
            String exchangeName = loraData.getAppEui();
            //给App发送的数据为map形式，包含：terminalEui、serviceType、payload、发送时间
            int sensorType = loraData.getSensorType();
            String sn = loraData.getSn();
            String payload = loraData.getRecvAfterdata();
            Map<String, Object> map = new HashMap<>();
            //传感器类型
            map.put("sensorType", sensorType);
            //传感器sn
            map.put("sn", sn);
            //负载
            map.put("payload", payload);
            System.out.println(map);

            //将消息携带绑定键值：TestDirectRouting 发送到交换机TestDirectExchange
            if (loraData.getWarningFlag() != 1) {
                rabbitTemplate.convertAndSend(exchangeName, "bsData", map);
                System.out.println("已将消息发送给app");
            } else {
                rabbitTemplate.convertAndSend(exchangeName, "warning", map);
                System.out.println("已将消息发送给app");
            }


        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("给APP发送消息出现异常...");
        } finally {
            //7. 释放连接关闭通道
            if (channel != null && channel.isOpen()) {
                try {channel.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }
            if (connection != null && connection.isOpen()) {
                try {connection.close();
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            }}}

    /**
     * 填充数据接受时间
     *
     * @return 结果
     */
    @Override
    public int updateRecvTime(Long dataId) {
        return loraDataMapper.updateRecvTime(dataId);
    }


    /**
     * 业务数据解析
     *
     * @return 结果
     */
    @Override
    public LoraData decode(LoraData loraData, int length111) {
        //trim()去除负载字符串中的空格 tip: 此方法只能删除字符串中的，不能删除首尾的
        String payload = loraData.getRecvData().replace(" ", "");
        //heard:前导的2进制

        int head = 12;
        int tlLength = 6;
        Map<String, Object> payload1 = new HashMap<>();
        int length = length111 - head;
        while (length != 0) {
            StringBuilder heard = new StringBuilder();
            //解析前头sensorType（传感器类型）、sensorId（传感器地址码）、length（数据长度）部分 (TL)
            for (int i = 0; i < tlLength ; i++) {
                char temp = payload.charAt(i + head);
                int a = Integer.parseInt(String.valueOf(temp), 16);
                String str1 = Integer.toBinaryString(a);
                String str2 = String.format("%04d", Integer.valueOf(str1));
                heard.append(str2);
            }
            //2进制==>10进制
            String appType1 = String.valueOf(Integer.parseInt(heard.substring(0, 4), 2));
            String sensorId = String.valueOf(Integer.parseInt(heard.substring(4, 8), 2));
            //数据点
            String num1 = appType1 + sensorId;
            String length11 = String.valueOf(Integer.parseInt(heard.substring(8, 16), 2));
            String length12 = String.valueOf(Integer.parseInt(heard.substring(16, 24), 2));
            String length1 = length12 + length11;
            //总长度计算
            length = length - tlLength - Integer.parseInt(length1) * 2;
            //16进制前导，位数为10
            head = head + tlLength;

            //根据appType进入分类器
            loraData.setSensorType(sensorTypeClassifier(appType1));
            int sensorType = loraData.getSensorType();
            int sensorId1 = Integer.parseInt(sensorId);
            int num = Integer.parseInt(num1);

            if (Integer.parseInt(length1)==1){
                loraData.setAppType(1);
                loraData.setWarningFlag(1);
            }else {
                //0 低功耗倾角传感器 1 数字型加速度计 2 多功能空气质量变送器 3 压力式静力水准仪
                //1 低功耗倾角传感器
                if (sensorType == TILT) {
                    double x = decodeIeee(payload,head);
                    if (sensorId1 == 0) {
                        payload1.put("X", x);
                    } else if (sensorId1 == 1) {
                        payload1.put("Y", x);
                    }
                    else if (sensorId1 == 2) {
                        payload1.put("temp", x);
                    }
                    else if (sensorId1 == 3) {
                        payload1.put("xzz", x);
                    } else if (sensorId1 == 4) {
                        payload1.put("warningX", x);
                    }
//                    else if (sensorId1 == 5) {
//                        payload1.put("warningY", x);
//                    }
                    else if (sensorId1 == 5) {
                        payload1.put("warningAzimuth", x);
                    }
                    System.out.println("===========================解析低功耗倾角传感器数据点：" + num + "的数据为" + x + "===============================");
                }

                //加速度计
                else if (sensorType == VIBRATION) {
                    double x = decodeIeee(payload,head);
                    if (sensorId1 == 0) {
                        payload1.put("X", x);
                    } else if (sensorId1 == 1) {

                        payload1.put("Y", x);
                    } else if (sensorId1 == 2) {

                        payload1.put("Z", x);
                    } else if (sensorId1 == 3) {

                        payload1.put("warningX", x);
                    } else if (sensorId1 == 4) {

                        payload1.put("warningY", x);
                    } else if (sensorId1 == 5) {

                        payload1.put("warningZ", x);
                    }
                    System.out.println("===========================解析加速度计的数据点：" + num + "的数据为" + x + "===============================");

                }
                //多功能空气质量变送器
                else if (sensorType == ENVIRONMENT) {

                    double x = decodeIeee(payload,head);
                    if (num == 30) {
                        payload1.put("PM2.5", x);
                    }
                    if (num == 31) {
                        payload1.put("hum", x);
                    }
                    if (num == 32) {
                        payload1.put("temp", x);
                    }
                    if (num == 33) {
                        payload1.put("noise", x);
                    }
                    if (num == 38) {
                        payload1.put("warningPM2.5", x);
                    }
                    if (num == 39) {
                        payload1.put("warningHumidity", x);
                    }
                    if (num == 40) {
                        payload1.put("warningTemperature", x);
                    }
                    if (num == 41) {
                        payload1.put("warningNoise", x);
                    }

                    System.out.println("===========================解析多功能空气质量变送器的数据点：" + num + "的数据为" + x + "===============================");

                }

                //压力式静力水准仪
                else if (sensorType == LEVEL) {

                    double x = decodeIeee(payload,head);
                    if (sensorId1 == 0) {

                        payload1.put("level", x);
                    }
                    if (sensorId1 == 1) {

                        payload1.put("temp", x);
                    }
                    if (sensorId1 == 2) {

                        payload1.put("warningDistance", x);
                    }
                    if (sensorId1 == 3) {

                        payload1.put("warningTemperature", x);
                    }
                    System.out.println("===========================解析水准仪传感器的数据点：" + num + "的数据为" + x + "===============================");
                }      else {
                    System.out.println("此次接受到的传感器类型未定义");
                }
            }

            head = head + Integer.parseInt(length1) * 2;
            loraData.setRecvAfterdata(payload1.toString());
        }
        return loraData;
    }

    @Override
    public List<LoraData> viewNum(String data1,String data2){
        return loraDataMapper.viewNum(data1,data2);
    }

    @Override
    public int updateAppNameByEui(String appEui){
        LoraData loraData = new LoraData();
        loraData.setAppEui(appEui);
        loraData.setAppName(loraAppService.selectLoraAppByAppEui(appEui).getAppName());
        return loraDataMapper.updateAppNameByEui(loraData);
    }


}




