package com.chunsang.pension.admin.model;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class Visit {

	private String accessTime;
	private int visitCnt;
	
}
