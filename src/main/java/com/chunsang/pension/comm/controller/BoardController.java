package com.chunsang.pension.comm.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.service.BoardService;

@RequestMapping( value = "/comm")
@Controller
public class BoardController {
	
	@Resource(name = "BoardService")
	private BoardService boardService;
	
	@RequestMapping(value = "/insertBoard")
	public ModelAndView insertBoard(ModelMap model, @RequestParam BoardDTO board) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		int isSuccess = boardService.insertBoard(board);
		mav.addObject("isSuccess", isSuccess);
		
		return null;
	}
	
}
