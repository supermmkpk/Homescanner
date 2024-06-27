package com.myhome.member.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.member.model.MemberDto;

/**
 * <pre>
 * 주택 정보 Mapper 인터페이스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Mapper
public interface MemberMapper {
	void regist(MemberDto memberDto) throws SQLException;
	
	MemberDto login(MemberDto memberDto) throws SQLException;
	void saveRefreshToken(Map<String, String> map) throws SQLException;
	Object getRefreshToken(String userId) throws SQLException;
	void deleteRefreshToken(Map<String, String> map) throws SQLException;
	
	MemberDto getMemberInfo(String userId) throws SQLException;
	void memberEdit(MemberDto memberDto) throws SQLException;
	List<MemberDto> listMember() throws SQLException;
	void deleteMember(String userId) throws SQLException;
	
	MemberDto findByEmail(String userEmail);
    MemberDto findByResetToken(String resetToken);
    void updatePassword(MemberDto memberDto);
}
