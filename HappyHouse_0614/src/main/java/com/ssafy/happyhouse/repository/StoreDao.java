package com.ssafy.happyhouse.repository;

import java.util.List;

import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.domain.StoreDto;

public interface StoreDao {
public List<StoreDto> selectHouse(SearchDto param);
	
	public int getTotalCount();
	
	public int getSelectCount(SearchDto param);
}
