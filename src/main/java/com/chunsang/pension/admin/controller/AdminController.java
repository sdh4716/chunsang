package com.chunsang.pension.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {
	
	@RequestMapping( value = "/admin")
	public ModelAndView mainPage(ModelAndView mav) throws Exception {
		mav.setViewName("admin/admin_main");
		return mav;
	}
	
	@RequestMapping( value = "/admin/image_main")
	public ModelAndView imageMng(ModelAndView mav) throws Exception {
		mav.setViewName("admin/imageMng/image_main");
		return mav;
	}
	
	@RequestMapping( value = "/admin/noticeMng")
	public ModelAndView noticeMng(ModelAndView mav) throws Exception {
		mav.setViewName("admin/boardMng/noticeBoardMng");
		return mav;
	}
	
	@RequestMapping( value = "/admin/boardWrite")
	public ModelAndView boardWrite(ModelAndView mav) throws Exception {
		mav.setViewName("admin/boardMng/boardWrite");
		return mav;
	}
	
	//게시글 상세
	@RequestMapping( value = "/admin/boardDetail")
	public ModelAndView boardDetail(ModelAndView mav) throws Exception {
		mav.setViewName("admin/boardMng/boardDetail");
		return mav;
	}
	
	
}
