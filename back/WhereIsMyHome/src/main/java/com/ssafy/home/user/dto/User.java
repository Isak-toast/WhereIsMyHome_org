package com.ssafy.home.user.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class User {
	private int userId;

	@Email
	private String email;

	@Size(min = 8, max = 16)
	private String password;

	@NotBlank
	private String name;
	
	@NotBlank
	private String nickname;

	@Pattern(regexp = "01(?:0|1|[6-9])[.-]?(\\d{3}|\\d{4})[.-](\\d{4})$")
	private String tel;
	
	private String role;

	private String token;
}