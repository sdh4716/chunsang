package com.chunsang.pension.comm.dto;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Builder
@Data
public class UserLogDTO {
    private Date accessTime;
    private String accessUrl;
    private String ip;
    private String os;
    private String browser;
    private String userAgent;

}
