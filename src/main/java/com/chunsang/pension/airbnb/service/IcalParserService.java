package com.chunsang.pension.airbnb.service;
import net.fortuna.ical4j.data.CalendarBuilder;
import net.fortuna.ical4j.model.Calendar;
import net.fortuna.ical4j.model.component.VEvent;
import net.fortuna.ical4j.model.property.DateProperty;
import org.springframework.stereotype.Service;

import com.chunsang.pension.admin.vo.VisitDetailVO;
import com.chunsang.pension.airbnb.vo.ReservationVO;

import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;

@Service
public class IcalParserService {

    // iCalendar 데이터를 파싱하여 예약 정보를 추출하는 메서드
    public List<ReservationVO> parseICalData(String icalData) throws Exception {
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

                // 예약 정보 생성 및 추가
                ReservationVO reservation = ReservationVO.builder()
						.startDate(start.getDate())
						.endDate(end.getDate())
						.status(summary)
						.build();
                
                reservations.add(reservation);
            }
        }
        
        return reservations;
    }
}