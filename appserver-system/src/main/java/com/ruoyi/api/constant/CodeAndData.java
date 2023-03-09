package com.ruoyi.api.constant;

/**
 *  * @Description: 上行数据指令码
 * @author liuweiwang
 */
public interface CodeAndData {

    String ERROR_APPID = "00";

    String DATA_UP = "01";

    /**
     *  通知设备数据上报成功
     */
    String DATA_SURE = "02";
    /**
     *  下行控制+数据接收成功
     */

    int WARNING_MSG = 1;
    int NORMAL_MSG = 0;
    /**
     *  有控制信息
     */
    int HAVE_CONTROL_MSG = 1;

    /**
     *  响应结果：成功
     */
    String SUCCESS = "00";
    String DATA_CONTROL = "06";
    String TERMINAL = "01";
    String DATAUP = "02";
    String MANAGEMENTDOWN = "03";
    String RESPONSEUP = "08";
    String PROTOCOLNUM2 = "02";

    String TILT_DATA_X = "00";
    String TILT_DATA_Y = "01";
    String TILT_DATA_TEMP = "02";
    String TILT_DATA_X_WARNING = "03";
    String TILT_DATA_Y_WARNING = "04";
    String TILT_DATA_TEMP_WARNING = "05";
    String TILT_DATA_X_THRESHOLD_STATE = "06";
    String TILT_DATA_Y_THRESHOLD_STATE = "07";
    String TILT_DATA_TEMP_THRESHOLD_STATE = "08";

}
