package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.List;

import com.ssafy.happyhouse.domain.AptScoreDto;
import com.ssafy.happyhouse.domain.CCTVDto;
import com.ssafy.happyhouse.domain.CommentDto;
import com.ssafy.happyhouse.domain.CriminalDto;
import com.ssafy.happyhouse.domain.HouseDealDto;
import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.NaturalDto;
import com.ssafy.happyhouse.domain.PopulationDto;
import com.ssafy.happyhouse.domain.ShopCodeDto;
import com.ssafy.happyhouse.domain.SidoCodeDto;
import com.ssafy.happyhouse.domain.StoreDto;
import com.ssafy.happyhouse.domain.SubwayDto;
import com.ssafy.happyhouse.domain.TourismDto;
import com.ssafy.happyhouse.domain.UnpleasantFacilitiesDto;

public interface SelectBoxService {

	public ArrayList<SidoCodeDto> selectSido();
	public ArrayList<SidoCodeDto> selectGugun(String sido);
	public ArrayList<HouseInfoDto> selectDong(String gugun);
	public ArrayList<HouseInfoDto> selectApt(String dong);
	public ArrayList<CriminalDto> selectCriminal(String dong);
	public List<UnpleasantFacilitiesDto> selectUnpleasantFacilities(String dong);
	public List<CCTVDto> selectCCTV(String dong);
	public List<PopulationDto> selectPopulation(String dong);
	public List<TourismDto> selectTourism(String dong);
	public List<NaturalDto> selectNatural(String gugun);
	public List<HouseDealDto> selectAptDealByName(String aptName);
	public List<SubwayDto> selectSubway(String gugun);
	public ArrayList<ShopCodeDto> selectCode1();
	public List<ShopCodeDto> selectCode2(String codename1);
	public List<ShopCodeDto> selectCode3(String codename2);
	public List<StoreDto> selectStore(String codename3);
	public List<AptScoreDto> selectAptScoreByName(String aptName);
	public void InsertAptScoreByName(CommentDto dto);
	public List<HouseInfoDto> selectAptCompare();

}
