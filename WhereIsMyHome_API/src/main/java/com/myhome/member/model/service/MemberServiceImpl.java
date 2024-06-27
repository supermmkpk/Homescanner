package com.myhome.member.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.email.model.service.EmailService;
import com.myhome.member.model.MemberDto;
import com.myhome.member.model.mapper.MemberMapper;

/**
 * <pre>
 * 회원 정보 서비스 구현 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Service
public class MemberServiceImpl implements MemberService {
	private final MemberMapper memberMapper;
	private final EmailService emailService;
	
	@Autowired
	public MemberServiceImpl(MemberMapper memberMapper, EmailService emailService) {
		this.memberMapper = memberMapper;
		this.emailService = emailService;
	}

	@Override
	@Transactional
	public void regist(MemberDto memberDto) throws Exception {
		//비밀번호 해쉬 암호화
		//byte[] salt = PasswordHash.getInstance().getSalt();
		String password = PasswordHash.getInstance().get_SHA_256_SecurePassword(memberDto.getUserPw());
		memberDto.setUserPw(password);
		
		memberMapper.regist(memberDto);
	}
	
	@Override
	public MemberDto login(MemberDto memberDto) throws Exception {
		//비밀번호 해쉬 암호화
		//byte[] salt = PasswordHash.getInstance().getSalt();
		String password = PasswordHash.getInstance().get_SHA_256_SecurePassword(memberDto.getUserPw());
		memberDto.setUserPw(password);
		
		// 조회한 아이디와 비밀번호가 같으면 응답반은 객체를 반환
		return memberMapper.login(memberDto);
	}

	@Override
	public MemberDto getMemberInfo(String userId) throws Exception {
		return memberMapper.getMemberInfo(userId);
	}

	@Override
	public void saveRefreshToken(String userId, String token) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("token", token);
		memberMapper.saveRefreshToken(map);
	}

	@Override
	public Object getRefreshToken(String userId) throws Exception {
		System.out.println("service");
		return memberMapper.getRefreshToken(userId);
	}

	@Override
	public void deleteRefreshToken(String userId) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("token", null);
		memberMapper.deleteRefreshToken(map);
	}

	@Override
	public void memberEdit(MemberDto memberDto) throws Exception {
		memberMapper.memberEdit(memberDto);
	}

	@Override
	public List<MemberDto> list() throws Exception {
		return memberMapper.listMember();
	}

	@Override
	public void deleteMember(String userId) throws Exception {
		memberMapper.deleteMember(userId);
	}
	
	/**
	 * 재설정 링크 제공
	 * @param userEmail
	 * @throws Exception
	 */
	public void sendPasswordResetLink(String userEmail) throws Exception {
		//이메일로 회원 조회
        MemberDto memberDto = memberMapper.findByEmail(userEmail);
        if (memberDto == null) {
            throw new Exception("사용자를 찾을 수 없습니다.");
        }

        //토큰 생성 및 영속화
        String resetToken = UUID.randomUUID().toString();
        memberDto.setResetToken(resetToken);
        memberMapper.updatePassword(memberDto); //현재는 resetToken 저장 용도

        // 이메일로 링크 전송
        String resetLink = "http://localhost:5173/reset-password?token=" + resetToken;
        emailService.sendEmail(userEmail, "비밀번호 재설정", "다음 링크를 클릭하여 비밀번호를 재설정하세요: " + resetLink);
    }
	
	/**
	 * 비밀번호 재설정
	 * @param token
	 * @param newPassword
	 * @throws Exception
	 */
	public void resetPassword(String token, String newPassword) throws Exception {
		//리셋 토큰으로 해당 회원 조회
        MemberDto memberDto = memberMapper.findByResetToken(token);
        if (memberDto == null) {
            throw new Exception("유효하지 않은 토큰입니다.");
        }

        //비밀번호 해시화 후 변경
        String password = PasswordHash.getInstance().get_SHA_256_SecurePassword(newPassword);
        memberDto.setUserPw(password);
        memberDto.setResetToken(null); // 토큰을 무효화
        memberMapper.updatePassword(memberDto);
    }
	
}
