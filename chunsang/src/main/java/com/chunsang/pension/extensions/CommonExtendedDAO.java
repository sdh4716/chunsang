package com.chunsang.pension.extensions;

import java.sql.SQLException;
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
		
		/*
		 * try (SqlSessionTemplate sqlSession = new SqlSessionTemplate(Sqls)) {
		 * System.out.println("sqlsession"); sqlSession.insert(queryId, map); return 1;
		 * }catch (Exception e) { return 0; }
		 */
		
		try (SqlSession sqlSession = sqlSessionFactory.openSession()){
			
			sqlSession.insert(queryId, map);
			return 1;
		}catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
	}

	
}
