package com.myhome.notice.model;

/**
 * <pre>
 * 공지사항 DTO 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public class NoticeDto {

	private int id;
	private String title;
	private String contents;
	private String regId;
	private String regTime;
	
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getRegId() {
		return regId;
	}
	public void setRegId(String regId) {
		this.regId = regId;
	}
	public String getRegTime() {
		return regTime;
	}
	public void setRegTime(String regTime) {
		this.regTime = regTime;
	}
	
	@Override
	public String toString() {
		return "NoticeDto [id=" + id + ", title=" + title + ", contents=" + contents + ", regId=" + regId + ", regTime="
				+ regTime + "]";
	}
	
	
	
}
