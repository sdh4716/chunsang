package com.chunsang.pension.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.dto.BoardDTO;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;

import java.sql.SQLException;
import java.util.List;

@Repository("BoardDAO")
public class BoardDAO extends CommonExtendedDAO{

	/*
	 * @Autowired private SqlSessionFactory sqlSessionFactory;
	 */
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertBoard(BoardDTO boardDTO) throws SQLException{
		
		/*
		 * SqlSession sqlSession = sqlSessionFactory.openSession(true);
		 * sqlSession.insert("BoardDAO.insertBoard", boardDTO); sqlSession.close();
		 */
		sqlSessionTemplate.insert("BoardDAO.insertBoard", boardDTO);

	}
	
	public void updateBoard(BoardDTO boardDTO) throws SQLException{
		sqlSessionTemplate.update("BoardDAO.updateBoard", boardDTO);
	}
	
	public List<BoardDTO> selectBoardList(BoardDTO boardDTO) throws SQLException{
		return sqlSessionTemplate.selectList("BoardDAO.selectBoardList", boardDTO);
	}
	
}
