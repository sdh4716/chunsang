package com.chunsang.pension.comm.model;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class Board {
	
	private String boardId;
	private String seq;
	private String title;
	private String content;
	private String regDt;
	private String regId;
	private String thumbnailDir;
	private String updDt;
	private String updId;

}
