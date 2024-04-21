package com.chunsang.pension.comm.service;
import java.util.*;

import javax.annotation.Resource;

import com.chunsang.pension.comm.dto.BoardDTO;

public interface BoardService {
	
	//접속로그
	int insertBoard(BoardDTO board) throws Exception;
}
