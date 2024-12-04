package com.chunsang.pension.comm.service;

import java.util.List;

import com.chunsang.pension.comm.model.Board;

public interface BoardService {
	
	// 게시글 저장
	void insertBoard(Board board) throws Exception;
	
	// 게시글 수정
	void updateBoard(Board board) throws Exception;
	
	// 게시글 삭제
	void deleteBoard(Board board) throws Exception;
	
	// 게시글 리스트 조회
	List<Board> selectBoardList(Board board) throws Exception;
}
