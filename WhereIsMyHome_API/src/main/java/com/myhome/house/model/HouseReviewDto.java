package com.myhome.house.model;

public class HouseReviewDto {

	private int reviewCode;
	private String aptCode;
	private String reviewText;
	private String userId;
	private String time;
	
	public int getReviewCode() {
		return reviewCode;
	}
	public void setReviewCode(int reviewCode) {
		this.reviewCode = reviewCode;
	}
	public String getAptCode() {
		return aptCode;
	}
	public void setAptCode(String aptCode) {
		this.aptCode = aptCode;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	@Override
	public String toString() {
		return "HouseReviewDto [reviewCode=" + reviewCode + ", aptCode=" + aptCode + ", reviewText=" + reviewText
				+ ", userId=" + userId + "]";
	}
	
	
}
