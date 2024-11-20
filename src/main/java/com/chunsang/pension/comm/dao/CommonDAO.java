package com.chunsang.pension.comm.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.dto.UserDTO;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.model.RoomPrice;
import com.chunsang.pension.comm.model.UploadFile;
import com.chunsang.pension.comm.vo.SearchVO;
import com.chunsang.pension.comm.vo.UserVO;
import com.chunsang.pension.sub.dto.RoomPriceDTO;

import java.sql.SQLException;
import java.util.*;

@Repository("CommonDAO")
public class CommonDAO extends CommonExtendedDAO{

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public void insertSystemAccessLog(Map<String, Object> map) throws SQLException {
		insert("CommonDAO.insertSystemAccessLog", map);
	}
	
	/* public void selectUserInfo(UserVO) */
	
	public UserDTO selectUser(String queryId, UserDTO userDTO) throws SQLException{
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		return sqlSession.selectOne(queryId, userDTO);

	}
	
	public List<RoomPrice> selectRoomPrice(SearchVO search) throws SQLException{
		return sqlSessionTemplate.selectList("CommonDAO.selectRoomPrice", search);
	}
	
	public int updateRoomPrice(RoomPrice roomPrice) throws SQLException {
		return sqlSessionTemplate.update("CommonDAO.updateRoomPrice", roomPrice);
	}
	
	public int saveUploadFileInfo(UploadFile uploadFile) throws SQLException {
		return sqlSessionTemplate.insert("CommonDAO.saveUploadFileInfo", uploadFile);
	}
	
}
