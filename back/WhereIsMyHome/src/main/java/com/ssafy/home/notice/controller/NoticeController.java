package com.ssafy.home.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.home.notice.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private NoticeService noticeService;

	public NoticeController(NoticeService noticeService) {
		this.noticeService = noticeService;
	}

	@GetMapping("/list")
	public String list(Model model) {
		try {
			model.addAttribute("articles", noticeService.getArticles());
		} catch (Exception e) {
			model.addAttribute("msg", "글목록 얻기 중 에러발생!!!");
		}
		return "notice/list";
	}

	@GetMapping("/detail")
	public String detail(String no, Model model) {
		try {
			model.addAttribute("article", noticeService.getArticle(no));
			noticeService.updateViews(no);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록 얻기 중 에러발생!!!");
		}
		return "notice/detail";
	}
	
	@GetMapping("/edit")
	public String edit(String no, Model model) {
		try {
			model.addAttribute("article", noticeService.getArticle(no));
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록 얻기 중 에러발생!!!");
		}
		return "notice/edit";
	}

}
