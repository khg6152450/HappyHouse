package com.ssafy.happyhouse.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.domain.KeyWordDto;
import com.ssafy.happyhouse.domain.NoticeDto;
import com.ssafy.happyhouse.domain.PagingKeyWordDto;
import com.ssafy.happyhouse.mapper.NoticeMapper;
import com.ssafy.happyhouse.util.KMPalgorithm;
import com.ssafy.happyhouse.util.MergeSort;
import com.ssafy.happyhouse.util.PageNavigation;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	private KMPalgorithm KMP;
	private MergeSort mergeSort;
	
	public NoticeServiceImpl() {
		KMP = new KMPalgorithm();
		mergeSort = new MergeSort();
	}

	@Override
	public void writeNotice(NoticeDto noticeDto) {
		mapper.insertNotice(noticeDto);
	}

	@Override
	public List<NoticeDto> listNotice(KeyWordDto keyword) {
//		String key = keyword.getKey();
//		String word = keyword.getWord();
//		key = key == null ? "" : key;
//		word = word == null ? "" : word;
//		List<NoticeDto> temp = mapper.searchKey(keyword);
//		List<NoticeDto> list = new ArrayList<>();
//		NoticeDto[] arr = null;
//		if("".equals(key) || "".equals(word)) {
//			mergeSort.mergeSort(temp);
//			return temp;
//		}
//		if("adminid".equals(key)) {
//			for (NoticeDto noticeDto : temp) {
//				if(KMP.KMP(noticeDto.getUserid(), word)) {
//					list.add(noticeDto);
//				}
//			}
//		}else if("noticeno".equals(key)) {
//			for (NoticeDto noticeDto : temp) {
//				if(KMP.KMP(Integer.toString(noticeDto.getNoticeno()), word)) {
//					list.add(noticeDto);
//				}
//			}
//		}else if("subject".equals(key)) {
//			for (NoticeDto noticeDto : temp) {
//				if(KMP.KMP(noticeDto.getSubject(), word)) {
//					list.add(noticeDto);
//				}
//			}
//		}
//		mergeSort.mergeSort(list);
//		for (NoticeDto noticeDto : list) {
//			System.out.println(noticeDto);
//		}
//		return list;
		return mapper.searchKey(keyword);
	}

	@Override
	public NoticeDto getNotice(int noticeno) {
		return mapper.detail(noticeno);
	}

	@Override
	public void modifyNotice(NoticeDto noticeDto) {
		mapper.update(noticeDto);
	}

	@Override
	public void deleteNotice(int noticeno) {
		mapper.delete(noticeno);
	}

	@Override
	public PageNavigation makePageNavigation(PagingKeyWordDto pgkw) {
		
		int currentPage = pgkw.getCurrentPage();
		int sizePerPage = pgkw.getSizePerPage();
		
		PageNavigation pageNavigation = new PageNavigation();
		int naviSize = 10; // 페이지 개수
		pageNavigation.setCurrentPage(currentPage);
		pageNavigation.setNaviSize(naviSize);
		
		int totalCount = mapper.getTotalCount(pgkw); // 총게시글 수
		
		pageNavigation.setTotalCount(totalCount);
		int totalPageCount = (totalCount - 1)/ sizePerPage + 1;// 전체 페이지수
		pageNavigation.setTotalPageCount(totalPageCount);
		boolean startRange = currentPage <= naviSize; // startRange true : 이전버튼 X false : 이전번트 O
		pageNavigation.setStartRange(startRange);
		boolean endRange = (totalPageCount -1)/naviSize * naviSize < currentPage;// endRange true : 나중버튼 X false : 나중번트 O
		pageNavigation.setEndRange(endRange); 
		pageNavigation.makeNavigator();
		return pageNavigation;
	}

	@Override
	public List<NoticeDto> listNotice(PagingKeyWordDto pgkw) {		
		return mapper.searchPage(pgkw);
	}

}
