package com.chunsang.pension.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

@Configuration
public class AppConfig {

    // RestTemplate 빈 설정
    @Bean
    public RestTemplate restTemplate() {
        return new RestTemplate();
    }
}