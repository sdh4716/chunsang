package com.chunsang.pension.sub.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.vo.SearchVO;
import com.chunsang.pension.sub.dto.RoomPriceDTO;

import java.sql.SQLException;
import java.util.List;

@Repository("SubDAO")
public class SubDAO extends CommonExtendedDAO{

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public List<RoomPriceDTO> selectRoomPrice(SearchVO search) throws SQLException{
		return sqlSessionTemplate.selectList("SubDAO.selectRoomPrice", search);
	}
	
}
