package com.chunsang.pension.comm.service.impl;
import java.util.*;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.chunsang.pension.comm.dao.CommonDAO;
import com.chunsang.pension.comm.service.CommonService;

@Service("CommonService")
public class CommonServiceImpl implements CommonService {
	
	@Resource(name = "CommonDAO")
	private CommonDAO commonDAO;
	
	/**
	 * 메뉴 진입이력 정보 저장(내부사용자용)
	 * @param Map<String, Object>.
	 * @return JSONArray.
	 */
	@Transactional
	@Override
	public void insertSystemAccessLog(Map<String, Object> map) throws Exception {
		commonDAO.insertSystemAccessLog(map);
	}
}
