package com.chunsang.pension.comm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chunsang.pension.comm.dao.BoardDAO;
import com.chunsang.pension.comm.model.Board;
import com.chunsang.pension.comm.service.BoardService;

@Transactional
@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "BoardDAO")
	private BoardDAO boardDAO;

	@Override
	public void insertBoard(Board board) throws Exception {
		boardDAO.insertBoard(board);
	}
	
	@Override
	public void updateBoard(Board board) throws Exception {
		boardDAO.updateBoard(board);
	}
	
	@Override
	public void deleteBoard(Board board) throws Exception {
		boardDAO.deleteBoard(board);
		
	}

	@Override
	public List<Board> selectBoardList(Board board) throws Exception {
		return boardDAO.selectBoardList(board);
	}



	
}
