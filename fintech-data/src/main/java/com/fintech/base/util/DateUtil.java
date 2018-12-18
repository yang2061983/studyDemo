
/**
 * Copyright (C) 2006-2014 版权所有者为北京捷越联合信息咨询有限公司。本系统是商用软件,未经授权擅自复制或传播本程序的部分或全部将是非法的。 
 * @title: DateUtil.java
 * @package com.jy.demo.web.utils
 * @author liangjl
 * @date 2014年8月28日 下午3:28:20
 * @version v1.00
 * @description: TODO(用一句话描述该文件做什么)
 */

package com.fintech.base.util;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @classname: DateUtil
 * @description: TODO(这里用一句话描述这个类的作用)
 */

public class DateUtil {

	private static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	private static SimpleDateFormat dateForm = new SimpleDateFormat("yyyyMMdd");
	private static SimpleDateFormat dateMat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMddHHmmssSSS");

	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh-mm-ss");

	private static String FORMAT_1 = "yyyy-MM-dd HH:mm:ss";
	private static String FORMAT_2 = "yyyy-MM-dd";

	private static SimpleDateFormat sdf_1 = new SimpleDateFormat(FORMAT_1);

	/***
	 * 把字符串格式的日期转换为date型
	 * 
	 * @param dateString
	 * @return
	 */
	public static synchronized Date getDateFromString(String dateString) {
		try {
			if (dateString.length() == 8) {
				return dateForm.parse(dateString);
			} else if (dateString.length() == 10) {
				return dateFormat.parse(dateString);
			} else if (dateString.length() == 19) {
				return sdf.parse(dateString);
			}
		} catch (Exception e) {
			System.err.println(e.getMessage() + "日期转换异常！");
		}
		return null;
	}

	/***
	 * 把Date转化成String类型的日期格式
	 * 
	 * @param date
	 * @return
	 */
	public static synchronized String getStringDateFromDate(Date date) {
		return dateFormat.format(date);
	}

	/***
	 * 把Date转化成String类型的日期格式
	 * 
	 * @param date
	 * @param pattern (返回的时间格式)
	 * @return
	 */
	public static synchronized String getStringDateFromDate(Date date, String pattern) {
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		return sdf.format(date);
	}

	/***
	 * 把Date转化成String类型的日期格式 yyyyMMdd
	 * 
	 * @param date
	 * @return
	 */
	public static synchronized String getDateToString(Date date) {
		return dateForm.format(date);
	}

	/***
	 * 把Date转化成String类型的日期格式 yyyyMMddhhmmssSSS
	 * 
	 * @param date
	 * @return
	 */
	public static synchronized String getDateToStringSS(Date date) {
		return sdFormat.format(date);
	}

	/***
	 * 把Date转化成String类型的日期格式 yyyy-MM-dd-hh-mm-ss
	 * 
	 * @param date
	 * @return
	 */
	public static synchronized String getDateToStringLog(Date date) {
		return sdf.format(date);
	}

	public static synchronized String getDateToStringLog_1(Date date) {
		return sdf_1.format(date);
	}

	public static synchronized String getDateToStringInfo(Date date) {
		return dateMat.format(date);
	}

	/**
	 * 当前时间前一个月
	 * 
	 * @return
	 */
	public static synchronized String getPreDate() {
		Calendar calendar = Calendar.getInstance();
		calendar.add(Calendar.MONTH, -1);
		return dateFormat.format(calendar.getTime());
	}

