package com.myhome.comment.model;

public class CommentDto {
	private int id; // 기본키
	private String content; // 내용
	private int boardId; // 게시글id
	private String userId; // 작성자id
	private String time; // 작성일시

	public CommentDto() {
		super();
	}

	public CommentDto(int id, String content, int boardId, String userId, String time) {
		super();
		this.id = id;
		this.content = content;
		this.boardId = boardId;
		this.userId = userId;
		this.time = time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
		this.boardId = boardId;
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
		return "CommentDto [id=" + id + ", content=" + content + ", boardId=" + boardId + ", userId=" + userId
				+ ", time=" + time + "]";
	}

}
