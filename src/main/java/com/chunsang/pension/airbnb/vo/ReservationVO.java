package com.chunsang.pension.airbnb.vo;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class ReservationVO {
    private Date startDate;
    private Date endDate;
    private String status;
    private String roomName;
}