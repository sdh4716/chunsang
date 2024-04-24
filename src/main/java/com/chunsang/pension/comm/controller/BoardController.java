package com.chunsang.pension.comm.controller;

import java.sql.SQLException;
import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.service.BoardService;import lombok.extern.log4j.Log4j2;

@RequestMapping( value = "/comm")
@Controller
public class BoardController {
	
	@Resource(name = "BoardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/insertBoard", method=RequestMethod.POST)
	public ModelAndView insertBoard(@ModelAttribute BoardDTO boardDTO , BindingResult errors) throws Exception {
		//BindingResult : ajax를 통해 DTO에 값을 할당한 결과를 가져옴. binding 오류는 Exception을 타지 않기 때문에 따로 처리
		
		ModelAndView mav  = new ModelAndView();
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName();
		boardDTO.setRegId(userId);
		
		try {
			boardService.insertBoard(boardDTO);
			mav.addObject("isSuccess", true);
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		 
		mav.setViewName("jsonView");
		return mav;
	}
	
}
