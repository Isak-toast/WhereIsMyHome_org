package com.ssafy.home.notice.service;

import java.util.List;

import com.ssafy.home.notice.dto.Notice;

public interface NoticeService {
	/**
	 * 공지사항 작성
	 * 
	 * @param board
	 */
	void createNotice(Notice notice);

	/**
	 * 공지사항 상세 조회
	 * 
	 * @param boardNo
	 * @return
	 */
	Notice getNotice(int noticeNo);

	/**
	 * 공지사항 목록 조회
	 * 
	 * @return 공지사항 목록
	 */
	List<Notice> getNotices();

	/**
	 * 조회수 증가
	 * 
	 * @param noticeNo
	 */
	void updateViews(int noticeNo);

	/**
	 * 공지사항 수정
	 * 
	 * @param notice
	 */
	void updateArticle(Notice notice);

	/**
	 * 공지사항 삭제
	 * 
	 * @param noticeNo
	 */
	void deleteNotice(int noticeNo);
}
