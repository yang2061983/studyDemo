package com.fintech.common.config;

import java.util.Properties;

import org.springframework.aop.Advisor;
import org.springframework.aop.aspectj.AspectJExpressionPointcut;
import org.springframework.aop.support.DefaultPointcutAdvisor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.interceptor.TransactionInterceptor;


@Configuration
public class TxAdviceInterceptor {
	private static final String AOP_POINTCUT_EXPRESSION = "execution (* com.fintech..service..*.*(..))";

	@Autowired
    private PlatformTransactionManager transactionManager;
	

	@Bean
    public TransactionInterceptor txAdvice() {
        Properties properties = new Properties();
        properties.setProperty("insert*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("save*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("create*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("delete*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("update*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("modify*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("do*", "PROPAGATION_REQUIRED,-Exception,-RuntimeException");
        properties.setProperty("find*", "PROPAGATION_SUPPORTS,readOnly");
        properties.setProperty("search*", "PROPAGATION_SUPPORTS,readOnly");
        properties.setProperty("get*", "PROPAGATION_SUPPORTS,readOnly");
        properties.setProperty("*", "PROPAGATION_SUPPORTS");
        
        TransactionInterceptor txAdvice = new TransactionInterceptor(transactionManager, properties);
		
        return txAdvice;
    }
	
	
	@Bean
    public Advisor txAdviceAdvisor() {
        AspectJExpressionPointcut pointcut = new AspectJExpressionPointcut();
        pointcut.setExpression(AOP_POINTCUT_EXPRESSION);
        return new DefaultPointcutAdvisor(pointcut, txAdvice());
    }
	
}
