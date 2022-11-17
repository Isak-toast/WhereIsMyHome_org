package com.ssafy.home.notice.dto;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Notice {
	private int no;
	private String title;
	private String content;
	private String author;
	private	int views;
	private String registerTime;
}
