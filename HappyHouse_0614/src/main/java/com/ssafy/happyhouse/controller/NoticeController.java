package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.domain.AptScoreDto;
import com.ssafy.happyhouse.domain.KeyWordDto;
import com.ssafy.happyhouse.domain.NoticeDto;
import com.ssafy.happyhouse.service.NoticeService;


@Controller
public class NoticeController extends HttpServlet {
	
	@Autowired
	NoticeService noticeService;
	
	@GetMapping(value = "/notice")
	public ModelAndView main() {
		return new ModelAndView("notice/noticeMain");
	}
	
	@GetMapping(value = "/qna")
	public ModelAndView qna() {
		return new ModelAndView("qna/list");
	}
	
	@GetMapping(value = "/writeNotice")
	public ModelAndView writeNotice() {
		return new ModelAndView("notice/write");
	}
	
	@GetMapping(value = "/deleteNotice")
	public ModelAndView deleteNotice(int noticeno) {
		noticeService.deleteNotice(noticeno);
		return new ModelAndView("notice/deletesuccess");
	}
	
	@GetMapping(value = "/updateNotice")
	public ModelAndView updateNotice(Model model, int noticeno) {
		model.addAttribute("notice", noticeService.getNotice(noticeno));
		return new ModelAndView("notice/modify");
	}
	
	@PostMapping("/writeNotice")
	public ModelAndView writeNotice(NoticeDto notice) {
		noticeService.writeNotice(notice);		
		return new ModelAndView("notice/writesuccess");
	}
	
	@PostMapping("/modifyNotice")
	public ModelAndView modifyNotice(NoticeDto notice) {
		noticeService.modifyNotice(notice);		
		return new ModelAndView("notice/modifysuccess");
	}
	
	@GetMapping(value = "/noticeList")
	public ModelAndView noticeList(Model model) {
		KeyWordDto keyword = new KeyWordDto();
		keyword.setKey(null);
		keyword.setWord("");
		
		model.addAttribute("notices", noticeService.listNotice(keyword));
		
		return new ModelAndView("notice/list");
	}
}
