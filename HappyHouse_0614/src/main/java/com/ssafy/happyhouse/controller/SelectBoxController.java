package com.ssafy.happyhouse.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssafy.happyhouse.domain.AptScoreDto;
import com.ssafy.happyhouse.domain.CCTVDto;
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
import com.ssafy.happyhouse.service.SelectBoxService;

@Controller
public class SelectBoxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private SelectBoxService service;
	
	@RequestMapping("/SelectBoxController")
	protected void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		String command = request.getParameter("command");
		if(command.equals("sido")) {
			PrintWriter out = response.getWriter();
			ArrayList<SidoCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectSido();
				for(SidoCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("sido_code", dto.getSido_code());
					obj.put("sido_name", dto.getSido_name());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//sido
		else if(command.equals("gugun")) {
			String sido = request.getParameter("sido");
			PrintWriter out = response.getWriter();
			List<SidoCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectGugun(sido);
				for(SidoCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("gugun_code", dto.getGugun_code());
					obj.put("gugun_name", dto.getGugun_name());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//gugun
		else if(command.equals("dong")) {
			String gugun = request.getParameter("gugun");
			PrintWriter out = response.getWriter();
			List<HouseInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectDong(gugun);
				for(HouseInfoDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code", dto.getCode());
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//dong
		else if(command.equals("apt")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<HouseInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectApt(dong);
				for(HouseInfoDto dto : list) {
					System.out.println(dto.getAptName());
					System.out.println(dto.getBuildYear());
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("dong", dto.getDong());
					obj.put("AptName", dto.getAptName());
					obj.put("buildYear", dto.getBuildYear());
					obj.put("jibun", dto.getJibun());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//apt
		else if(command.equals("isafe")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<CriminalDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCriminal(dong);
				for(CriminalDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("name", dto.getName());
					obj.put("address", dto.getAddress());
					obj.put("dong", dto.getDong());
					obj.put("criminal_record", dto.getCriminalRecord());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//isafe		
		else if(command.equals("unpleasant")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<UnpleasantFacilitiesDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectUnpleasantFacilities(dong);
				for(UnpleasantFacilitiesDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("name", dto.getName());
					obj.put("address", dto.getAddress());
					obj.put("dong", dto.getDong());
					obj.put("type", dto.getType());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//unpleasant
		else if(command.equals("cctv")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<CCTVDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCCTV(dong);
				for(CCTVDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("address", dto.getAddress());
					obj.put("count", dto.getCount());
					obj.put("type", dto.getType());
					obj.put("lat", dto.getLat());
					obj.put("lng", dto.getLng());
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//cctv		
		else if(command.equals("population")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<PopulationDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectPopulation(dong);
				for(PopulationDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("no", dto.getNo());
					obj.put("all_all", dto.getAll_all());
					obj.put("all_man", dto.getAll_man());
					obj.put("all_woman", dto.getAll_woman());
					obj.put("kr_all", dto.getKr_all());
					obj.put("kr_man", dto.getKr_man());
					obj.put("kr_woman", dto.getKr_woman());
					obj.put("fr_all", dto.getFr_all());
					obj.put("fr_man", dto.getFr_man());
					obj.put("fr_woman", dto.getFr_woman());
					obj.put("senior", dto.getSenior());					
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//population		
		else if(command.equals("tour")) {
			String dong = request.getParameter("dong");
			PrintWriter out = response.getWriter();
			List<TourismDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectTourism(dong);
				for(TourismDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("type", dto.getType());
					obj.put("name", dto.getName());
					obj.put("lat", dto.getLat());
					obj.put("lng", dto.getLng());										
					obj.put("dong", dto.getDong());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//population
		else if(command.equals("natural")) {
			String gugun = request.getParameter("gugun");
			PrintWriter out = response.getWriter();
			List<NaturalDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectNatural(gugun);
				for(NaturalDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("name", dto.getName());
					obj.put("size", dto.getSize());
					obj.put("lat", dto.getLat());
					obj.put("lng", dto.getLng());										
					obj.put("link", dto.getLink());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//natural
		else if(command.equals("subway")) {
			String gugun = request.getParameter("gugun");
			PrintWriter out = response.getWriter();
			List<SubwayDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectSubway(gugun);
				for(SubwayDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("name", dto.getName());
					obj.put("address", dto.getAddress());
					obj.put("lat", dto.getLat());
					obj.put("lng", dto.getLng());										
					obj.put("ho", dto.getHo());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//subway
		else if(command.equals("codename1")) {
			PrintWriter out = response.getWriter();
			ArrayList<ShopCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCode1();
				for(ShopCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code1", dto.getCode1());
					obj.put("codename1", dto.getCodename1());
					arr.add(obj);
				}
			} catch (Exception e) {
				arr = new JSONArray();
				JSONObject obj = new JSONObject();
				obj.put("message_code", "-1");
				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//codename1
		else if(command.equals("codename2")) {
			String codename1 = request.getParameter("codename1");
			PrintWriter out = response.getWriter();
			List<ShopCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCode2(codename1);
				for(ShopCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code2", dto.getCode2());
					obj.put("codename2", dto.getCodename2());
					arr.add(obj);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//codename2
		else if(command.equals("codename3")) {
			String codename2 = request.getParameter("codename2");
			PrintWriter out = response.getWriter();
			List<ShopCodeDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectCode3(codename2);
				for(ShopCodeDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("code3", dto.getCode3());
					obj.put("codename3", dto.getCodename3());
					arr.add(obj);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//codename3
		else if(command.equals("store")) {
			String codename3 = request.getParameter("codename3");
			PrintWriter out = response.getWriter();
			List<StoreDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectStore(codename3);
				for(StoreDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("shopname", dto.getShopname());
					obj.put("codename3", dto.getCodename3());
					obj.put("address", dto.getAddress());
					arr.add(obj);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//store
		else if(command.equals("aptDeal")) {
			String aptName = request.getParameter("aptName");
			PrintWriter out = response.getWriter();
			List<HouseDealDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectAptDealByName(aptName);
				for(HouseDealDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("aptName", dto.getAptName());
					obj.put("aptNo", dto.getNo());
					obj.put("dealAmount", dto.getDealAmount());
					obj.put("dealYear", dto.getDealYear());
					obj.put("dealMonth", dto.getDealMonth());
					obj.put("dealDay", dto.getDealDay());
					obj.put("area", dto.getArea());										
					obj.put("floor", dto.getFloor());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//aptDeal
		else if(command.equals("aptScore")) {
			String aptName = request.getParameter("aptName");
			PrintWriter out = response.getWriter();
			List<AptScoreDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectAptScoreByName(aptName);
				for(AptScoreDto dto : list) {
//					System.out.println(dto.getAptName());
//					System.out.println(dto.getUserName());
//					System.out.println(dto.getContent());
//					System.out.println(dto.getRegtime());
					JSONObject obj = new JSONObject();
					obj.put("aptName", dto.getAptName());
					obj.put("userName", dto.getUserName());
					obj.put("content", dto.getContent());
					
					System.out.println(dto.getRegtime());
					TimeZone tz;
					Date date = new Date();
					DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					
					tz = TimeZone.getTimeZone("Greenwich"); 
					df.setTimeZone(tz);

					obj.put("time", df.format(dto.getRegtime()));					
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//aptScoreList
		else if(command.equals("showApt")) {
			PrintWriter out = response.getWriter();
			List<HouseInfoDto> list = null;
			JSONArray arr = new JSONArray();
			try {
				list = service.selectAptCompare();
				for(HouseInfoDto dto : list) {
					JSONObject obj = new JSONObject();
					obj.put("aptName", dto.getAptName());
					arr.add(obj);
				}
			} catch (Exception e) {
//				arr = new JSONArray();
//				JSONObject obj = new JSONObject();
//				obj.put("message_code", "-1");
//				arr.add(obj);
				e.printStackTrace();
			} finally {
				out.print(arr.toJSONString());
				out.close();
			}
		}//aptDeal
	}//process

}
