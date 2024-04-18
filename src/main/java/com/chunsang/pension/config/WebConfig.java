package com.chunsang.pension.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.chunsang.pension.comm.interceptor.UserAccessInterceptor;



@Configuration
public class WebConfig implements WebMvcConfigurer{

	
	@Autowired
	UserAccessInterceptor userAccessInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(userAccessInterceptor)
				.addPathPatterns("/main.do");
	}
	
}
