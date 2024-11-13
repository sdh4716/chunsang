package com.chunsang.pension.sub.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class RoomPriceDTO {
	
	private String roomNm;
	private String periodType;
	private int price;
	private String dayType;
}
