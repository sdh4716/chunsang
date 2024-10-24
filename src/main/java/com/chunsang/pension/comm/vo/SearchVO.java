package com.chunsang.pension.comm.vo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class SearchVO {

	private String srchStDt;
	private String srchEndDt;
	private String userType;
}
