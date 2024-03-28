package com.chunsang.pension.comm.dao;

import org.springframework.stereotype.Repository;
import com.chunsang.pension.extensions.CommonExtendedDAO;

import java.sql.SQLException;
import java.util.*;


@Repository("CommonDAO")
public class CommonDAO extends CommonExtendedDAO{

	public void insertSystemAccessLog(Map<String, Object> map) throws SQLException {
		System.out.println("DAO");
		insert("CommonDAO.insertSystemAccessLog", map);
	}
	
}
