package com.chunsang.pension.admin.vo;

import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class VisitDetailVO {

	private int seq;
	private String accessTime;
	private String os;
	private String browser;
	private String userAgent;
	private String isBot;
}
