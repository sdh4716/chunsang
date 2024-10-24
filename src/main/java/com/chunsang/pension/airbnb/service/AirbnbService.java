package com.chunsang.pension.airbnb.service;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service("AirbnbService")
public class AirbnbService {

    private final RestTemplate restTemplate;

    public AirbnbService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    // Airbnb iCalendar 데이터를 가져오는 메서드
    public String getAirbnbCalendarData(String airbnbUrl) {
        return restTemplate.getForObject(airbnbUrl, String.class);
    }
}