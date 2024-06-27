package com.myhome.homelikes.model;

/**
 * <pre>
 * 관심 매물 DTO 클래스
 * </pre>
 * 
 * @author 박봉균
 * @since JDK17
 */
public class HomeLikesDto {

	private int likeId; // 관심 주택 테이블에서의 ID (기본키)
	private String userId; // 관심매물 등록한 userId(외래키)
	private String aptCode; // 관심매물의 코드(외래키)

	public HomeLikesDto() {
	}

	public int getLikeId() {
		return likeId;
	}

	public void setLikeId(int likeId) {
		this.likeId = likeId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAptCode() {
		return aptCode;
	}

	public void setAptCode(String aptCode) {
		this.aptCode = aptCode;
	}

	@Override
	public String toString() {
		return "HomeLikesDto [likeId=" + likeId + ", userId=" + userId + ", aptCode=" + aptCode + "]";
	}

}
