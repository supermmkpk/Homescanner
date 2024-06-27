package com.myhome.member.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myhome.member.model.service.MemberService;

import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "ForgotPassword", description = "비밀번호 찾기")
@RestController
@RequestMapping("/forgot")
@CrossOrigin("*")
public class ForgotController {
	private final MemberService memberService;
	
	@Autowired
	public ForgotController(MemberService memberService) {
		this.memberService = memberService;
	}

	@PostMapping("/forgot-password")
	public ResponseEntity<String> forgotPassword(@RequestBody Map<String, String> emailMap) {
		String email = emailMap.get("email");
		try {
			memberService.sendPasswordResetLink(email);
			return ResponseEntity.ok("비밀번호 재설정 링크가 이메일로 전송되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("이메일 전송에 실패했습니다.");
		}
	}

	@PostMapping("/reset-password")
	public ResponseEntity<String> resetPassword(@RequestBody Map<String, String> resetMap) {
		String resetToken = resetMap.get("resetToken");
		String newPassword = resetMap.get("newPassword");
		try {
			memberService.resetPassword(resetToken, newPassword);
			return ResponseEntity.ok("비밀번호가 성공적으로 재설정되었습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("비밀번호 재설정에 실패했습니다.");
		}
	}
}
