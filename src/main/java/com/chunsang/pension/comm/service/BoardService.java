package com.chunsang.pension.comm.service;

import java.util.List;

import com.chunsang.pension.comm.dto.BoardDTO;

public interface BoardService {
	
	// 게시글 저장
	void insertBoard(BoardDTO board) throws Exception;
	
	// 게시글 수정
	void updateBoard(BoardDTO board) throws Exception;
	
	// 게시글 리스트 조회
	List<BoardDTO> selectBoardList(BoardDTO board) throws Exception;
}
