package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.domain.StoreDto;
import com.ssafy.happyhouse.util.PageNavigation;
public interface StoreService {
	
	public List<StoreDto> retrieveStore(SearchDto param);

	public List<StoreDto> retrieveStoreByDong(SearchDto param);
	
	public List<StoreDto> retrieveStoreByCode(SearchDto param);
	
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String sWord, String sType) throws Exception;
	
}
