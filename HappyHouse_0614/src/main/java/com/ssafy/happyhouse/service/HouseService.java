package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.domain.HouseDealDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.util.PageNavigation;
public interface HouseService {
	
	public List<HouseDealDto> retrieveHouse(SearchDto param);

	public List<HouseDealDto> retrieveHouseByDong(SearchDto param);
	
	public List<HouseDealDto> retrieveHouseByName(SearchDto param);
	
	public HouseDealDto detailHouseByNo(int no);
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String sWord, String sType) throws Exception;
	
	public HouseInfoDto detailHouseinfoByNo(int no);
}
