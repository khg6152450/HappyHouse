package com.ssafy.happyhouse.repository;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.domain.NoticeDto;

public interface NoticeDao {

	public void writeNotice(NoticeDto noticeDto) throws SQLException;
	public List<NoticeDto> listNotice(String key, String word) throws SQLException;
	public List<NoticeDto> listNotice(int pg, int sizePerPage, String key, String word) throws SQLException;
	public List<NoticeDto> selectAll() throws SQLException;
	public int getTotalCount(String key, String word) throws SQLException;
	
	public NoticeDto getNotice(int noticeno) throws SQLException;
	public void modifyNotice(NoticeDto noticeDto) throws SQLException;
	public void deleteNotice(int noticeno) throws SQLException;
	
}
