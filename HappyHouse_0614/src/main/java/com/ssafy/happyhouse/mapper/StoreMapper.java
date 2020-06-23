package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.domain.StoreDto;

@Mapper
public interface StoreMapper {
	public List<StoreDto> selectStore(SearchDto param);
	
	public List<StoreDto> selectStoreByDong(SearchDto param);

	public List<StoreDto> selectStoreByCode(SearchDto param);
	
	public int getTotalCount();
	
	public int getSelectCount(SearchDto param);
}
