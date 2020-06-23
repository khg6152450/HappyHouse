package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.domain.StoreDto;
import com.ssafy.happyhouse.mapper.StoreMapper;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreMapper mapper;
	
	@Override
	public List<StoreDto> retrieveStore(SearchDto param) {
		param.setCurrentPage(10 * (param.getCurrentPage()-1));
		return mapper.selectStore(param);
	}

	@Override
	public List<StoreDto> retrieveStoreByDong(SearchDto param) {
		param.setCurrentPage(10 * (param.getCurrentPage()-1));
		return mapper.selectStoreByDong(param);
	}

	@Override
	public List<StoreDto> retrieveStoreByCode(SearchDto param) {
		param.setCurrentPage(10 * (param.getCurrentPage()-1));
		return mapper.selectStoreByCode(param);
	}

	@Override
	public PageNavigation makePageNavigation(int currentPage, int sizePerPage, String sWord, String sType)
			throws Exception {
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 갯수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		int totalCount = 0;
		if(sType.equals("all")) {
			totalCount = mapper.getTotalCount(); // 총 게시글 갯수;
		} else {
			SearchDto param = new SearchDto();
			param.setSearchType(sType);
			param.setSearchWord(sWord);
			totalCount = mapper.getSelectCount(param);
		}
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1) / sizePerPage + 1; // 총 페이지 갯수
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize; // startRange true : 이전X false : 이전O
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount - 1) / naviSize * naviSize < currentPage; // endRange true : 다음X false : 다음O
		pageNavigation.setEndRange(endRange);
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

}
