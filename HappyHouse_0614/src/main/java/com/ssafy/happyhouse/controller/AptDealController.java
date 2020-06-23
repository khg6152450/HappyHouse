package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.domain.SearchDto;
import com.ssafy.happyhouse.service.HouseService;
import com.ssafy.happyhouse.util.PageNavigation;

@RestController // 모든 메소드의 결과값은 문자열이다
public class AptDealController {
	int currentPage = 1;
	
	@Autowired
	private HouseService service;
	
	// 전체 매매 정보 조회
	@GetMapping(value = "/search")
	private ModelAndView retrieveApt(Model model, HttpServletRequest request) throws Exception {
		
		// 페이지 번호가 넘어오지 않은 경우 때문에 1로 초기화
		currentPage = 1;
		String s = request.getParameter("pg");
		if(s != null && s.trim().length() != 0) {
			// 페이징
			currentPage = Integer.parseInt(s); // 현재 페이지 번호 
		} 
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);// 페이지당 글 개수
		
		// 검색 종류
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		SearchDto param = new SearchDto();
		param.setSearchType(searchType == null ? "all" : searchType);
		param.setSearchWord(searchWord);
		param.setCurrentPage(currentPage);
		param.setSizePerPage(sizePerPage);
		PageNavigation pageNavigation = service.makePageNavigation(
				currentPage, sizePerPage, searchWord, param.getSearchType());
		
		request.setAttribute("navigation", pageNavigation);
		
		model.addAttribute("list", service.retrieveHouse(param));
		return new ModelAndView("apt/aptDeal");
	}
	
	@GetMapping(value = "/infosearch/{no}")
	private ModelAndView detailAptinfo(@PathVariable("no") int no, Model model) throws Exception {
		System.out.println(no);
		model.addAttribute("apt", service.detailHouseinfoByNo(no));
		return new ModelAndView("apt/aptinfoDetail");
	}
	
	// 아파트 이름 눌러서 상세 조회
	@GetMapping(value = "/search/{no}")
	private ModelAndView detailApt(@PathVariable("no") int no, Model model) throws Exception {
		model.addAttribute("apt", service.detailHouseByNo(no)); 
		return new ModelAndView("apt/aptDetail");
	}
	
	// 검색 버튼을 통한 조회
	@PostMapping(value = "/search")
	private ModelAndView searchApt(Model model, HttpServletRequest request) throws Exception {

		// 페이지 번호가 넘어오지 않은 경우 때문에 1로 초기화
		currentPage = 1;
		String s = request.getParameter("pg");
		if (s != null && s.trim().length() != 0) {
			// 페이징
			currentPage = Integer.parseInt(s); // 현재 페이지 번호
		}
		String spp = request.getParameter("spp");
		int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);// 페이지당 글 개수

		// 검색 종류
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");

		SearchDto param = new SearchDto();
		param.setSearchType(searchType == null ? "all" : searchType);
		param.setSearchWord(searchWord);
		param.setCurrentPage(currentPage);
		param.setSizePerPage(sizePerPage);
		System.out.println("Controller, type: " + searchType + " word: " + searchWord + " !");
		System.out.println("current : " + currentPage + " sizePerPage : " + sizePerPage);
		PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, searchWord,
				param.getSearchType());

		request.setAttribute("navigation", pageNavigation);
		switch(param.getSearchType()) {
		case "all":
			searchWord = null;
			param.setSearchWord(searchWord);
			model.addAttribute("list", service.retrieveHouse(param));
			break;
		case "dong":
			model.addAttribute("list", service.retrieveHouseByDong(param));
			break;
		case "AptName":
			model.addAttribute("list", service.retrieveHouseByName(param));
			break;
		}
		
		
		return new ModelAndView("apt/aptDeal");
	}
}
