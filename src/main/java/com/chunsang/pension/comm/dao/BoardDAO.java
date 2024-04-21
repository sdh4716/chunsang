package com.chunsang.pension.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.dto.UserDTO;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.vo.UserVO;

import java.sql.SQLException;
import java.util.*;

@Repository("BoardDAO")
public class BoardDAO extends CommonExtendedDAO{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	
	public int insertBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.insert("insertBoard", boardDTO);

	}
	
}
