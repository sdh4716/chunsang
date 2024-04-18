package com.chunsang.pension.comm.vo;

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
@Getter
public class UserVO implements UserDetails{ //UserDetails를 implement하면 로그아웃까지 계속 정보를 사용 가능
	
	private String userId;
	private String userNm;
	private String userPw;
	private String userRole;
	
	//https://writerroom.tistory.com/211
	private static final String ROLE_PREFIX = "ROLE_";
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		
		String role = this.userRole;
		
		SimpleGrantedAuthority authority = new SimpleGrantedAuthority(ROLE_PREFIX + role);
		Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		authorities.add(authority);
		
		return authorities;
	}
	@Override
	public String getPassword() {
		return this.userPw;
	}
	
	@Override
	public String getUsername() {
		return this.userId;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return false;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}
	@Override
	public boolean isEnabled() {
		return false;
	}
	
	
}
