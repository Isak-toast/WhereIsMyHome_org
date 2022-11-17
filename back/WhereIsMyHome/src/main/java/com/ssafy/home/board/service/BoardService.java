package com.ssafy.home.board.service;

import java.util.List;

import com.ssafy.home.board.dto.Board;

public interface BoardService {
	/**
	 * 게시글 작성
	 * 
	 * @param board
	 */
	void createArticle(Board board);

	/**
	 * 게시글 상세 조회
	 * 
	 * @param boardNo
	 * @return
	 */
	Board getArticle(int articleNo);

	/**
	 * 게시글 조회
	 * 
	 * @return
	 */
	List<Board> getArticles();

	/**
	 * 조회수 증가
	 */
	void updateViews(int articleNo);

	/**
	 * 게시글 수정
	 * 
	 * @param board
	 */
	void updateArticle(Board board);

	/**
	 * 게시글 삭제
	 * 
	 * @param boardNo
	 */
	void deleteArticle(int articleNo);
}
