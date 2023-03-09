package com.ruoyi.api.util;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * @Description: 定时任务的卑职方法
 * @author: Weiwang
 * @create: 2022-11-10-10-00
 */

public class TimerUtil {
    //定时方法
//        Runnable runnable = () -> {
//            loraTerminalService.queryOnlineNodeList();
//        };
//        final long time = 5;
//        final int period = 100;
//        timerUtil = new TimerUtil();
//        timerUtil.scheduleAtFixedRate(runnable,time,period);
//        System.out.println("模拟调用数据监控接口已开启！模拟数据变化频率：" + period + "秒");

    private ScheduledExecutorService scheduledExecutorService;
    /**
     * @param runnable 方法
     * @param time 延迟执行时间
     * @param    period 执行周期
     */
    public void scheduleAtFixedRate(Runnable runnable,Long time,int period ){
        scheduledExecutorService = Executors.newSingleThreadScheduledExecutor();
        scheduledExecutorService.scheduleAtFixedRate(runnable, time, period,TimeUnit.SECONDS);
    }

    public void shutdown(){
        if(!scheduledExecutorService.isShutdown()){
            scheduledExecutorService.shutdown();
        }

    }
}
