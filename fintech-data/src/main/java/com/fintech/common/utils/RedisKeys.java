package com.fintech.common.utils;

/**
 * Redis所有Keys
 *
 */
public class RedisKeys {

    public static String getSysConfigKey(String key){
        return "fintech-data:sys:config:" + key;
    }

    public static String getShiroSessionKey(String key){
        return "fintech-data:sessionid:" + key;
    }


    public static String getCreditKey(String key){
        return "fintech-data:credit:" + key;
    }

    public static String getAccessTokenKey(String key){
        return "fintech-adata:wx:" + key;
    }

    public static String getUuidKey(String key){
        return "fintech-data:uuid:" + key;
    }
}
