package com.ssafy.home.user.service;

import org.springframework.stereotype.Service;

import com.ssafy.home.security.TokenProvider;
import com.ssafy.home.user.dto.User;
import com.ssafy.home.user.mapper.UserMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService {

	private final UserMapper userMapper;
	private final TokenProvider tokenProvider;

	/**
	 * 회원 가입
	 * 
	 * @param user
	 */
	@Override
	public void signUp(User user) {
		if (user == null || user.getEmail() == null) {
			throw new RuntimeException("회원 가입에 실패했습니다.");
		}

		String email = user.getEmail();
		if (isExistent(email)) {
			throw new RuntimeException("이미 가입된 이메일입니다.");
		}
		userMapper.signUp(user);
	}

	/**
	 * 로그인
	 * 
	 * @param email
	 * @param password
	 * @return 회원 정보
	 */
	@Override
	public User signIn(String email, String password) {
		User user = userMapper.signIn(email, password);

		if (user == null) {
			throw new RuntimeException("아이디 또는 비밀번호가 일치하지 않습니다.");
		}

		final String token = tokenProvider.create(user);
		user.setToken(token);
		return user;
	}

	/**
	 * 회원 정보 조회
	 * 
	 * @param email
	 * @return 회원 정보
	 */
	@Override
	public User getUser(String email) {
		if (!isExistent(email)) {
			throw new RuntimeException("존재하지 않는 회원입니다.");
		}
		return userMapper.getUser(email);
	}

	/**
	 * 회원 정보 수정
	 * 
	 * @param user
	 */
	@Override
	public void updateUser(User user) {
		if (!isExistent(user.getEmail())) {
			throw new RuntimeException("존재하지 않는 회원입니다.");
		}
		userMapper.updateUser(user);
	}

	/**
	 * 회원 탈퇴
	 * 
	 * @param email
	 */
	@Override
	public void deleteUser(String email) {
		if (!isExistent(email)) {
			throw new RuntimeException("존재하지 않는 회원입니다.");
		}
		userMapper.deleteUser(email);
	}

	/**
	 * 이메일 중복 확인
	 * 
	 * @param email
	 * @return boolean
	 */
	private boolean isExistent(String email) {
		return userMapper.existsByEmail(email) == 1 ? true : false;
	}

}
