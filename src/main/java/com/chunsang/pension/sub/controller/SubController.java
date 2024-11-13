package com.chunsang.pension.sub.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.chunsang.pension.admin.dto.VisitDTO;
import com.chunsang.pension.admin.vo.VisitVO;
import com.chunsang.pension.comm.vo.SearchVO;
import com.chunsang.pension.sub.dto.RoomPriceDTO;
import com.chunsang.pension.sub.sevice.SubService;
import com.chunsang.pension.sub.vo.RoomPriceVO;

@Controller
public class SubController {
	
	@Resource(name = "SubService")
	private SubService subService;
	
	//방문자수 통계 조회
	@RequestMapping(value = "/sub/selectRoomPrice", method=RequestMethod.GET)
	public ModelAndView selectRoomPrice(@ModelAttribute SearchVO searchVO , BindingResult errors) throws Exception {
		
		ModelAndView mav  = new ModelAndView();
		
		try {
			
			List<RoomPriceDTO> rommPriceList = subService.selectRoomPrice(searchVO);
	       
			// BoardDTO를 BoardVO에 매핑
	        List<RoomPriceVO> roomPriceList = new ArrayList<RoomPriceVO>();
	        
	        for (RoomPriceDTO dto : rommPriceList) {
	        	// VisitDto의 데이터를 visitVo에 매핑
	        	RoomPriceVO vo = RoomPriceVO.builder()
	            				.roomNm(dto.getRoomNm())
	            				.periodType(dto.getPeriodType())
	            				.dayType(dto.getDayType())
	            				.price(dto.getPrice())
	            				.build();
	            
	        	roomPriceList.add(vo);
	        }
	        
	        mav.addObject("roomPriceList", roomPriceList);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		mav.setViewName("jsonView");
		return mav;
	}
}
