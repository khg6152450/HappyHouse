package com.ssafy.happyhouse.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.domain.CommentDto;
import com.ssafy.happyhouse.service.SelectBoxService;

@Controller
public class SubController {
	
	@Autowired
	private SelectBoxService service;
	
	@GetMapping(value = "/isafe")
	public ModelAndView isafe() {
		return new ModelAndView("isafe/isafeMain");
	}
	
	@GetMapping(value = "/dongDetail")
	public ModelAndView dongDetail() {
		return new ModelAndView("dongDetail/dongDetail");
	}
	
	@GetMapping(value = "/aptCompare")
	public ModelAndView aptCompare() {
		return new ModelAndView("aptCompare/aptCompare");
	}
	
	@PostMapping("/writeComment")
	public String writeComment(CommentDto dto) {
		System.out.println(dto.getContent());
		service.InsertAptScoreByName(dto);
		//return new ModelAndView("/search");
		return "redirect:search/" + dto.getAptNo();
	}
	
}
