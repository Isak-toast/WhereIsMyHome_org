package com.ssafy.home.deal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.home.deal.service.DealService;

@Controller
@RequestMapping("/deal")
public class DealController {
	private DealService dealService;

	public DealController(DealService dealService) {
		this.dealService = dealService;
	}

	@GetMapping("/aptList")
	public void aptList() {
	}

}