	/**
	 * 获取当前日期时间的开始
	 * 
	 * @return 返回时间类型 yyyy-MM-dd HH:mm:ss
	 */
	public static Date getNowBeginDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat(FORMAT_2);
		String dateString = formatter.format(currentTime);
		dateString += "00:00:00";
		ParsePosition pos = new ParsePosition(8);
		Date currentTime_2 = formatter.parse(dateString, pos);
		return currentTime_2;
	}

	/**
	 * 获取当前日期时间的结束
	 * 
	 * @return 返回时间类型 yyyy-MM-dd HH:mm:ss
	 */
	public static Date getNowEndDate() {
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat(FORMAT_2);
		String dateString = formatter.format(currentTime);
		dateString += "23:59:59";
		ParsePosition pos = new ParsePosition(8);
		Date currentTime_2 = formatter.parse(dateString, pos);
		return currentTime_2;
	}

	/***
	 * 当前时间到天
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static synchronized Date getPreDay(Date date) throws ParseException {
		return dateForm.parse(dateForm.format(date));
	}

	/***
	 * 当前时间到天
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static synchronized Date getPreDay_1(Date date) throws ParseException {
		return dateFormat.parse(dateFormat.format(date));
	}

	/**
	 * 两个日期相差天数
	 * 
	 * @param bigTime
	 * @param smallTime
	 * @return
	 */
	public static long daysOfTwo(String bigTime, String smallTime) {
		long quot = 0;
		try {
			Date date1 = dateFormat.parse(bigTime);
			Date date2 = dateFormat.parse(smallTime);
			if (date1.after(date2)) {
				quot = date1.getTime() - date2.getTime();
			} else {
				quot = date2.getTime() - date1.getTime();
			}
			quot = quot / 1000 / 60 / 60 / 24;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return quot;
	}

	/**
	 * 根据某人的出生年月日，计算年龄
	 * 
	 * @param birthDay
	 * @return
	 * @throws Exception
	 */
	public static int getAge(Date birthDay) throws Exception {
		Calendar cal = Calendar.getInstance();

		if (cal.before(birthDay)) {
			throw new IllegalArgumentException("The birthDay is before Now.It's unbelievable!");
		}

		int yearNow = cal.get(Calendar.YEAR);
		int monthNow = cal.get(Calendar.MONTH) + 1;
		int dayOfMonthNow = cal.get(Calendar.DAY_OF_MONTH);

		cal.setTime(birthDay);
		int yearBirth = cal.get(Calendar.YEAR);
		int monthBirth = cal.get(Calendar.MONTH);
		int dayOfMonthBirth = cal.get(Calendar.DAY_OF_MONTH);

		int age = yearNow - yearBirth;

		if (monthNow <= monthBirth) {
			if (monthNow == monthBirth) {
				// monthNow==monthBirth
				if (dayOfMonthNow < dayOfMonthBirth) {
					age--;
				}
			} else {
				// monthNow>monthBirth
				age--;
			}
		}

		return age;
	}

	/***
	 * 当前时间的年和月份
	 * 
	 * @param date
	 * @return
	 * @throws ParseException
	 */
	public static synchronized String getCurrMonth() throws ParseException {
		String currDate = getStringDateFromDate(new Date());
		return currDate.substring(0, 8);
	}

	/***
	 * 计算两个日期相差的小时数
	 * 
	 * @param startTime
	 * @param endTime
	 * @param str
	 * @return
	 */
	public static Long dateDiff(String startTime, String endTime, String str) {
		// 按照传入的格式生成一个simpledateformate对象
		SimpleDateFormat sd = new SimpleDateFormat(FORMAT_1);
		long nd = 1000 * 24 * 60 * 60;// 一天的毫秒数
		long nh = 1000 * 60 * 60;// 一小时的毫秒数
		long nm = 1000 * 60;// 一分钟的毫秒数
		long ns = 1000;// 一秒钟的毫秒数
		long diff;
		long day = 0;
		long hour = 0;
		long min = 0;
		long sec = 0;
		// 获得两个时间的毫秒时间差异
		try {
			diff = sd.parse(endTime).getTime() - sd.parse(startTime).getTime();
			day = diff / nd;// 计算差多少天
			hour = diff % nd / nh + day * 24;// 计算差多少小时
			min = diff % nd % nh / nm + day * 24 * 60;// 计算差多少分钟
			sec = diff % nd % nh % nm / ns;// 计算差多少秒
			// 输出结果
			if (str.equalsIgnoreCase("h")) {
				return hour;
			} else {
				return min;
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return day;
	}

	/**
	 * 根据数字获取某日日期
	 * 
	 * @return
	 */
	public static String getCertainDate(String num) {
		int nums = Integer.valueOf(num);
		Date dNow = new Date(); // 当前时间
		Date dBefore = new Date();
		Calendar calendar = Calendar.getInstance(); // 得到日历
		calendar.setTime(dNow);// 把当前时间赋给日历
		calendar.add(Calendar.DAY_OF_MONTH, nums); // 设置为某一天
		dBefore = calendar.getTime(); // 得到某一天的时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 设置时间格式
		String certainDate = sdf.format(dBefore); // 格式化某一天
		return certainDate;
	}

	/**
	 * 获取某一时间的前或者后时间
	 * 
	 * @param minute
	 * @return
	 */
	public static String getTimeByMinute(Date dNows, int minute) {
		if (dNows == null) {
			dNows = new Date(); // 当前时间
		}
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(dNows);// 把当前时间赋给日历
		calendar.add(Calendar.MINUTE, minute);
		return new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(calendar.getTime());

	}

	/**
	 * 计算两个日期相差多少秒,后一个参数为较靠后的日期，如果放反则返回0
	 */
	public static int secondsBetween(Date date1, Date date2) {

		Calendar cal = Calendar.getInstance();
		long time1 = 0;
		long time2 = 0;
		if (date1 != null && !"".equals(date1)) {
			cal.setTime(date1);
			time1 = cal.getTimeInMillis();
		}

		if (date2 != null && !"".equals(date2)) {
			cal.setTime(date2);
			time2 = cal.getTimeInMillis();
		}
		if (time2 <= time1) {
			return 0;
		}
		long between_mins = (time2 - time1) / (1000);
		return Integer.parseInt(String.valueOf(between_mins));
	}
	
	/**
	 * 获取当前时间零点日期
	 * @return
	 */
	public static Date getCurrentZero(Date date){
		Calendar c = Calendar.getInstance(); 
		c.setTime(date);
		c.add(c.DATE,1);
		c.set(Calendar.HOUR_OF_DAY, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		return c.getTime();
	}


}
