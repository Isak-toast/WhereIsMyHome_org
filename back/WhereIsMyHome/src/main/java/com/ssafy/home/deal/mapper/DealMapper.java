package com.ssafy.home.deal.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.home.deal.dto.Apt;
import com.ssafy.home.deal.dto.AptInfo;

@Mapper
public interface DealMapper {
	public List<Apt> getSido() throws Exception;

	public List<Apt> getGugun(String sidoCode) throws Exception;

	public List<Apt> getDong(String gugunCode) throws Exception;

	public List<AptInfo> getAptList(Map<String, String> map) throws Exception;
}
