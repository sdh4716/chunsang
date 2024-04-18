package com.chunsang.pension.comm.dto;

import java.util.ArrayList;
import java.util.Collection;

import lombok.Builder;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Builder
@Data
public class UserDTO { //UserDetails를 implement하면 로그아웃까지 계속 정보를 사용 가능
	
	private String userId;
	private String userNm;
	private String userPw;
	private String userRole;
	
	
	
}
