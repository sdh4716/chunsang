package com.chunsang.pension.sub.sevice;

import java.util.List;

import com.chunsang.pension.comm.vo.SearchVO;
import com.chunsang.pension.sub.dto.RoomPriceDTO;

public interface SubService {
	
	//객실 가격정보 조회
	List<RoomPriceDTO> selectRoomPrice(SearchVO search) throws Exception;
	
}
