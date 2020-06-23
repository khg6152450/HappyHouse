package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.domain.KeyWordDto;
import com.ssafy.happyhouse.domain.NoticeDto;
import com.ssafy.happyhouse.domain.PagingKeyWordDto;
import com.ssafy.happyhouse.util.PageNavigation;

public interface NoticeService {

	public void writeNotice(NoticeDto noticeDto);
	public List<NoticeDto> listNotice(KeyWordDto keyword);
	public List<NoticeDto> listNotice(PagingKeyWordDto pgkw);
	public PageNavigation makePageNavigation(PagingKeyWordDto pgkw);
	public NoticeDto getNotice(int noticeno);
	public void modifyNotice(NoticeDto noticeDto);
	public void deleteNotice(int noticeno);
	
}
