package com.ssafy.home.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.home.board.dto.Board;
import com.ssafy.home.notice.dto.Notice;
import com.ssafy.home.notice.mapper.NoticeMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class NoticeServiceImpl implements NoticeService {
	private final NoticeMapper noticeMapper;

	@Override
	public void createNotice(Notice notice) {
		if(notice == null) {
			throw new RuntimeException("공지사항 등록에 실패했습니다.");
		}
		noticeMapper.createNotice(notice);
	}

	@Override
	public Notice getNotice(int noticeNo) {
		if (!isExistent(noticeNo)) {
			throw new RuntimeException("존재하지 않는 공지사항입니다.");
		}
		Notice notice = noticeMapper.getNotice(noticeNo);
		noticeMapper.updateViews(noticeNo);
		return notice;
	}

	@Override
	public List<Notice> getNotices() {
		return noticeMapper.getNotices();
	}

	@Override
	public void updateViews(int noticeNo) {
		if(!isExistent(noticeNo)) {
			throw new RuntimeException("존재하지 않는 공지사항입니다.");
		}
		noticeMapper.updateViews(noticeNo);
	}

	@Override
	public void updateArticle(Notice notice) {
		if(!isExistent(notice.getNoticeNo())) {
			throw new RuntimeException("존재하지 않는 공지사항입니다.");
		}
		noticeMapper.updateNotice(notice);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		if(!isExistent(noticeNo)) {
			throw new RuntimeException("존재하지 않는 공지사항입니다.");
		}
		noticeMapper.deleteNotice(noticeNo);
	}
	
	/**
	 * 번호에 해당하는 게시글이 있는지 조회
	 * 
	 * @param boardNo
	 * @return 해당 게시글이 존재하면 1, 존재하지 않으면 0을 반환한다.
	 */
	private boolean isExistent(int noticeNo) {
		return noticeMapper.existsByBoardNo(noticeNo) == 1 ? true : false;
	}

}
