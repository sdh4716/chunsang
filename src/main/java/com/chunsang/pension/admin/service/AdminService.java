package com.chunsang.pension.admin.service;

import java.util.List;

import com.chunsang.pension.admin.dto.VisitDTO;
import com.chunsang.pension.comm.vo.SearchVO;

public interface AdminService {
	
	// 게시글 리스트 조회
	List<VisitDTO> selectUserVisit(SearchVO search) throws Exception;
}
