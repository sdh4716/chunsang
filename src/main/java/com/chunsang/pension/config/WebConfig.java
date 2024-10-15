package com.chunsang.pension.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.chunsang.pension.comm.interceptor.UserAccessInterceptor;



@Configuration
public class WebConfig implements WebMvcConfigurer{

	
	@Autowired
	UserAccessInterceptor userAccessInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(userAccessInterceptor)
				.addPathPatterns("/main");
	}
	
	// Ajax로 데이터를 받아올 때 jsonView를 사용하여 404 에러를 방지
	// responseBody로도 처리 가능
    @Bean
    MappingJackson2JsonView jsonView(){
        return new MappingJackson2JsonView();
    }
	
}
