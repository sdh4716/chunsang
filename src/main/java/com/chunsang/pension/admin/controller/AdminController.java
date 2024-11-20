package com.chunsang.pension.admin.controller;

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

import com.chunsang.pension.admin.dto.VisitDTO;
import com.chunsang.pension.admin.dto.VisitDetailDTO;
import com.chunsang.pension.admin.service.AdminService;
import com.chunsang.pension.admin.vo.VisitDetailVO;
import com.chunsang.pension.admin.vo.VisitVO;
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
			List<VisitDTO> visitDtoList = adminService.selectUserVisit(searchVO);
	        // BoardDTO를 BoardVO에 매핑
	        List<VisitVO> visitVoList = new ArrayList<VisitVO>();
	        
	        for (VisitDTO dto : visitDtoList) {
	        	// VisitDto의 데이터를 visitVo에 매핑
	        	VisitVO vo = VisitVO.builder()
	            				.accessTime(dto.getAccessTime())
	            				.visitCnt(dto.getVisitCnt())
	            				.build();
	            
	        	visitVoList.add(vo);
	        }
	        
	        mav.addObject("visitList", visitVoList);
			
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
			List<VisitDetailDTO> visitDetailDtoList = adminService.selectUserVisitDetail(searchVO);
			// BoardDTO를 BoardVO에 매핑
			List<VisitDetailVO> visitDetailVoList = new ArrayList<VisitDetailVO>();
			
			for (VisitDetailDTO dto : visitDetailDtoList) {
				// VisitDto의 데이터를 visitVo에 매핑
				VisitDetailVO vo = VisitDetailVO.builder()
						.seq(dto.getSeq())
						.accessTime(dto.getAccessTime())
						.os(dto.getOs())
						.browser(dto.getBrowser())
						.isBot(dto.getIsBot())
						.userAgent(dto.getUserAgent())
						.build();
				
				visitDetailVoList.add(vo);
			}
			
			mav.addObject("visitDetailList", visitDetailVoList);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	
}
