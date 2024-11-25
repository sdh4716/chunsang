package com.chunsang.pension.admin.model;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class VisitDetail {

	private int seq;
	private String accessTime;
	private String os;
	private String browser;
	private String userAgent;
	private String isBot;
}
