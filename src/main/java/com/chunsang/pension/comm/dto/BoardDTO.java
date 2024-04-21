package com.chunsang.pension.comm.dto;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class BoardDTO {
	
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
