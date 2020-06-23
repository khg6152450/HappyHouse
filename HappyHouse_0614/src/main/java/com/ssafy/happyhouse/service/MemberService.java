package com.ssafy.happyhouse.service;

import java.util.List;

import com.ssafy.happyhouse.domain.MemberDto;

public interface MemberService {
	void signUp(MemberDto member);
	List<MemberDto> searchAll();
	MemberDto search(MemberDto member);
	MemberDto searchById(String id);
	MemberDto searchPwd(MemberDto member);
	void update(MemberDto member);
	void delete(MemberDto member);
	public MemberDto check(MemberDto dto);
}
