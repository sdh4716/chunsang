package com.chunsang.pension.comm.service;

import com.chunsang.pension.comm.dto.BoardDTO;

public interface BoardService {
	
	//접속로그
	void insertBoard(BoardDTO board) throws Exception;
}
