package com.ssafy.home.deal.service;

import java.util.List;
import java.util.Map;

import com.ssafy.home.deal.dto.Apt;
import com.ssafy.home.deal.dto.AptInfo;
import com.ssafy.home.deal.dto.Search;

public interface DealService {
	List<Apt> getLocList(Search search) throws Exception;

	List<AptInfo> getAptList(Map<String, String> map) throws Exception;
}
