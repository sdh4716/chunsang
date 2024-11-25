package com.chunsang.pension.admin.controller;

import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.admin.service.AdminService;
import com.chunsang.pension.admin.model.Visit;
import com.chunsang.pension.admin.model.VisitDetail;
import com.chunsang.pension.comm.vo.SearchVO;

@Controller
public class AdminController {
	
	@Resource(name = "AdminService")
	private AdminService adminService;
	
	//관리자 페이지 메인
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
	
	//공지사항 관리
	@RequestMapping( value = "/admin/noticeMng")
	public ModelAndView noticeMng(ModelAndView mav) throws Exception {
		mav.setViewName("admin/boardMng/noticeBoardMng");
		return mav;
	}
	
	//객실 요금 관리
	@RequestMapping( value = "/admin/roomPriceMng")
	public ModelAndView roomPriceMng(ModelAndView mav) throws Exception {
		mav.setViewName("admin/roomMng/roomPriceMng");
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
	
	//방문자수 통계 조회
	@RequestMapping(value = "/admin/selectUserVisit", method=RequestMethod.GET)
	public ModelAndView selectBoardList(@ModelAttribute SearchVO searchVO , BindingResult errors) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		
		try {
	        List<Visit> visitList = adminService.selectUserVisit(searchVO);
	        
	        mav.addObject("visitList", visitList);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	//방문자 상세정보 조회
	@RequestMapping(value = "/admin/selectUserVisitDetail", method=RequestMethod.GET)
	public ModelAndView selectUserVisitDetail(@ModelAttribute SearchVO searchVO , BindingResult errors) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		
		try {
			List<VisitDetail> visitDetailList = adminService.selectUserVisitDetail(searchVO);
			
			mav.addObject("visitDetailList", visitDetailList);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}
