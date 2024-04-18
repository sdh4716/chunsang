package com.chunsang.pension.comm.extensions;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;

public class CommonExtendedDAO {
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	public int insert(String queryId, Map<String, Object> map) throws SQLException{
		
		try (SqlSession sqlSession = sqlSessionFactory.openSession(true)){
			sqlSession.insert(queryId, map);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}
	
	/*
	 * public Object selectByVO(String queryId, Object param) throws SQLException{
	 * SqlSession sqlS ession = sqlSessionFactory.openSession(true);
	 * 
	 * return Object returnVO = sqlSession.selectOne(queryId, param); }
	 */
	
	

	
}
