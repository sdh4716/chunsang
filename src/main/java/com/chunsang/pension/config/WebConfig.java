package com.chunsang.pension.config;

import java.net.IDN;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
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
    
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        
    	// 기존 static 폴더
        registry.addResourceHandler("/**")
                .addResourceLocations("classpath:/static/");

        // 외부 디렉토리
        registry.addResourceHandler("/upload/ckEditor/**")
                .addResourceLocations("file:///D:/upload/ckEditor/");
    }
    
	
}
