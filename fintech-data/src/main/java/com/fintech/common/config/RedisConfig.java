package com.fintech.common.config;

import java.lang.reflect.Method;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurerSupport;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.cache.RedisCacheManager;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.Jackson2JsonRedisSerializer;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;

import com.alibaba.fastjson.support.spring.FastJsonRedisSerializer;
import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@EnableCaching
public class RedisConfig extends CachingConfigurerSupport {
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Value("${app.code}")
	private String appCode;

	@Value("${spring.redis.sentinel.master}")
	private String masterName;

	@Value("${spring.redis.sentinel.nodes}")
	private String sentinelNodes;

	@Value("${spring.redis.database}")
	private Integer database;

	@Bean
	@Override
	public KeyGenerator keyGenerator() {
		return new KeyGenerator() {
			@Override
			public Object generate(Object target, Method method, Object... params) {
				StringBuilder sb = new StringBuilder();
				sb.append(appCode).append(":biz:");
				sb.append(target.getClass().getName()).append(":");
				sb.append(method.getName()).append(":");
				for (Object obj : params) {
					if (obj != null) {
						sb.append(obj.toString());
					}
				}
				return sb.toString();
			}
		};
	}

	@SuppressWarnings("rawtypes")
	@Bean(name = "rcm")
	public CacheManager cacheManager(RedisTemplate redisTemplate) {
		logger.info("开始配置redisCacheManager");
		RedisCacheManager rcm = new RedisCacheManager(redisTemplate);
		// 设置缓存过期时间C
		// rcm.setDefaultExpiration(60);//秒
		logger.info("redisCacheManager配置成功");
		return rcm;
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Bean(name = "redisTemplate")
	public RedisTemplate<String, Object> redisTemplate(RedisConnectionFactory factory) {
		logger.info("开始配置redisTemplate");
		RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
		redisTemplate.setConnectionFactory(factory);
		RedisSerializer<String> stringSerializer = new StringRedisSerializer();
		redisTemplate.setKeySerializer(stringSerializer);
		Jackson2JsonRedisSerializer jackson2JsonRedisSerializer = new Jackson2JsonRedisSerializer(Object.class);
		ObjectMapper om = new ObjectMapper();
		om.setVisibility(PropertyAccessor.ALL, JsonAutoDetect.Visibility.ANY);
		om.enableDefaultTyping(ObjectMapper.DefaultTyping.NON_FINAL);
		jackson2JsonRedisSerializer.setObjectMapper(om);
		redisTemplate.setValueSerializer(jackson2JsonRedisSerializer);
		redisTemplate.afterPropertiesSet();
		logger.info("redisTemplate配置成功");
		return redisTemplate;
	}

	@Bean(name = "shiroRedisTemplate")
	public RedisTemplate<String, Object> shiroRedisTemplate(RedisConnectionFactory factory) {
		logger.info("开始配置shiroRedisTemplate");
		RedisTemplate<String, Object> redisTemplate = new RedisTemplate<String, Object>();
		redisTemplate.setConnectionFactory(factory);
		logger.info("shiroRedisTemplate配置成功");
		return redisTemplate;
	}
}
