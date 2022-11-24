package com.ssafy.home.notice.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Notice {
	private int noticeNo;
	private String title;
	private String content;
	private String nickname;
	private int views;
	private String registeredDate;
	private String updatedDate;
}
