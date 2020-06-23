package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.domain.KeyWordDto;
import com.ssafy.happyhouse.domain.NoticeDto;
import com.ssafy.happyhouse.domain.PagingKeyWordDto;

@Mapper
public interface NoticeMapper {

	public int insertNotice(NoticeDto dto);
	public List<NoticeDto> searchKey(KeyWordDto keyword);
	public List<NoticeDto> searchPage(PagingKeyWordDto pgkw);
	public NoticeDto detail(int noticeno);
	public void update(NoticeDto dto);
	public void delete(int noticeno);
	public int getTotalCount(PagingKeyWordDto pgkw);
	
}
