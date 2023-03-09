package com.ruoyi.common.annotation;

import java.lang.annotation.*;

/**
 * 数据权限过滤注解
 * 
 * @author ruoyi
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface TerminalScope
{
    /**
     * App表的别名
     */
    public String appAlias() default "";

    /**
     * 终端表的别名
     */
    public String terminalAlias() default "";

//    /**
//     * 权限字符（用于多个角色匹配符合要求的权限）默认根据权限注解@ss获取，多个权限用逗号分隔开来
//     */
//    public String permission() default "";
}
