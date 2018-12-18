package com.fintech.common.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.client.RestTemplate;


@Configuration
public class RestTemplateConfig {
    private Logger logger = LoggerFactory.getLogger(getClass());

    @Value("${resttemplate.connection.connect-timeout}")
    private Integer connectTimeout;

    @Value("${resttemplate.connection.read-timeout}")
    private Integer readTimeout;

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder restTemplateBuilder) {
        logger.info("开始配置restTemplate");
        RestTemplate restTemplate = restTemplateBuilder.build();

        SimpleClientHttpRequestFactory clientHttpRequestFactory = new SimpleClientHttpRequestFactory();
        if (connectTimeout > 0) {
            clientHttpRequestFactory.setConnectTimeout(connectTimeout);
            logger.info("配置restTemplate-connectTimeout: {}", connectTimeout);
        }
        if (readTimeout > 0) {
            clientHttpRequestFactory.setReadTimeout(readTimeout);
            logger.info("配置restTemplate-readTimeout: {}", readTimeout);
        }

        restTemplate.setRequestFactory(clientHttpRequestFactory);
        logger.info("restTemplate配置成功");
        return restTemplate;
    }
}
