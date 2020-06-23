package com.ssafy.happyhouse.domain;

public class SearchDto {
	private String[] dealType;
	private String searchType;
	private String searchWord;
	private int currentPage;
	private int sizePerPage;
	
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getSizePerPage() {
		return sizePerPage;
	}
	public void setSizePerPage(int sizePerPage) {
		this.sizePerPage = sizePerPage;
	}
	public String[] getDealType() {
		return dealType;
	}
	public void setDealType(String[] dealType) {
		this.dealType = dealType;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
}