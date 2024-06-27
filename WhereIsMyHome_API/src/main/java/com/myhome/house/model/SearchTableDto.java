package com.myhome.house.model;

public class SearchTableDto {

	private String aptCode;
	private String sort;
	private int offset;
	private int limit;
	public String getAptCode() {
		return aptCode;
	}
	public void setAptCode(String aptCode) {
		this.aptCode = aptCode;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	@Override
	public String toString() {
		return "SearchTableDto [aptCode=" + aptCode + ", sort=" + sort + ", offset=" + offset + ", limit=" + limit
				+ "]";
	}
	
}
