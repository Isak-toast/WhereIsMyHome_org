package com.ssafy.home.notice.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.home.board.dto.Board;
import com.ssafy.home.notice.dto.Notice;

@Mapper
public interface NoticeMapper {
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
	 * 번호에 해당하는 게시글이 있는지 조회
	 * 
	 * @param noticeNo
	 * @return 해당 게시글이 존재하면 1, 존재하지 않으면 0을 반환한다.
	 */
	int existsByBoardNo(int noticeNo);

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
	void updateNotice(Notice notice);

	/**
	 * 공지사항 삭제
	 * 
	 * @param noticeNo
	 */
	void deleteNotice(int noticeNo);
}
