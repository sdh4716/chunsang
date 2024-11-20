package com.chunsang.pension.comm.model;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class RoomPrice {
	
	private String roomNm;
	private String periodType;
	private String dayType;
	private int price;
}
