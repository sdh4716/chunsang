package com.chunsang.pension.comm.vo;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class BoardVO {
	
	private String boardId;
	private int seq;
	private String title;
	private String content;
	private String atchFileId;
	private String regDt;
	private String regId;
	private String imgFileId;
	private String updDt;
	private String updId;

}
