package com.ssafy.home.notice.service;

import java.util.List;

import com.ssafy.home.notice.dto.Notice;

public interface NoticeService {
	int writeArticle(Notice notice) throws Exception;

	List<Notice> getArticles() throws Exception;

	Notice getArticle(String no) throws Exception;

	void updateViews(String no) throws Exception;

	void modifyArticle(Notice notice) throws Exception;

	void deleteArticle(String no) throws Exception;
}
