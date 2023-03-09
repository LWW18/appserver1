package com.ruoyi.api.constant;

import lombok.AllArgsConstructor;
import lombok.ToString;

/**
 * 返回编号规则
 *
 * @author Weiwang
 */

@ToString
@AllArgsConstructor
public enum StatusCode {

    /**
     * 统一返回值：
     *   成功：200
     *
     * 资源管理 （2000 ~）
     * - 返回值定义：
     * 1. 网关 2000 - 2030
     *  - 增加网关
     *      - 失败： 原因 ~
     *          - 网关id重复：2001
     *          - 网关id不符合规范：2002
     *          - 网关名称不符合规范：2003
     *          - 该业务类型不存在：2004
     *  - 修改网关（复用增加网关返回值）
     *  - 查看网关信息
     *      - 网关不存在：2011
     *  - 配置网关Lora
     *      - 网关不存在：2011
     *      - 波特率不符合规范：2012
     *      - 同步字长度不符合规范：2012
     *      - 带宽不符合规范：2012
     *      - 前置纠错码不符合规范：2012
     *      - 扩频因子不符合规范：2012
     *      - 信道频率不符合规范：2012
     *      - 发射功率不符合规范：2012
     *  - 升级网关
     *      -
     *  - 删除网关
     *      - 网关不存在：2011
     *  - 重启网关
     *      - 网关不存在：2011
     *      - 网关不在线：2012
     *
     * 2. 节点 2030 - 2060
     *  - 增加节点
     *      - 重复添加 2031
     *      - EUI不符合规范 2032
     *  - 修改节点（同增加节点）
     *      - EUI不存在 2033
     *      - 其它参数错误 2034
     *  - 删除节点
     *      - EUI不存在 2033
     *  - 查询节点信息
     *      - Eui不存在 2033
     *
     * 3. RFID管理 2060 - 2090
     *  - 增加
     *      - 重复添加 2061
     *  - 修改
     *      - RFID设备不存在 2062
     *  - 删除
     *      - RFID设备不存在 2062
     * 4. 集中器 2090 - 2120
     *  - 增加集中器
     *      - LCEUI重复：2091
     *      - LCEUI不符合规范：2092
     *      - 维修人员姓名，维修人员电话，备注错误：2093
     *  - 修改集中器（同增加集中器）
     *  - 删除集中器
     *      - 集中器不存在 2094
     *  - 查看集中器信息
     *      - 集中器不存在 2094
     *  - 配置集中器串口
     *      - 集线器不存在 2094
     *      - 增加串口配置
     *          - 串口重复 2095
     *          - 串口参数错误 2096
     *      - 修改串口配置（同增加串口配置）
     *
     *  业务管理返回值定义：（1000 ~ ）
     *
     *  5.AppServer端相关：3000~3030
     *  5.1 AppManagement
     *      - 增加App
     *          -失败： 原因~
     *             -AppEui重复：3001
     *             -AppEui不符合规范：3002
     *             -App名称重复：3003
     *      -修改App（复用增加App返回值）
     *      -查看App信息
     *          -App不存在：3011
     *
     */
    APP_EUI_REPEAT(2001,"AppEui重复"),
    APP_EUI_WRONGFUL(2002,"AppEui不符合规范"),
    APP_NAME_REPEAT(2003,"App名称重复"),
    APP_UNAUTH(2004,"App未授权"),
    APP_AUTH(2005,"App已授权"),
    APP_UNEXIST(2006,"App不存在"),
    APP_LOGOUT(2007,"App已退网"),

    TERMINAL_UNEXIST(2005,"terminal未注册"),
    TERMINAL_LOGOUT(2006,"terminal已退网"),
    TERMINAL_EXIST(2007,"终端已存在，请恢复"),
    TERMINAL_EUI_REPEAT(2005,"terminalEui已存在"),

    APP_APPTYPE_NONEXIST(2004,"网关业务不存在"),
    APP_NONEXIST(2011,"网关不存在"),
    SUCCESS(200, "成功"), FAIL(500, "失败"),
    GATEWAY_NAME_REPEAT(2001,"网关名称重复"),
    GATEWAY_EUI_WRONGFUL(2002,"网关ID不符合规范"),
    GATEWAY_NAME_WRONGFUL(2003,"网关名称不符合规范"),
    GATEWAY_APPTYPE_NONEXIST(2004,"网关业务不存在"),
    GATEWAY_NONEXIST(2011,"网关不存在"),
    GATEWAY_LORA_SERIAL_PORT_PARAM_REEOR(2012,"LoRa参数有误"),
    GATEWAY_UPDATE_FAIL(2013,"网关升级失败"),
    GATEWAY_NOT_ONLINE(2012,"网关不在线"),
    NODE_EUI_REPEAT(2031,"节点重复"),
    NODE_ID_WRONGFUL(2032,"节点编号不合法"),
    NODE_NONEXIST(2033,"节点不存在"),
    NODE_PARAM_REEOR(2034,"其他参数错误"),
    RFID_EUI_REPEAT(2061,"重复添加"),
    RFID_NONEXIST(2062,"RFID设备不存在"),
    CONCENTRATOR_EUI_REPRAT(2091,"集中器编号重复"),
    CONCENTRATOR_EUI_WRONGFUL(2092,"集中器编号不符合规范"),
    CONCENTRATOR_INFO_ERROR(2093,"其它参数错误"),
    CONCENTRATOR_NONEXIST(2096,"集中器不存在"),
    CONCENTRATOR_PORT_REPEA(2097,"集中器串口重复"),
    CONCENTRATOR_PORT_PARAMERROR(2098,"串口参数错误");

    private int code;
    private String message;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
