package com.chunsang.pension.admin.dto;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;

@Builder
@Data
public class VisitDetailDTO {

	private int seq;
	private String accessTime;
	private String os;
	private String browser;
	private String userAgent;
	private String isBot;
}
