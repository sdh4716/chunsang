package com.chunsang.pension.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	//메인화면
	@RequestMapping( value = "/main")
	public ModelAndView mainPage(ModelAndView mav) throws Exception {
		
		mav.setViewName("/main");
		return mav;
	}
	
	//천상화원
	@RequestMapping( value = "/about")
	public ModelAndView aboutPage(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "location");
		mav.addObject("sub_header_title", "오시는 길");
		
		mav.setViewName("/sub/about");
		return mav;
	}

	//오시는 길
	@RequestMapping( value = "/location")
	public ModelAndView locationPage(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "location");
		mav.addObject("sub_header_title", "오시는 길");
		
		mav.setViewName("/sub/location");
		return mav;
	}
	
	//객실안내
	@RequestMapping( value = "/room")
	public ModelAndView room(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/room");
		return mav;
	}
	
	//예약안내
	@RequestMapping( value = "/reservation")
	public ModelAndView reservation(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/reservation");
		return mav;
	}
	
	//공지사항
	@RequestMapping( value = "/notice")
	public ModelAndView notice(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/notice");
		return mav;
	}
	
	//공지사항
	@RequestMapping( value = "/noticeDetail")
	public ModelAndView noticeDetail(ModelAndView mav) throws Exception {
		
		mav.setViewName("/sub/noticeDetail");
		return mav;
	}
	
	@RequestMapping( value = "/travelSpot")
	public ModelAndView travelSpotPage(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "travelspot");
		mav.addObject("sub_header_title", "주변 여행지");
		
		mav.setViewName("/travelSpot/travel_spot");
		return mav;
	}
}
