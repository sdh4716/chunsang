package com.chunsang.pension.config;
import javax.annotation.PostConstruct;
import org.springframework.stereotype.Component;

@Component
public class Ical4jConfig {

    @PostConstruct
    public void init() {
        // ical4j 호환성 모드 설정
        System.setProperty("ical4j.unfolding.relaxed", "true");  // 줄바꿈 처리
        System.setProperty("ical4j.parsing.relaxed", "true");    // 구문 파싱 유연하게 처리
    }
}