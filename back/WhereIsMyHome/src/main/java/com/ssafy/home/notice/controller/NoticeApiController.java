package com.ssafy.home.notice.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.home.notice.dto.Notice;
import com.ssafy.home.notice.service.NoticeService;

@RestController
public class NoticeApiController {
	private NoticeService noticeService;

	@Autowired
	public NoticeApiController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	// 공지사항 작성
	@PostMapping("/notice")
	public ResponseEntity<?> write(@RequestBody Notice notice) {
		try {
			noticeService.writeArticle(notice);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return handleException(e);
		}
	}

	// 공지사항 조회
	@GetMapping("/notice")
	public ResponseEntity<?> list() {
		try {
			List<Notice> list = noticeService.getArticles();
			return new ResponseEntity<List<Notice>>(list, HttpStatus.OK);
		} catch (Exception e) {
			return handleException(e);
		}
	}

	// 공지사항 상세 조회
	@GetMapping("/notice/{no}")
	public ResponseEntity<?> detail(@PathVariable String no) {
		try {
			Notice notice = noticeService.getArticle(no);
			noticeService.updateViews(no);
			return new ResponseEntity<Notice>(notice, HttpStatus.OK);
		} catch (Exception e) {
			return handleException(e);
		}
	}

	// 공지사항 수정
	@PutMapping("/notice")
	public ResponseEntity<?> modify(@RequestBody Notice notice) {
		try {
			noticeService.modifyArticle(notice);
			return new ResponseEntity<Notice>(notice, HttpStatus.OK);
		} catch (Exception e) {
			return handleException(e);
		}
	}

	// 공지사항 삭제
	@DeleteMapping("/notice/{no}")
	public ResponseEntity<?> delete(@PathVariable("no") String no) {
		try {
			noticeService.deleteArticle(no);
			return new ResponseEntity<Void>(HttpStatus.OK);
		} catch (Exception e) {
			return handleException(e);
		}
	}

	private ResponseEntity<?> handleException(Exception e) {
		return new ResponseEntity<String>("Error : " + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
