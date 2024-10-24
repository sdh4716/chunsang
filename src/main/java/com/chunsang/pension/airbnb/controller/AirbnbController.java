package com.chunsang.pension.airbnb.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.airbnb.service.AirbnbService;
import com.chunsang.pension.airbnb.util.IcalParseHelper;
import com.chunsang.pension.airbnb.vo.ReservationVO;
import com.chunsang.pension.comm.vo.SearchVO;

@Controller
public class AirbnbController {
	
	@Resource(name = "AirbnbService")
	private AirbnbService airbnbService;
	
	//aribnb 캘린더 데이터 조회
	@RequestMapping(value = "/airbnb/getAirbnbCalendarData", method=RequestMethod.POST)
	public ModelAndView getAirbnbCalendarData(@ModelAttribute SearchVO searchVO , BindingResult errors) throws Exception {
		
	    ModelAndView mav = new ModelAndView();

	    // 두 개의 Airbnb URL
	    String airbnbUrlSky = "https://www.airbnb.co.kr/calendar/ical/40686145.ics?s=1dff3cc7e10726171c5b69a09e40172d"; //하늘방
	    String airbnbUrlCloud = "https://www.airbnb.co.kr/calendar/ical/43691665.ics?s=5f4c6706ccb8f8f4a9ee18e5c8918048"; //구름방
	    
	    // 각 URL에서 iCalendar 데이터 가져오기
	    String icalDataSky = airbnbService.getAirbnbCalendarData(airbnbUrlSky);
	    String icalDataCloud = airbnbService.getAirbnbCalendarData(airbnbUrlCloud);
	    

	    // 두 개의 iCalendar 데이터를 파싱
	    List<ReservationVO> reservationSky = IcalParseHelper.parseICalData(icalDataSky, "하늘", searchVO.getUserType());
	    List<ReservationVO> reservationCloud = IcalParseHelper.parseICalData(icalDataCloud, "구름", searchVO.getUserType());
	    
	    // 두 리스트를 합침
	    List<ReservationVO> reservations = new ArrayList<>();
	    reservations.addAll(reservationSky); //하늘
	    reservations.addAll(reservationCloud);
	    
	    // 합쳐진 데이터를 모델에 추가
	    mav.addObject("reservations", reservations);
	    mav.setViewName("jsonView");
	    
	    return mav;
	}
	
	
	
}
