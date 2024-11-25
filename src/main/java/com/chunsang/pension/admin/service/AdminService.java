package com.chunsang.pension.admin.service;

import java.util.List;

import com.chunsang.pension.admin.model.VisitDetail;
import com.chunsang.pension.admin.model.Visit;
import com.chunsang.pension.comm.vo.SearchVO;

public interface AdminService {
	
	// 게시글 리스트 조회
	List<Visit> selectUserVisit(SearchVO search) throws Exception;
	
	// 게시글 리스트 조회
	List<VisitDetail> selectUserVisitDetail(SearchVO search) throws Exception;
}
