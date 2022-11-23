package com.ssafy.home.deal.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.home.deal.dto.Apt;
import com.ssafy.home.deal.dto.AptDetail;
import com.ssafy.home.deal.dto.AptInfo;
import com.ssafy.home.deal.dto.Search;
import com.ssafy.home.deal.mapper.DealMapper;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class DealServiceImpl implements DealService {
	private final DealMapper dealMapper;

	@Override
	@Transactional
	public List<Apt> getLocList(Search search) throws Exception {
		switch (search.getType()) {
		case "sido":
			return dealMapper.getSido();
		case "gugun":
			return dealMapper.getGugun(search.getCode());
		case "dong":
			return dealMapper.getDong(search.getCode());
		}
		return null;
	}

	@Override
	@Transactional
	public List<AptInfo> getAptList(Map<String, String> map) throws Exception {
		return dealMapper.getAptList(map);
	}
	
	@Override
	@Transactional
	public List<AptDetail> getAptDetail(String aptCode) throws Exception {
		return dealMapper.getAptDetail(aptCode);
	}
}
