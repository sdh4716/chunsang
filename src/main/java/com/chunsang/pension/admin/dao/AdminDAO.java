package com.chunsang.pension.admin.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.chunsang.pension.admin.model.Visit;
import com.chunsang.pension.admin.model.VisitDetail;
import com.chunsang.pension.comm.extensions.CommonExtendedDAO;
import com.chunsang.pension.comm.vo.SearchVO;

import java.sql.SQLException;
import java.util.List;

@Repository("AdminDAO")
public class AdminDAO extends CommonExtendedDAO{

	@Autowired
    private SqlSessionTemplate sqlSessionTemplate;
	
	public List<Visit> selectUserVisit(SearchVO search) throws SQLException{
		return sqlSessionTemplate.selectList("AdminDAO.selectUserVisit", search);
	}
	
	public List<VisitDetail> selectUserVisitDetail(SearchVO search) throws SQLException{
		return sqlSessionTemplate.selectList("AdminDAO.selectUserVisitDetail", search);
	}
	
}
