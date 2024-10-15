package com.chunsang.pension.admin.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chunsang.pension.admin.dao.AdminDAO;
import com.chunsang.pension.admin.dto.VisitDTO;
import com.chunsang.pension.admin.service.AdminService;
import com.chunsang.pension.comm.service.BoardService;
import com.chunsang.pension.comm.vo.SearchVO;

@Transactional
@Service("AdminService")
public class AdminServiceImpl implements AdminService {
	
	@Resource(name = "AdminDAO")
	private AdminDAO adminDAO;

	@Override
	public List<VisitDTO> selectUserVisit(SearchVO visit) throws Exception {
		return adminDAO.selectUserVisit(visit);
	}


	
}
