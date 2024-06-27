package com.myhome.member.model.service;

import java.util.List;

import com.myhome.member.model.MemberDto;

/**
 * <pre>
 * 회원 정보 서비스 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
public interface MemberService {
	void regist(MemberDto memberDto) throws Exception;
	
	MemberDto login(MemberDto memberDto) throws Exception;
	MemberDto getMemberInfo(String userId) throws Exception;
	void saveRefreshToken(String userId, String token) throws Exception;
	Object getRefreshToken(String userId) throws Exception;
	void deleteRefreshToken(String userId) throws Exception;
	
	void memberEdit(MemberDto memberDto) throws Exception;
	List<MemberDto> list() throws Exception;
	void deleteMember(String userId) throws Exception;
	
	//비밀번호 변경(재설정)
	void sendPasswordResetLink(String userEmail) throws Exception;
	void resetPassword(String token, String newPassword) throws Exception;
}
