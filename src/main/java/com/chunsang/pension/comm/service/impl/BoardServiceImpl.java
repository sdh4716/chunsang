package com.chunsang.pension.comm.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chunsang.pension.comm.dao.BoardDAO;
import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.service.BoardService;

@Transactional
@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "BoardDAO")
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(BoardDTO board) throws Exception {
		
		boardDAO.insertBoard(board);
		
	}
	
}
