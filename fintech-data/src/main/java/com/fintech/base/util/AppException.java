/**
 * 应用异常
 */
package com.fintech.base.util;

/**
 * @author zhangxinchao
 * 
 */
@SuppressWarnings({ "serial" })
public class AppException extends Exception {

    public static String MSG_DEAL_0 = "0";

    public static String MSG_DEAL_1 = "1";

    /** 异常类型 0-不处理自定义的异常信息 1-处理自定义的异常信息 */
    private String type;

    public AppException(String type, String msg) {
        super(msg);
        this.type = type;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

}
