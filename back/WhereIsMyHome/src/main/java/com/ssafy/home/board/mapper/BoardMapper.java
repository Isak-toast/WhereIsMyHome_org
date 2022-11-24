package com.ssafy.home.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.home.board.dto.Board;

@Mapper
public interface BoardMapper {
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
	 * 게시글 목록 조회
	 * 
	 * @return
	 */
	List<Board> getArticles();

	/**
	 * 번호에 해당하는 게시글이 있는지 조회
	 * 
	 * @param boardNo
	 * @return 해당 게시글이 존재하면 1, 존재하지 않으면 0을 반환한다.
	 */
	int existsByBoardNo(int articleNo);

	/**
	 * 조회수 증가
	 * 
	 * @param boardNo
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
