package com.fintech.base.util;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Date;
import java.util.Random;

/**
 * <p>Title: 安邦 Foundation Class</p>
 * <p>Description: 用户自定义数学计算类</p>
 * <p>Copyright: Copyright (c) 2002</p>
 * @@author ab034144
 * @@version 1.0
 */
public class APPMath {

 /**
   * 指定小数位数的四舍五入
   * @@param value
   * @@param digit
   * @@return
   * @@roseuid 3D535F52035E
   */
  public static double round(double value, int digit) {
    double n = Math.pow(10,digit);
    return Math.round(value*n)/n;
  }

  /**
   * 二位小数位数的四舍五入
   * @@param value
   * @@return
   * @@roseuid 3D535F530049
   */
  public static double round2(double value) {
    return APPMath.round(value,2);
  }

  public static BigDecimal toBigDecimal(Integer integer){
    if(integer==null){
    	return null;
    }
    return BigDecimal.valueOf(integer.intValue());
  }

  public static BigDecimal toBigDecimal(Long l){
    BigDecimal value = null;
    if(l!=null){
      value = new BigDecimal(l.doubleValue());
    }
    return value;
  }

  public static BigDecimal toBigDecimal(Double d){
    if(d==null){
    	return null;
    }
    return new BigDecimal(d.doubleValue());
  }

  public static BigDecimal toBigDecimal(String value){
    if(value==null || "".equals(value.trim())){
    	return null;
    }
    return new BigDecimal(value);
  }

  public static Long toLong(BigDecimal bd){
    Long value = null;
    if(bd!=null){
      value = new Long(bd.longValue());
    }
    return value;
  }

  public static Integer toInteger(BigDecimal bd){
    if(bd==null){
    	return null;
    }
    return new Integer(bd.intValue());
  }

  public static Double toDouble(BigDecimal bd){
    if(bd==null){
    	return null;
    }
    return new Double(bd.doubleValue());
  }
  public static Timestamp toTimestamp(Date date){
    if(date==null){
    	return null;
    }
    return new Timestamp(date.getTime());
  }

  public static Double toDoubleObj(String str) throws Exception {
    if(str==null || str.trim().equals("")){
    	return null;
    }
    return Double.valueOf(str);
  }

  public static double toDouble(String str) throws Exception {
    if(str==null || str.trim().equals("")){
    	return 0.0;
    }
    return Double.parseDouble(str);
  }

  public static Integer toIntObj(String str) throws Exception {
    if(str==null || str.trim().equals("")){
    	return null;
    }
    return Integer.valueOf(str);
  }

  public static int toInt(String str) throws Exception {
    if(str==null || str.trim().equals("")){
    	return 0;
    }
    return Integer.parseInt(str);
  }

  public static Long toLongObj(String str) throws Exception {
    if(str==null || str.trim().equals("")){
    	return null;
    }
    return Long.valueOf(str);
  }

  public static long toLong(String str) throws Exception {
    if(str==null || str.trim().equals("")){
    	return 0L;
    }
    return Long.parseLong(str);
  }

  public static String toStrByFormat(double d, String pattern) throws Exception {
    String result = "";
    java.text.DecimalFormat f = new java.text.DecimalFormat(pattern);
    result = f.format(d);

    return result;
  }

  public static String toStrByFormatEx(double d) throws Exception {
	    String result = "";
	    java.text.DecimalFormat f = new java.text.DecimalFormat("############.########");
	    result = f.format(d);

	    return result;
	  }
  
  public static String toStrByFormat(double d) throws Exception {
    String result = "";
    java.text.DecimalFormat f = new java.text.DecimalFormat("############.####");
    result = f.format(d);

    return result;
  }

  public static String toStrByFormat(Double d) throws Exception {
    if (d==null){
    	return "";
    }
    return toStrByFormat(d.doubleValue());
  }
  public static String toStrByFormat(BigDecimal d) throws Exception {
	    if (d==null){
	    	return "";
	    }
	    return toStrByFormat(d.doubleValue());
  }
  
  /**
	 * 随机生成num位随机验证码
	 * @return
	 */
  public static String createRandom(int num){
      //验证码
      String vcode ="" ;
      Random r = new Random();
      for (int i = 0; i < num; i++) {
         // vcode = vcode + (int)(Math.random()*9);
      	 vcode = vcode + (int)(r.nextInt(10));
      }
      return vcode;
  }
  
  /**
   * 
  	* @title: getMaxFindValue
  	* @author
  	* @description:获取数组中小于指定值的最大值
  	* @date 2016年7月8日 下午12:03:05
  	* @param list
  	* @param FindValue
  	* @return
  	* @throws
   */
  public static int getMaxFindValue(String[] arr, int curValue ,int defValue){
      if(arr==null||arr.length<1){
          return defValue;
      }
      try {
          int maxFindValue = 0;
          int maxVaule = toInt(arr[0]);
          for(int i=0;i<arr.length;i++){
              if(toInt(arr[i])>maxVaule){
                  maxVaule = toInt(arr[i]);
              }
              if(toInt(arr[i])<curValue){
                  if(toInt(arr[i])>maxFindValue){
                      maxFindValue = toInt(arr[i]);
                  }
              }
          }
          if(maxFindValue==0){
              maxFindValue = maxVaule ;
          }
          return maxFindValue;
      }catch(Exception e){
          return defValue;
      }
  }
  
  public static void main(String[]args) throws Exception{
      String currDay = DateTimeUtil.getDayDateNormalString(new Date());
      String arrs = "2,13,9,16,19,25,28,30"; 
      String[] arr = arrs.split(",");
      int m = getMaxFindValue(arr,toInt(currDay),16);
      System.out.println(m);
  }
  
}