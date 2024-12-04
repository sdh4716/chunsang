package com.chunsang.pension.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.model.Board;

import java.sql.SQLException;
import java.util.List;

@Repository("BoardDAO")
public class BoardDAO extends CommonExtendedDAO{

	/*
	 * @Autowired private SqlSessionFactory sqlSessionFactory;
	 */
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertBoard(Board board) throws SQLException{
		sqlSessionTemplate.insert("BoardDAO.insertBoard", board);
	}
	
	public void updateBoard(Board board) throws SQLException{
		sqlSessionTemplate.update("BoardDAO.updateBoard", board);
	}
	
	public void deleteBoard(Board board) throws SQLException{
		sqlSessionTemplate.delete("BoardDAO.deleteBoard", board);
	}
	
	public List<Board> selectBoardList(Board boardDTO) throws SQLException{
		return sqlSessionTemplate.selectList("BoardDAO.selectBoardList", boardDTO);
	}
	
}
