package com.myhome.homeinfo.model;

public class SearchCondition {
	private String type;
	private String searchText;
	private String pageNo;
	private String gugun;
	private String year;
	private String month;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	
	@Override
	public String toString() {
		return "SearchCondition [type=" + type + ", searchText=" + searchText + ", pageNo=" + pageNo + ", gugun="
				+ gugun + ", year=" + year + ", month=" + month + "]";
	}

}
