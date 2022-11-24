package com.ssafy.home.notice.controller;

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

import com.ssafy.home.notice.dto.Notice;
import com.ssafy.home.notice.service.NoticeService;

import lombok.RequiredArgsConstructor;

@CrossOrigin
@RequiredArgsConstructor
@RestController
@RequestMapping("/notice")
public class NoticeController {
	private final NoticeService noticeService;

	@PostMapping
	public ResponseEntity<?> createNotice(@RequestBody Notice notice) {
		noticeService.createNotice(notice);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@GetMapping
	public ResponseEntity<?> getNotices() {
		return new ResponseEntity<List<Notice>>(noticeService.getNotices(), HttpStatus.OK);
	}

	@GetMapping("/{noticeNo}")
	public ResponseEntity<?> getNotice(@PathVariable int noticeNo) {
		return new ResponseEntity<Notice>(noticeService.getNotice(noticeNo), HttpStatus.OK);
	}

	@PutMapping
	public ResponseEntity<?> updateNotice(@RequestBody Notice notice) {
		noticeService.updateArticle(notice);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	@DeleteMapping("/{noticeNo}")
	public ResponseEntity<?> deleteArticle(@PathVariable int noticeNo) {
		noticeService.deleteNotice(noticeNo);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
