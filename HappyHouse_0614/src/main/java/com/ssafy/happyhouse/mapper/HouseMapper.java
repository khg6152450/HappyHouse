package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.domain.HouseDealDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SearchDto;

@Mapper
public interface HouseMapper {
	public List<HouseDealDto> selectHouse(SearchDto param);
	
	public List<HouseDealDto> selectHouseByDong(SearchDto param);

	public List<HouseDealDto> selectHouseByName(SearchDto param);
	
	public HouseDealDto selectHouseByNo(int no);
	
	public int getTotalCount();
	
	public int getSelectCount(SearchDto param);
	
	public HouseInfoDto selectHouseinfoByNo(int no);
}
