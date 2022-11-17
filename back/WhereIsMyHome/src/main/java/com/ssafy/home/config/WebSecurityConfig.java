package com.ssafy.home.config;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.web.filter.CorsFilter;

import com.ssafy.home.security.JwtAuthenticationFilter;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

	private final JwtAuthenticationFilter jwtAuthenticationFilter;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// http 시큐리티 빌더
		http.cors() // WebMvcConfig에서 이미 설정했으므로 기본 cors 설정.
				.and()
				.csrf()// csrf는 현재 사용하지 않으므로 disable
						.disable()
				.httpBasic()// token을 사용하므로 basic 인증 disable
						.disable()
				.sessionManagement()  // session 기반이 아님을 선언
						.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
				.and()
				.authorizeRequests() // /와 /user/** 경로는 인증 안해도 됨.
						.antMatchers("/", "/user/**", "/board/**", "/deal/**").permitAll()
				.anyRequest() // /와 /user/**이외의 모든 경로는 인증 해야됨.
						.authenticated();

		// filter 등록.
		// 매 리퀘스트마다 CorsFilter 실행한 후에 jwtAuthenticationFilter 실행한다.
		http.addFilterAfter(jwtAuthenticationFilter, CorsFilter.class);
	}
	
    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/v2/api-docs", "/swagger-resources/**",
            "/swagger-ui.html", "/webjars/**", "/swagger/**", "/sign-api/exception");
    }
	
}