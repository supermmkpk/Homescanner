package com.myhome.news.model;

import java.util.List;

public class NaverResultDto {
	private String lastBuildDate;
	private int total;
	private int start;
	private int display;
	private List<NewsDto> items;
	
	public NaverResultDto() {}

	public NaverResultDto(String lastBuildDate, int total, int start, int display, List<NewsDto> items) {
		super();
		this.lastBuildDate = lastBuildDate;
		this.total = total;
		this.start = start;
		this.display = display;
		this.items = items;
	}

	public String getLastBuildDate() {
		return lastBuildDate;
	}

	public void setLastBuildDate(String lastBuildDate) {
		this.lastBuildDate = lastBuildDate;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public List<NewsDto> getItems() {
		return items;
	}

	public void setItems(List<NewsDto> items) {
		this.items = items;
	}

	@Override
	public String toString() {
		return "NaverResultDto [lastBuildDate=" + lastBuildDate + ", total=" + total + ", start=" + start + ", display="
				+ display + ", items=" + items + "]";
	}
	
}