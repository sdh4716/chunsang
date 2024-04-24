package com.chunsang.pension.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;

import java.sql.SQLException;

@Repository("BoardDAO")
public class BoardDAO extends CommonExtendedDAO{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public void insertBoard(BoardDTO boardDTO) throws SQLException{
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		sqlSession.insert("BoardDAO.insertBoard", boardDTO);

	}
	
}
