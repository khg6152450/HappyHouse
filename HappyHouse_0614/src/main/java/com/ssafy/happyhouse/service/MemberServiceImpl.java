package com.ssafy.happyhouse.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.domain.MemberDto;
import com.ssafy.happyhouse.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;	
	
	@Override
	public void signUp(MemberDto member) {
		mapper.insertUser(member);
	}
	@Override
	public List<MemberDto> searchAll() {
		return mapper.searchAll();
	}
	@Override
	public MemberDto search(MemberDto member) {
		return mapper.search(member);
	}
	@Override
	public MemberDto searchById(String id) {
		return mapper.searchById(id);
	}
	@Override
	public MemberDto searchPwd(MemberDto dto) {
		return mapper.searchPwd(dto);
	}	
	@Override
	public void update(MemberDto member) {
		System.out.println(member.getName());
		System.out.println(member.getId());
		mapper.update(member);
	}
	@Override
	public void delete(MemberDto member) {
		mapper.delete(member);
	}
	
	@Override
	public MemberDto check(MemberDto dto) {
		return mapper.check(dto);
	}
}
