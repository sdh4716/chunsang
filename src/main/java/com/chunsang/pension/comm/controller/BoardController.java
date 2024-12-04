package com.chunsang.pension.comm.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.comm.model.Board;
import com.chunsang.pension.comm.service.BoardService;
import com.chunsang.pension.comm.util.PhotoUtil;
import com.chunsang.pension.comm.vo.BoardVO;


@RequestMapping( value = "/comm")
@Controller
public class BoardController {
	
	@Resource(name = "BoardService")
	private BoardService boardService;
	
	private PhotoUtil photoUtil;
	
	// 게시글 저장
	@RequestMapping(value = "/insertBoard", method=RequestMethod.POST)
	public ModelAndView insertBoard(@ModelAttribute Board board , BindingResult errors) throws Exception {
		//BindingResult : ajax를 통해 DTO에 값을 할당한 결과를 가져옴. binding 오류는 Exception을 타지 않기 때문에 따로 처리
		
		ModelAndView mav  = new ModelAndView();
		
		// Spring Security에서 접속유저의 정보를 가져옴 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName();
		board.setRegDt(userId);
		
		try {
			boardService.insertBoard(board);
			mav.addObject("isSuccess",true);
		}catch (SQLException e) {
			e.printStackTrace();
			mav.addObject("isSuccess",false);
		}catch (Exception e) {
			e.printStackTrace();
			mav.addObject("isSuccess",false);
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 게시글 수정
	@RequestMapping(value = "/updateBoard", method=RequestMethod.POST)
	public ModelAndView updateBoard(@ModelAttribute Board board , BindingResult errors) throws Exception {
		//BindingResult : ajax를 통해 DTO에 값을 할당한 결과를 가져옴. binding 오류는 Exception을 타지 않기 때문에 따로 처리
		
		ModelAndView mav  = new ModelAndView();
		
		// Spring Security에서 접속유저의 정보를 가져옴 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName();
		board.setUpdId(userId);
		
		try {
			boardService.updateBoard(board);
			mav.addObject("isSuccess",true);
		}catch (SQLException e) {
			e.printStackTrace();
			mav.addObject("isSuccess",false);
		}catch (Exception e) {
			e.printStackTrace();
			mav.addObject("isSuccess",false);
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	// 게시글 수정
		@RequestMapping(value = "/deleteBoard", method=RequestMethod.POST)
		public ModelAndView deleteBoard(@ModelAttribute Board board , BindingResult errors) throws Exception {
			//BindingResult : ajax를 통해 DTO에 값을 할당한 결과를 가져옴. binding 오류는 Exception을 타지 않기 때문에 따로 처리
			
			ModelAndView mav  = new ModelAndView();
			
			try {
				boardService.deleteBoard(board);
				mav.addObject("isSuccess",true);
			}catch (SQLException e) {
				e.printStackTrace();
				mav.addObject("isSuccess",false);
			}catch (Exception e) {
				e.printStackTrace();
				mav.addObject("isSuccess",false);
			}
			
			mav.setViewName("jsonView");
			return mav;
		}
	
	// 게시글 목록 조회
	@RequestMapping(value = "/selectBoardList", method=RequestMethod.GET)
	public ModelAndView selectBoardList(@ModelAttribute Board board , BindingResult errors) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		
		try {
	        List<Board> boardList = boardService.selectBoardList(board);
	        
	        mav.addObject("boardList", boardList);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
	@PostMapping("/ckImgUpload")
	public ModelAndView upload(MultipartHttpServletRequest request) {
        ModelAndView mav = new ModelAndView("jsonView");

        String uploadPath = photoUtil.ckUpload(request);
        
        mav.addObject("uploaded", true);
        mav.addObject("url", uploadPath);
        return mav;
    }
	
}
