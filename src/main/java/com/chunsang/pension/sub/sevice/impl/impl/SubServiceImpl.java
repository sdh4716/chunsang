package com.chunsang.pension.sub.sevice.impl.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chunsang.pension.comm.vo.SearchVO;
import com.chunsang.pension.sub.dao.SubDAO;
import com.chunsang.pension.sub.dto.RoomPriceDTO;
import com.chunsang.pension.sub.sevice.SubService;

@Transactional
@Service("SubService")
public class SubServiceImpl implements SubService {
	
	@Resource(name = "SubDAO")
	private SubDAO subDAO;

	@Override
	public List<RoomPriceDTO> selectRoomPrice(SearchVO search) throws Exception {
		return subDAO.selectRoomPrice(search);
	}

	
}
