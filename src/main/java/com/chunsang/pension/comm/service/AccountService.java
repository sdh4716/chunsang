package com.chunsang.pension.comm.service;
import java.sql.SQLException;
import java.util.*;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.chunsang.pension.comm.dao.CommonDAO;
import com.chunsang.pension.comm.dto.UserDTO;
import com.chunsang.pension.comm.vo.UserVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AccountService implements UserDetailsService {

	private static final Logger log = LoggerFactory.getLogger(AccountService.class);
	@Resource(name = "CommonDAO")
	private CommonDAO commonDAO;
	
	/*@Autowired
	private final BCryptPasswordEncoder encoder;*/
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		UserDTO userDTO;
		
		try {
			userDTO = UserDTO.builder()
						.userId(username)
						.build();
			userDTO = commonDAO.selectUser("CommonDAO.selectUserInfo", userDTO);

			UserVO user = UserVO.builder()
							.userId(userDTO.getUserId())
							.userNm(userDTO.getUserNm())
							.userPw(userDTO.getUserPw())
							.userRole(userDTO.getUserRole())
							.build();
			
			if(user.getUserId() != null) {
				return new User(user.getUsername(), user.getPassword(), user.getAuthorities());
			}

		} catch (SQLException e) {
			log.error(e.getMessage());
		}
		
		return null;
	}
}
