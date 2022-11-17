package com.ssafy.home.user.service;

import com.ssafy.home.user.dto.User;

public interface UserService {
	/**
	 * 회원 가입
	 * 
	 * @param user
	 */
	void signUp(User user);

	/**
	 * 로그인
	 * 
	 * @param email
	 * @param password
	 * @return 회원 정보
	 */
	User signIn(String email, String password);

	/**
	 * 회원 정보 조회
	 * 
	 * @param email
	 * @return 회원 정보
	 */
	User getUser(String email);

	/**
	 * 회원 정보 수정
	 * 
	 * @param user
	 */
	void updateUser(User user);

	/**
	 * 회원 탈퇴
	 * 
	 * @param email
	 */
	void deleteUser(String email);

}
