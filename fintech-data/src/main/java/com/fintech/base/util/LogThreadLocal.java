package com.fintech.base.util;

/**   
 * @ClassName:  LogThreadLocal   
 * @Description:日志记录(这里用一句话描述这个类的作用)   
 * @author: DUANJY
 * @date:   2018年7月21日 下午3:55:03   
 *     
 */
public class LogThreadLocal {
	
	public final static  ThreadLocal<String> reqParam = new ThreadLocal<>();
	public final static ThreadLocal<String> reqMethodName = new ThreadLocal<>();
	public final static ThreadLocal<String> reqUniqueCode = new ThreadLocal<>();
	public final static ThreadLocal<String> reqMethodTime = new ThreadLocal<>();
	public final static ThreadLocal<String> reqUniqueUserFlag = new ThreadLocal<>();
	public final static ThreadLocal<String> logUniqueCode = new ThreadLocal<>();
	
	
	public static void  removeThreadLocal(){
		reqParam.remove();
		reqMethodName.remove();
		reqUniqueCode.remove();
		reqMethodTime.remove();
		reqUniqueUserFlag.remove();
		logUniqueCode.remove();
	}
}
