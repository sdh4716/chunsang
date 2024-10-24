package com.chunsang.pension.airbnb.util;

import net.fortuna.ical4j.data.CalendarBuilder;
import net.fortuna.ical4j.model.Calendar;
import net.fortuna.ical4j.model.component.VEvent;
import net.fortuna.ical4j.model.property.DateProperty;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

import com.chunsang.pension.airbnb.vo.ReservationVO;

public class IcalParseHelper {

    // iCalendar 데이터를 파싱하여 예약 정보를 추출하는 메서드
    public static List<ReservationVO> parseICalData(String icalData, String roomName, String userType) throws Exception {
        List<ReservationVO> reservations = new ArrayList<>();

        // iCalendar 데이터를 파싱
        CalendarBuilder builder = new CalendarBuilder();
        Calendar calendar = builder.build(new StringReader(icalData));

        for (Object component : calendar.getComponents()) {
            if (component instanceof VEvent) {
                VEvent event = (VEvent) component;

                // 시작 날짜와 종료 날짜를 추출
                DateProperty start = event.getStartDate();
                DateProperty end = event.getEndDate();

                String summary = event.getSummary().getValue();

                if(userType.equals("user")) {
                	summary = "Airbnb (Not available)";
                }
                
                // 예약 정보 생성 및 추가
                ReservationVO reservation = ReservationVO.builder()
        				.startDate(start.getDate())
        				.endDate(end.getDate())
        				.status(summary)
        				.roomName(roomName)
        				.build();
                
                reservations.add(reservation);
            }
        }
        return reservations;
    }
    
    private String sanitizeIcalData(String icalData) {
        // DESCRIPTION 필드의 \n 개행 문자 제거
        String sanitizedData = icalData.replaceAll("\\\\n", " ");  // \n을 공백으로 변환
        return sanitizedData;
    }
}