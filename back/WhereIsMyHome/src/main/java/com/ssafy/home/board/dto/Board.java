package com.ssafy.home.board.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Board {
	private int articleNo;
	private String title;
	private String content;
	private String nickname;
	private int views;
	private String registeredDate;
	private String updatedDate;
}
