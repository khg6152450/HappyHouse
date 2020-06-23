package com.ssafy.happyhouse.repository;

import java.util.ArrayList;

import com.ssafy.happyhouse.domain.HouseInfoDto;
import com.ssafy.happyhouse.domain.SidoCodeDto;

public interface SelectBoxDAO {

	ArrayList<SidoCodeDto> selectSido() throws Exception;

	ArrayList<SidoCodeDto> selectGugun(String sido) throws Exception;

	ArrayList<HouseInfoDto> selectDong(String gugun) throws Exception;

	ArrayList<HouseInfoDto> selectApt(String dong) throws Exception;

}
