package com.ssafy.home.deal.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.home.deal.dto.Apt;
import com.ssafy.home.deal.dto.AptInfo;
import com.ssafy.home.deal.dto.Search;
import com.ssafy.home.deal.service.DealService;
import com.ssafy.home.util.ParameterCheck;

import lombok.RequiredArgsConstructor;

@CrossOrigin
@RequiredArgsConstructor
@RestController
@RequestMapping("/deal")
public class DealController {
	
	private final DealService dealService;

	// 아파트 정보 조회
	@GetMapping()
	public ResponseEntity<?> getAptList(@RequestParam Map<String, String> map) {
		map.put("text", ParameterCheck.nullToBlank(map.get("text")));
		System.out.println(map);
//		System.out.println(map.get("aptText") == null);
		try {
			List<AptInfo> list = dealService.getAptList(map);
			if (list != null) {
				return new ResponseEntity<List<AptInfo>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}

	// 지역 정보 조회
	@GetMapping("/{type}/{code}")
	public ResponseEntity<?> searchArea(@PathVariable String type, @PathVariable String code) {
//		System.out.println("들어와요???????");
//		if(code == null || code.equalsIgnoreCase("null")) {
//			System.out.println("널널하네~~");
//		}
		try {
			Search search = new Search();
			search.setType(type);
			search.setCode(code);
			List<Apt> list = dealService.getLocList(search);
			if (list != null) {
				return new ResponseEntity<List<Apt>>(list, HttpStatus.OK);
			} else {
				return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return exceptionHandling(e);
		}
	}

	public ResponseEntity<String> exceptionHandling(Exception e) {
		return new ResponseEntity<String>("Error :" + e.getMessage(), HttpStatus.INTERNAL_SERVER_ERROR);
	}

}
