package com.ssafy.home.user.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.home.user.dto.User;

@Mapper
public interface UserMapper {
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
	 * 이메일 조회
	 * 
	 * @param email
	 * @return 동일한 이메일이 존재하면 1, 존재하지 않으면 0을 반환한다.
	 */
	int existsByEmail(String email);

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
	 * @param userId
	 */
	void deleteUser(String email);

}
