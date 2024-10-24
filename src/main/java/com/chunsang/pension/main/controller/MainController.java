package com.chunsang.pension.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	/**
	 * 메인 페이지 이동
	 * @param 
	 * @return "/main/login"
	 * @exception Exception
	 */
	
	@RequestMapping( value = "/main")
	public ModelAndView mainPage(ModelAndView mav) throws Exception {
		
		mav.setViewName("/main");
		return mav;
	}
	
	@RequestMapping( value = "/about")
	public ModelAndView aboutPage(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "location");
		mav.addObject("sub_header_title", "오시는 길");
		
		mav.setViewName("/sub/about");
		return mav;
	}

	@RequestMapping( value = "/location")
	public ModelAndView locationPage(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "location");
		mav.addObject("sub_header_title", "오시는 길");
		
		mav.setViewName("/sub/location");
		return mav;
	}
	
	@RequestMapping( value = "/room_sky")
	public ModelAndView roomSky(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/room_sky");
		return mav;
	}
	
	@RequestMapping( value = "/room_cloud")
	public ModelAndView roomCloud(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/room_cloud");
		return mav;
	}
	
	@RequestMapping( value = "/room")
	public ModelAndView room(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/room");
		return mav;
	}
	
	@RequestMapping( value = "/reservation")
	public ModelAndView reservation(ModelAndView mav) throws Exception {
		mav.addObject("sub_header_p", "room info");
		mav.addObject("sub_header_title", "객실소개");
		
		mav.setViewName("/sub/reservation");
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
