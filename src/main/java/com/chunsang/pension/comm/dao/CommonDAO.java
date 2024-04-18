package com.chunsang.pension.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.dto.UserDTO;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.vo.UserVO;

import java.sql.SQLException;
import java.util.*;

@Repository("CommonDAO")
public class CommonDAO extends CommonExtendedDAO{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public void insertSystemAccessLog(Map<String, Object> map) throws SQLException {
		insert("CommonDAO.insertSystemAccessLog", map);
	}
	
	/* public void selectUserInfo(UserVO) */
	
	public UserDTO selectUser(String queryId, UserDTO userDTO) throws SQLException{
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.selectOne(queryId, userDTO);

	}
	
}
