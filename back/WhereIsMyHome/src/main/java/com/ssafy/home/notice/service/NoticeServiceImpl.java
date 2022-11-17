package com.ssafy.home.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.home.notice.dto.Notice;
import com.ssafy.home.notice.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {
	private NoticeMapper noticeMapper;

	@Autowired
	public NoticeServiceImpl(NoticeMapper noticeMapper) {
		this.noticeMapper = noticeMapper;
	}

	@Override
	public int writeArticle(Notice noticeDto) throws Exception {
		return noticeMapper.writeArticle(noticeDto);
	}

	@Override
	public List<Notice> getArticles() throws Exception {
		return noticeMapper.getArticles();
	}

	@Override
	public Notice getArticle(String no) throws Exception {
		return noticeMapper.getArticle(no);
	}

	@Override
	public void updateViews(String no) throws Exception {
		noticeMapper.updateViews(no);
	}

	@Override
	public void deleteArticle(String no) throws Exception {
		noticeMapper.deleteArticle(no);
	}

	@Override
	public void modifyArticle(Notice noticeDto) throws Exception {
		noticeMapper.modifyArticle(noticeDto);
	}
}
