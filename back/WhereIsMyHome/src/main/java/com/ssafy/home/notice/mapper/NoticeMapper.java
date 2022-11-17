package com.ssafy.home.notice.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.home.notice.dto.Notice;

@Mapper
public interface NoticeMapper {
	int writeArticle(Notice notice) throws SQLException;

	List<Notice> getArticles() throws SQLException;

	Notice getArticle(String no) throws SQLException;

	void updateViews(String no) throws SQLException;

	void modifyArticle(Notice notice) throws SQLException;

	void deleteArticle(String no) throws SQLException;
}
