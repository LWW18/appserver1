package com.ruoyi.api.constant;

import java.math.BigInteger;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.*;

import static com.ruoyi.api.constant.SensorType.*;
import static com.ruoyi.api.constant.SensorType.LEVEL;

/**
 * @Description: 项目所有数据转换的方法
 * @author: Wei wang
 * @create: 2022-10-17-11-44
 */

public class DataConversion {
    /**
     * 二进制转换为十六进制
     */
    public static String bin2hex(String input) {
        int bin2hex = 4;
        StringBuilder sb = new StringBuilder();
        int len = input.length();
        for (int i = 0; i < len / bin2hex; i++) {
            //每4个二进制位转换为1个十六进制位
            String temp = input.substring(i * 4, (i + 1) * 4);
            int tempInt = Integer.parseInt(temp, 2);
            String tempHex = Integer.toHexString(tempInt).toUpperCase();
            sb.append(tempHex);
        }
        return sb.toString();
    }

    /**
     * 转换到规定位数的二进制
     */
    public static String int2Bin(int i, int bitNum) {
        String binaryStr = Integer.toBinaryString(i);
        StringBuilder bin = new StringBuilder(binaryStr);
        while (bin.length() < bitNum) {
            bin.insert(0, "0");
        }
        return String.valueOf(bin);
    }


public static String floatToIeee754(float value){
    String abc = Integer.toHexString(Float.floatToIntBits(value));
    //16进制转10进
    return abc;
}

    /**
     * 将16进制转换为二进制
     *
     * @param hexStr
     * @return
     */
    public static byte[] parseHexStr2Byte(String hexStr) {
        if (hexStr.length() < 1){
            return null;}
        byte[] result = new byte[hexStr.length() / 2];
        for (int i = 0; i < hexStr.length() / 2; i++) {
            int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
            int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2),
                    16);
            result[i] = (byte) (high * 16 + low);
        }
        return result;
    }


    /**
     * 转IEEE754数据格式
     */
