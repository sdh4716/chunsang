package com.chunsang.pension.comm.model;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class UploadFile {
	
	private String fileId;
	private int fileSeq;
	private String fileNm;
	private String chgFileNm;
	private String filePath;
	private long fileSize;
	private String regId;
}
