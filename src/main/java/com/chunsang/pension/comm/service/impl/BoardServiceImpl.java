package com.chunsang.pension.comm.service.impl;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chunsang.pension.comm.dao.BoardDAO;
import com.chunsang.pension.comm.dao.CommonDAO;
import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.service.BoardService;
import com.chunsang.pension.comm.service.CommonService;
import com.chunsang.pension.comm.vo.BoardVO;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name = "BoardDAO")
	private BoardDAO boardDAO;

	@Override
	public int insertBoard(BoardDTO board) throws Exception {
		
		return boardDAO.insertBoard(board);
		
	}
	
}
