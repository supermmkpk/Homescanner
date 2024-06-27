package com.myhome.board.model;


public class BoardDto {
	private int id; // 게시글 아이디
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private String time; // 게시글 등록일
	private int viewCnt; // 게시글 조회수
	private String userId; //등록 회원 아이디
	

	public BoardDto() {
	}


	public BoardDto(int id, String title, String content, String time, int viewCnt, String userId) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.time = time;
		this.viewCnt = viewCnt;
		this.userId = userId;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getTime() {
		return time;
	}


	public void setTime(String time) {
		this.time = time;
	}


	public int getViewCnt() {
		return viewCnt;
	}


	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	@Override
	public String toString() {
		return "BoardDto [id=" + id + ", title=" + title + ", content=" + content + ", time=" + time + ", viewCnt="
				+ viewCnt + ", userId=" + userId + "]";
	}

	
}
