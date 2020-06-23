package com.ssafy.happyhouse.domain;

public class MemberDto {


	// 아이디 
	private String id;
	// 비밀번호 
	private String password;
	// 이름 
	private String name;
	// 이메일 
	private String email;
	// 기본주소 
	private String address_default;
	// 휴대폰전화번호 
	private String phoneNum;
	// 상세주소 
	private String address_detail;
	// 우편번호 
	private String postNum;
	// 집전화번호 
	private String homeNum;
	// 설정 금액
	private String amount;
	// 설정 연도
	private String buildYear;
	// 설정 면적
	private String area;	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress_default() {
		return address_default;
	}
	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getHomeNum() {
		return homeNum;
	}
	public void setHomeNum(String homeNum) {
		this.homeNum = homeNum;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getBuildYear() {
		return buildYear;
	}
	public void setBuildYear(String buildYear) {
		this.buildYear = buildYear;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}

}