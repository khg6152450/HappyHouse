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
import com.ssafy.happyhouse.service.StoreService;
import com.ssafy.happyhouse.util.PageNavigation;

@RestController
public class StoreController {
   int currentPage = 1;
   
   @Autowired
   private StoreService service;
   
   @GetMapping(value = "/store")
   private ModelAndView retrieveStore(Model model, HttpServletRequest request) throws Exception {
      
      currentPage = 1;
      String s = request.getParameter("pg");
      if(s != null && s.trim().length() != 0) {
         currentPage = Integer.parseInt(s); 
      } 
      System.out.println(currentPage);
      String spp = request.getParameter("spp");
      int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);
      
      String searchType = request.getParameter("searchType");
      String searchWord = request.getParameter("searchWord");
      
      SearchDto param = new SearchDto();
      param.setSearchType(searchType == null ? "all" : searchType);
      param.setSearchWord(searchWord);
      param.setCurrentPage(currentPage);
      param.setSizePerPage(sizePerPage);
      System.out.println("Controller, " + param.getSearchType() + " " + param.getSearchWord() + " !");
      
      PageNavigation pageNavigation = service.makePageNavigation(
            currentPage, sizePerPage, searchWord, param.getSearchType());
      
      request.setAttribute("navigation", pageNavigation);
      
      model.addAttribute("list", service.retrieveStore(param));
      return new ModelAndView("store/storeList");
   }
   
   // 검색 버튼을 통한 조회
   @PostMapping(value = "/store")
   private ModelAndView searchApt(Model model, HttpServletRequest request) throws Exception {

      currentPage = 1;
      String s = request.getParameter("pg");
      if (s != null && s.trim().length() != 0) {
         currentPage = Integer.parseInt(s); 
      }
      System.out.println(currentPage);
      String spp = request.getParameter("spp");
      int sizePerPage = spp == null ? 10 : Integer.parseInt(spp);

      // 검색 종류
      String searchType = request.getParameter("searchType");
      String searchWord = request.getParameter("searchWord");

      SearchDto param = new SearchDto();
      param.setSearchType(searchType == null ? "all" : searchType);
      param.setSearchWord(searchWord);
      param.setCurrentPage(currentPage);
      param.setSizePerPage(sizePerPage);
      System.out.println("Controller, " + param.getSearchType() + " " + param.getSearchWord() + " !");

      PageNavigation pageNavigation = service.makePageNavigation(currentPage, sizePerPage, searchWord,
            param.getSearchType());

      request.setAttribute("navigation", pageNavigation);
      
      switch(param.getSearchType()) {
      case "all":
         searchWord = null;
         param.setSearchWord(searchWord);
         model.addAttribute("list", service.retrieveStore(param));
         break;
      case "dong":
         model.addAttribute("list", service.retrieveStoreByDong(param));
         break;
      case "codename3":
         model.addAttribute("list", service.retrieveStoreByCode(param));
         break;
      }
      return new ModelAndView("store/storeList");
   }
}