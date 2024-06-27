package com.myhome.member.model;

/**
 * <pre>
 * 회원 정보 DTO 클래스
 * </pre>
 * 
 * @author 박봉균
 * @since JDK17
 */
public class MemberDto {
	private String userId;
	private String userPw;
	private String userEmail;
	private String userName;
	private String userMobile;
	private String userAddress;
	private String joinDate;
	private String role;
	private String token;
	private String resetToken;

	public MemberDto() {
	}

	public MemberDto(String userId, String userPw, String userEmail, String userName, String userMobile,
			String userAddress, String joinDate, String role, String token, String resetToken) {
		this.userId = userId;
		this.userPw = userPw;
		this.userEmail = userEmail;
		this.userName = userName;
		this.userMobile = userMobile;
		this.userAddress = userAddress;
		this.joinDate = joinDate;
		this.role = role;
		this.token = token;
		this.resetToken = resetToken;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserMobile() {
		return userMobile;
	}

	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(String joinDate) {
		this.joinDate = joinDate;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public String getResetToken() {
		return resetToken;
	}

	public void setResetToken(String resetToken) {
		this.resetToken = resetToken;
	}

	@Override
	public String toString() {
		return "MemberDto [userId=" + userId + ", userPw=" + userPw + ", userEmail=" + userEmail + ", userName="
				+ userName + ", userMobile=" + userMobile + ", userAddress=" + userAddress + ", joinDate=" + joinDate
				+ ", role=" + role + ", token=" + token + ", resetToken=" + resetToken + "]";
	}

}
