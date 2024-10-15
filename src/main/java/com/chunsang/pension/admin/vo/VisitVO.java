package com.chunsang.pension.admin.vo;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class VisitVO {

	private String accessTime;
	private int visitCnt;
	
}
