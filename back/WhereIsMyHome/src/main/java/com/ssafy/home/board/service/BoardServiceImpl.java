package com.ssafy.home.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.home.board.dto.Board;
import com.ssafy.home.board.mapper.BoardMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardMapper;

	/**
	 * 게시글 작성
	 * 
	 * @param board
	 */
	@Override
	public void createArticle(Board board) {
		if (board == null) {
			throw new RuntimeException("게시글 등록에 실패했습니다.");
		}
		boardMapper.createArticle(board);
	}

	/**
	 * 게시글 상세 조회
	 * 
	 * @param boardNo
	 * @return board
	 */
	@Override
	public Board getArticle(int articleNo) {
		if (!isExistent(articleNo)) {
			throw new RuntimeException("존재하지 않는 게시물입니다.");
		}
		Board board = boardMapper.getArticle(articleNo);
		boardMapper.updateViews(articleNo);
		return board;
	}

	/**
	 * 게시글 목록 조회
	 * 
	 * @return List<Board>
	 */
	@Override
	public List<Board> getArticles() {
		return boardMapper.getArticles();
	}

	/**
	 * 조회수 증가
	 */
	@Override
	public void updateViews(int articleNo) {
		if (!isExistent(articleNo)) {
			throw new RuntimeException("존재하지 않는 게시물입니다.");
		}
		boardMapper.updateViews(articleNo);
	}

	/**
	 * 게시글 수정
	 * 
	 * @param board
	 */
	@Override
	public void updateArticle(Board board) {
		if (!isExistent(board.getArticleNo())) {
			throw new RuntimeException("존재하지 않는 게시물입니다.");
		}
		boardMapper.updateArticle(board);
	}

	/**
	 * 게시글 삭제
	 * 
	 * @param boardNo
	 */
	@Override
	public void deleteArticle(int articleNo) {
		if (!isExistent(articleNo)) {
			throw new RuntimeException("존재하지 않는 게시물입니다.");
		}
		boardMapper.deleteArticle(articleNo);
	}

	/**
	 * 번호에 해당하는 게시글이 있는지 조회
	 * 
	 * @param boardNo
	 * @return 해당 게시글이 존재하면 1, 존재하지 않으면 0을 반환한다.
	 */
	private boolean isExistent(int articleNo) {
		return boardMapper.existsByBoardNo(articleNo) == 1 ? true : false;
	}

}
