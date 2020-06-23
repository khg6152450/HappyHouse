package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.domain.MemberDto;

@Mapper
public interface MemberMapper {

	public int insertUser(MemberDto dto);
	public List<MemberDto> searchAll();
	public MemberDto search(MemberDto dto);
	public MemberDto searchById(String id);
	public MemberDto searchPwd(MemberDto dto);
	public void update(MemberDto member);
	public void delete(MemberDto member);
	
	public MemberDto check(MemberDto member);
}
