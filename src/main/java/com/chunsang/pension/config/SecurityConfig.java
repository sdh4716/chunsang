package com.chunsang.pension.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity)throws Exception{

		httpSecurity
				.csrf().disable()
				.cors().and()
				.authorizeRequests()
				.antMatchers("/admin/**").hasRole("ADMIN") /* admin으로 시작하는 모든 페이지는 ADMIN권한 있어야함 */
				.anyRequest().permitAll()
				//.anyRequest().permitAll() /* antMatchers에서 걸러지지 않은 모든 페이지는 허용 */
				.and()
				.formLogin()
					.usernameParameter("username")
					.passwordParameter("password")
					.defaultSuccessUrl("/admin",true)
					/* .failureUrl(null) */
					;

		return httpSecurity.build();
	}
	
	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}