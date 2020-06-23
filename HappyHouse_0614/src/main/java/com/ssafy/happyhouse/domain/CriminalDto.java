package com.ssafy.happyhouse.domain;

public class CriminalDto {
	private int no;
	private String name;
	private String address;
	private String dong;
	private String criminalRecord;
	
	public String getCriminalRecord() {
		return criminalRecord;
	}
	public void setCriminalRecord(String criminalRecord) {
		this.criminalRecord = criminalRecord;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}	
}
