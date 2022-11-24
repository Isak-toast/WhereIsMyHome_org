package com.ssafy.home.board.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.home.board.dto.Board;
import com.ssafy.home.board.service.BoardService;

import lombok.RequiredArgsConstructor;

@CrossOrigin
@RequiredArgsConstructor
@RestController
@RequestMapping("/board")
public class BoardController {

	private final BoardService boardService;

	@PostMapping
	public ResponseEntity<?> createArticle(@RequestBody Board board) {
		boardService.createArticle(board);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@GetMapping
	public ResponseEntity<?> getArticles() {
		return new ResponseEntity<List<Board>>(boardService.getArticles(), HttpStatus.OK);
	}

	@GetMapping("/{articleNo}")
	public ResponseEntity<?> getArticle(@PathVariable int articleNo) {
		return new ResponseEntity<Board>(boardService.getArticle(articleNo), HttpStatus.OK);
	}

	@PutMapping
	public ResponseEntity<?> updateArticle(@RequestBody Board board) {
		boardService.updateArticle(board);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@DeleteMapping("/{articleNo}")
	public ResponseEntity<?> deleteArticle(@PathVariable int articleNo) {
		boardService.deleteArticle(articleNo);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

}
