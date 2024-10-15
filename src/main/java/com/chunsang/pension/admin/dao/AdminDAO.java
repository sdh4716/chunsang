package com.chunsang.pension.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.admin.dto.VisitDTO;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.vo.SearchVO;

import java.sql.SQLException;
import java.util.List;

@Repository("AdminDAO")
public class AdminDAO extends CommonExtendedDAO{

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public List<VisitDTO> selectUserVisit(SearchVO visitDto) throws SQLException{
		return sqlSessionTemplate.selectList("AdminDAO.selectUserVisit", visitDto);
	}
	
}
