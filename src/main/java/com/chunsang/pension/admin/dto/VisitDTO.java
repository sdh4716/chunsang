package com.chunsang.pension.admin.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class VisitDTO {
	
	private String accessTime;
	private int visitCnt;
}
