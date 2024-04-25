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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.service.BoardService;
import com.chunsang.pension.comm.vo.BoardVO;


@RequestMapping( value = "/comm")
@Controller
public class BoardController {
	
	@Resource(name = "BoardService")
	private BoardService boardService;
	
	// 게시글 저장
	@RequestMapping(value = "/insertBoard", method=RequestMethod.POST)
	public ModelAndView insertBoard(@ModelAttribute BoardDTO boardDTO , BindingResult errors) throws Exception {
		//BindingResult : ajax를 통해 DTO에 값을 할당한 결과를 가져옴. binding 오류는 Exception을 타지 않기 때문에 따로 처리
		
		ModelAndView mav  = new ModelAndView();
		
		// Spring Security에서 접속유저의 정보를 가져옴 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName();
		boardDTO.setUpdId(userId);
		
		try {
			boardService.insertBoard(boardDTO);
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
	public ModelAndView updateBoard(@ModelAttribute BoardDTO boardDTO , BindingResult errors) throws Exception {
		//BindingResult : ajax를 통해 DTO에 값을 할당한 결과를 가져옴. binding 오류는 Exception을 타지 않기 때문에 따로 처리
		
		ModelAndView mav  = new ModelAndView();
		
		// Spring Security에서 접속유저의 정보를 가져옴 
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String userId = auth.getName();
		boardDTO.setRegId(userId);
		
		try {
			boardService.updateBoard(boardDTO);
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
	public ModelAndView selectBoardList(@ModelAttribute BoardDTO boardDTO , BindingResult errors) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		
		try {
			List<BoardDTO> boardList = boardService.selectBoardList(boardDTO);
			
	        // BoardDTO를 BoardVO에 매핑
	        List<BoardVO> boardVOList = new ArrayList<BoardVO>();
	        
	        for (BoardDTO dto : boardList) {
	        	
	        	// BoardDTO의 필드를 BoardVO로 매핑
	        	BoardVO vo = BoardVO.builder()
	            				.boardId(dto.getBoardId())
	            				.seq(Integer.parseInt(dto.getSeq()))
	            				.title(dto.getTitle())
	            				.content(dto.getContent())
	            				.atchFileId(dto.getAtchFileId())
	            				.regDt(dto.getRegDt())
	            				.regId(dto.getRegId())
	            				.build();
	            
	            boardVOList.add(vo);
	            
	        }
	        
	        mav.addObject("boardList", boardVOList);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
	
}
