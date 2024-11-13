package com.chunsang.pension.sub.vo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class RoomPriceVO {
	
	private String roomNm;
	private String periodType;
	private int price;
	private String dayType;

}
