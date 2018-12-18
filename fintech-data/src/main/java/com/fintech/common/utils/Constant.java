package com.fintech.common.utils;

/**
 * 常量
 *
 */
public class Constant {
	/** 超级管理员ID */
	public static final int SUPER_ADMIN = 1;
    /** 数据权限过滤 */
	public static final String SQL_FILTER = "sql_filter";


	/**
	 * 菜单类型
	 */
    public enum MenuType {
        /**
         * 目录
         */
    	CATALOG(0),
        /**
         * 菜单
         */
        MENU(1),
        /**
         * 按钮
         */
        BUTTON(2);

        private int value;

        MenuType(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }
    
    /**
     * 定时任务状态
     */
    public enum ScheduleStatus {
        /**
         * 正常
         */
    	NORMAL(0),
        /**
         * 暂停
         */
    	PAUSE(1);

        private int value;

        ScheduleStatus(int value) {
            this.value = value;
        }
        
        public int getValue() {
            return value;
        }
    }

    /**
     * 云服务商
     */
    public enum CloudService {
        /**
         * 七牛云
         */
        QINIU(1),
        /**
         * 阿里云
         */
        ALIYUN(2),
        /**
         * 腾讯云
         */
        QCLOUD(3);

        private int value;

        CloudService(int value) {
            this.value = value;
        }

        public int getValue() {
            return value;
        }
    }

    /** category栏目在oss的目录 **/
    public static final String CATEGORY = "category";
    /** category_app **/
    public static final String CATEGORY_APP = "category_app";
    /** category_web **/
    public static final String CATEGORY_WEB = "category_web";
    /** app端静态页面 **/
    public static final String APP_HTML = "app_1.html";
    /** web端静态页面 **/
    public static final String WEB_HTML = "web_1.html";

    /** article栏目在oss的目录 **/
    public static final String ARTICLE = "article";
    /** article_app **/
    public static final String ARTICLE_APP = "article_app";
    /** article_web **/
    public static final String ARTICLE_WEB = "article_web";

}
