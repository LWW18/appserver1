package com.ruoyi.api.controller;



import org.springframework.amqp.core.ExchangeTypes;
import org.springframework.amqp.rabbit.annotation.*;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.Map;

/**
 * @Description:
 * @author: Weiwang
 * @create: 2022-12-05-13-58
 */

// bindings其实就是用来确定队列和交换机绑定关系
@RabbitListener(bindings =@QueueBinding(
        // email.fanout.queue 是队列名字，这个名字你可以自定随便定义。
        value = @Queue(value = "fastest",autoDelete = "false"),
        // order.fanout 交换机的名字 必须和生产者保持一致
        exchange = @Exchange(value = "fastest",
                // 这里是确定的rabbitmq模式是：fanout 是以广播模式 、 发布订阅模式
                type = ExchangeTypes.DIRECT)
),containerFactory = "customContainerFactory")
@Component
public class testController {

    @RabbitHandler(isDefault = true)
    public void messageReceive(Map message) throws IOException {
//    public void messageReceive(String message) throws IOException {
        System.out.println("data-------------->" + message);

            }

        }




