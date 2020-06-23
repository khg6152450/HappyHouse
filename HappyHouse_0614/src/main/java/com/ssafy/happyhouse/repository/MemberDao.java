package com.ssafy.happyhouse.repository;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.domain.MemberDto;

public interface MemberDao {
	
	void insertUser(MemberDto member) throws SQLException;
	List<MemberDto> searchAll() throws SQLException;
	MemberDto search(MemberDto member) throws SQLException;
	MemberDto searchById(MemberDto member) throws SQLException;
	MemberDto searchPwd(MemberDto member) throws SQLException;
	void update(MemberDto member) throws SQLException;
	void delete(MemberDto member) throws SQLException;
}