//    public static String floatToIeee754(float value) {
//        System.out.println("要转换的内容：" + value);
//        if (value == 0) {
//           return  "00000000000000000000000000000000";
//        }
//        String flag = value > 0 ? "0" : "1";
//        if (value <= 0) {
//            value = -value;
//        }
//        //取小数点前数 fz
//        int fz = (int) Math.floor(value);
//        String fzb = Integer.toBinaryString(fz);
//        String valueStr = String.valueOf(value);
//        String fxStr = "0" + valueStr.substring(valueStr.indexOf("."));
//        float fx = Float.parseFloat(fxStr);
//        //小数部分二进制
//        String fxb = toBin(fx);
//        //指数位
//        String e = Integer.toBinaryString(127 + fzb.length() - 1);
//        String ex = String.format("%08d", Integer.valueOf(e));
//        //尾数位
//        String m = fzb.substring(1) + fxb;
//        StringBuilder result = new StringBuilder(flag + ex + m);
//
//        int bin = 32;
//        while (result.length() < bin) {
//            result.append("0");
//        }
//        if (result.length() > bin) {
//            result = new StringBuilder(result.substring(0, 32));
//        }
//        System.out.println("转换后的内容：" + result);
//        return result.toString();
//    }

    /**
     * 转IEEE754数据格式中转换为二进制数据方法
     */
    public static String toBin(float f) {
        List<Integer> list = new ArrayList<>();
        Set<Float> set = new HashSet<>();
        // 最多8位
        int max = 24;
        int bits = 0;
        do {
            f = calc(f, set, list);
            bits++;
        } while (f != -1 && bits < max);
        StringBuilder result = new StringBuilder();
        for (Integer i : list) {
            result.append(i);
        }
        return result.toString();
    }

    /**
     * 转IEEE754数据格式中转换为二进制数据相关的方法
     */
    private static float calc(float f, Set<Float> set, List<Integer> list) {
        if (f == 0 || set.contains(f)) {
            return -1;
        }
        float t = f * 2;
        if (t >= 1) {
            list.add(1);
            return t - 1;
        } else {
            list.add(0);
            return t;
        }
    }


    /**
     * 二进制小数转换十进制方法
     */
    public static double bin2Dec(String binStr) {
        double decX = 0.0;
        //位数
        for (int i = 0; i < binStr.length(); i++) {
            int exp = binStr.charAt(i) - '0';
            exp = -(i + 1) * exp;
            if (exp != 0) {
                decX += Math.pow(2, exp);
            }
        }
        return decX;
    }


    /**
     * 解析IEEE754
     */
    public static double decodeIeee(String payload, int head) {
        String[] hex = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"};
        String[] binary = {"0000", "0001", "0010", "0011", "0100", "0101", "0110", "0111", "1000", "1001", "1010", "1011", "1100", "1101", "1110", "1111"};
        StringBuilder result = new StringBuilder();
        int byteLength16 = 7;
        int byteLength2 = 15;
        for (int i = 0; i <= byteLength16; i++) {
            char temp = payload.charAt(i + head);
            String temp2 = "" + temp + "";

            for (int j = 0; j <= byteLength2; j++) {
                if (temp2.equalsIgnoreCase(hex[j])) {
                    result.append(binary[j]);
                }
            }
        }
        String A = result.substring(0,8);
        String B = result.substring(8,16);
        String C = result.substring(16,24);
        String D = result.substring(24,32);
        result = new StringBuilder(D + C + B + A);
        int exponent = Integer.parseInt(result.substring(1, 9), 2) - 127;
        String exponent1 = result.substring(9);
        double y = bin2Dec(exponent1);
        double x = (Math.pow(-1, result.charAt(0))) * ((1 + y) * Math.pow(2, exponent));
        String str = String.format("%.2f", x);
        return Double.parseDouble(str);
    }

    /**
     * appType分类sensorType
     */
    public static int sensorTypeClassifier(String appTypes) {
        int x;
        int num2 = 2;
        int num3 = 3;
        int num4 = 4;
        int appType = Integer.parseInt(appTypes);
        if (appType == 0 || appType == 1) {
            x = 0;
        } else if (appType == num2) {
            x = 1;
        } else if (appType == num3 || appType == num4) {
            x = 2;
        } else {
            x = 3;
        }
        return x;
    }

    /**
     * 编写流水号
     */
    public static String flow() {
        // 使用日期格式化工具类将日期格式化成想要的格式   LocalDateTime是1.8新增的   他是线程安全的
        LocalDateTime now = LocalDateTime.now(ZoneId.of("+8"));
        // 格式在这里定义
        String pattern = "yyyyMMdd";
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern(pattern);

        return formatter.format(now);
    }


    /**
     * 翻转length(嵌入式上报、下发的length是反的)
     */
    public static String turnLength(String lengthFront ,String lengthLater){
        return lengthLater + lengthFront;
    }

    /**
     * 生成sn
     */
    public static String generateSn(String terminalEui, int sensorId, int sensorType){
        return terminalEui + String.format("%03d",sensorId) + String.format("%02d",sensorType);
    }

    /**
     * 找到阈值中的当前阈值
     */
    public static String findTh(String thAll){
        int authNum = 3;
        String[] auth = thAll.split(",");
        StringBuilder thnow1 = new StringBuilder();
        for (int j = 0; j < auth.length / authNum; j++) {
            String thnow2 = floatToIeee754(Float.parseFloat(auth[1 + j * 3]));
            thnow1.append(thnow2);
        }
        return thnow1.toString();
    }

    /**
     * 编写入网时的二进制阈值回应
     */
    public static String writeThBack(int sensorType,String th){
        String length = "0004";
        String substring3 = "";
        if (sensorType == TILT) {
            String substring = th.substring(0, 8);
            String substring1 = th.substring(8, 16);
            String substring2 = th.substring(16, 24);
            substring3 = "06" + length + substring +
                    "07" + length + substring1 +
                    "08" + length + substring2;
        } else if (sensorType == VIBRATION) {
            String substring = th.substring(0, 8);
            String substring1 = th.substring(8, 16);
            String substring2 = th.substring(16, 24);
            substring3 = "26" + length + substring +
                    "27" + length + substring1 +
                    "28" + length + substring2;
        } else if (sensorType == ENVIRONMENT) {
            String substring = th.substring(0, 8);
            String substring1 = th.substring(8, 16);
            String substring2 = th.substring(16, 24);
            String substring4 = th.substring(24, 32);
            substring3 = "42" + length + substring +
                    "43" + length + substring1 +
                    "44" + length + substring2 +
                    "45" + length + substring4;

        } else if (sensorType == LEVEL) {
            String substring = th.substring(0, 8);
            String substring1 = th.substring(8, 16);
            substring3 = "54" + length + substring +
                    "55" + length + substring1;
        }
        return substring3;
    }
}
