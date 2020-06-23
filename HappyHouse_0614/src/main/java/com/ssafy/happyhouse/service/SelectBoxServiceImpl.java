package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
import com.ssafy.happyhouse.mapper.SelectBoxMapper;

@Service
public class SelectBoxServiceImpl implements SelectBoxService {

	@Autowired
	private SelectBoxMapper mapper;

	@Override
	public ArrayList<SidoCodeDto> selectSido() {
		return mapper.selectSido();
	}

	@Override
	public ArrayList<SidoCodeDto> selectGugun(String sido) {
		return mapper.selectGugun(sido);
	}

	@Override
	public ArrayList<HouseInfoDto> selectDong(String gugun) {
		return mapper.selectDong(gugun);
	}

	@Override
	public ArrayList<HouseInfoDto> selectApt(String dong) {
		return mapper.selectApt(dong);
	}

	@Override
	public ArrayList<CriminalDto> selectCriminal(String dong) {
		return mapper.selectCriminal(dong);
	}

	@Override
	public List<UnpleasantFacilitiesDto> selectUnpleasantFacilities(String dong) {
		return mapper.selectUnpleasantFacilities(dong);
	}

	@Override
	public List<CCTVDto> selectCCTV(String dong) {
		return mapper.selectCCTV(dong);
	}

	@Override
	public List<PopulationDto> selectPopulation(String dong) {
		return mapper.selectPopulation(dong);
	}

	@Override
	public List<TourismDto> selectTourism(String dong) {
		return mapper.selectTourism(dong);
	}

	@Override
	public List<NaturalDto> selectNatural(String gugun) {
		return mapper.selectNatural(gugun);
	}

	@Override
	public List<HouseDealDto> selectAptDealByName(String aptName) {
		return mapper.selectAptDealByName(aptName);
	}

	@Override
	public List<SubwayDto> selectSubway(String gugun) {
		return mapper.selectSubway(gugun);
	}

	@Override
	public ArrayList<ShopCodeDto> selectCode1() {
		return mapper.selectCode1();
	}

	@Override
	public ArrayList<ShopCodeDto> selectCode2(String codename1) {
		return mapper.selectCode2(codename1);
	}

	@Override
	public ArrayList<ShopCodeDto> selectCode3(String codename2) {
		return mapper.selectCode3(codename2);
	}

	@Override
	public ArrayList<StoreDto> selectStore(String codename3) {
		return mapper.selectStore(codename3);
	}

	@Override
	public List<AptScoreDto> selectAptScoreByName(String aptName) {
		return mapper.selectAptScoreByName(aptName);
	}

	@Override
	public void InsertAptScoreByName(CommentDto dto) {
		mapper.InsertAptScoreByName(dto);		
	}

	@Override
	public List<HouseInfoDto> selectAptCompare() {
		return mapper.selectAptCompare();
	}
	


}
