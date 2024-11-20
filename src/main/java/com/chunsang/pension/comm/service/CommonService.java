package com.chunsang.pension.comm.service;
import java.util.*;

import com.chunsang.pension.comm.model.RoomPrice;
import com.chunsang.pension.comm.model.UploadFile;
import com.chunsang.pension.comm.vo.SearchVO;

public interface CommonService {
	
	//천상화원 접속로그 저장
	void insertSystemAccessLog(Map<String, Object> map) throws Exception;
	
	int updateRoomPrice(RoomPrice roomPrice) throws Exception;
	
	int saveUploadFileInfo(UploadFile uploadFile) throws Exception;
	
	//객실 가격정보 조회
	List<RoomPrice> selectRoomPrice(SearchVO search) throws Exception;
}
