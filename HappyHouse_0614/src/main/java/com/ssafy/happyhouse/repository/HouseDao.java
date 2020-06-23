package com.ssafy.happyhouse.repository;

import java.util.List;

import com.ssafy.happyhouse.domain.HouseDealDto;
import com.ssafy.happyhouse.domain.SearchDto;

public interface HouseDao {
	
	public List<HouseDealDto> selectHouse(SearchDto param);
	
	public HouseDealDto selectHouseByName(String aptName);
	
	public int getTotalCount();
	
	public int getSelectCount(SearchDto param);
}
