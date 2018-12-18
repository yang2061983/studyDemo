package com.fintech.base.util;

import java.math.BigDecimal;
import java.text.DecimalFormat;

/**
 * 常用的一些方法工具类
 *
 * @author Y
 */
public class CommonMathodUtil {

    /**
     * 元转万元
     * @param bigDecimal  BigDecimal
     * @return BigDecimal
     */
    public static BigDecimal getYuantoWanYuan(BigDecimal bigDecimal){
        BigDecimal decimal = bigDecimal.divide(new BigDecimal("10000"));
        DecimalFormat formatter = new DecimalFormat("0.00");
        String formatNum = formatter.format(decimal);
        return new BigDecimal(formatNum);

    }

    /**
     * 保留两位小数
     * @param bigDecimal BigDecimal
     * @return BigDecimal
     */
    public static BigDecimal keepTwoDecimals(BigDecimal bigDecimal){
        DecimalFormat df =new DecimalFormat("#.00");
        return new BigDecimal(df.format(bigDecimal));
    }

    /**
     * 万元转元
     * @param bigDecimal BigDecimal
     * @return BigDecimal
     */
    public static BigDecimal tenThousanYuandToYuan(BigDecimal bigDecimal){
        return bigDecimal.multiply(new BigDecimal("10000"));
    }


    /**
     * 拼接
     * @param period String
     * @return String
     */
    public static String jointPeriod(String period){
        return period.substring(0, period.indexOf(",")).concat("-").concat(period.substring(period.lastIndexOf(",") +1, period.length()));
    }
}
