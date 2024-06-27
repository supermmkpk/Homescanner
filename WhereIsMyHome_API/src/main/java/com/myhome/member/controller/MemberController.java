package com.myhome.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.myhome.member.model.MemberDto;
import com.myhome.member.model.service.MemberService;
import com.myhome.util.JWTUtil;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;


/**
 * <pre>
 * 회원관리 REST 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Tag(name = "Member", description = "회원 관리")
@RestController
@RequestMapping("/member")
@CrossOrigin("*")
@Slf4j
public class MemberController{
    private final MemberService memberService;
    private final JWTUtil jwtUtil;
    
    @Autowired
    public MemberController(MemberService memberService, JWTUtil jwtUtil) {
        this.memberService = memberService;
        this.jwtUtil = jwtUtil;
    }

	@Operation(summary = "회원가입", description = "MemberDto객체를 받아 회원을 등록합니다.")
    @PostMapping("/regist")
    public ResponseEntity<?> regist(@RequestBody MemberDto memberDto) {	
		try {
			System.out.println("regist: " + memberDto);
			memberService.regist(memberDto);
			return new ResponseEntity<>(HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }
    
	/*
	@Operation(summary = "로그인", description = "userId, userPw로 회원을 조회합니다.")
    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody MemberDto memberDto) {
		
		try {
			MemberDto responseMemberDto = memberService.login(memberDto);
			if(responseMemberDto != null) {
//				session.setAttribute("userId", responseMemberDto.getUserId());
//				session.setAttribute("userName", responseMemberDto.getUserName());
				return ResponseEntity.ok(responseMemberDto);
			} else {
				return new ResponseEntity<>(HttpStatus.NOT_FOUND);
			}
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }
    */
	/*
    @GetMapping("/logout")
    public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
    }
    */
	
	@Operation(summary = "로그인", description = "아이디와 비밀번호를 이용하여 로그인 처리. accessToken, refreshToken, isAdmin을 반환")
	@PostMapping("/login")
	public ResponseEntity<?> login(@RequestBody MemberDto memberDto) {
		log.debug("login user : {}", memberDto);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			//해당 아이디, 비밀번호를 가지는 회원 존재 확인
			System.out.println(memberDto);
			MemberDto loginUser = memberService.login(memberDto);
			if(loginUser != null) {
				//아이디, 비밀번호 일치 회원 존재할 경우
				//AccessToken, RefreshToken 생성
				String accessToken = jwtUtil.createAccessToken(loginUser.getUserId());
				String refreshToken = jwtUtil.createRefreshToken(loginUser.getUserId());
				log.debug("access token : {}", accessToken);
				log.debug("refresh token : {}", refreshToken);
				
				//발급받은 refresh token 을 DB에 저장.
				memberService.saveRefreshToken(loginUser.getUserId(), refreshToken);
				
				//JSON 으로 token 전달.
				resultMap.put("access-token", accessToken);
				resultMap.put("refresh-token", refreshToken);
				if(loginUser.getRole().equals("admin")) {
					resultMap.put("is-admin", true);
				}
				else {
					resultMap.put("is-admin", false);
				}
				
				status = HttpStatus.CREATED;
			} else {
				//아이디, 비밀번호 일치 회원 존재하지 않을 경우
				resultMap.put("message", "아이디 또는 패스워드를 확인해 주세요.");
				status = HttpStatus.UNAUTHORIZED;
			} 
		} catch (Exception e) {
			System.out.println("에러");
			log.debug("로그인 에러 발생 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
	
	@Operation(summary = "회원인증", description = "회원 정보를 담은 Token 을 반환한다.")
	@GetMapping("/info/{userId}")
	public ResponseEntity<Map<String, Object>> getInfo(
			@PathVariable("userId") @Parameter(description = "인증할 회원의 아이디.", required = true) String userId,
			HttpServletRequest request) {
		log.debug("userId : {} ", userId);
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		
		if (jwtUtil.checkToken(request.getHeader("Authorization"))) {
			log.info("사용 가능한 토큰!!!");
			try {
				//로그인 사용자 정보.
				MemberDto memberDto = memberService.getMemberInfo(userId);
				resultMap.put("userInfo", memberDto);
				status = HttpStatus.OK;
			} catch (Exception e) {
				log.error("정보조회 실패 : {}", e);
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
			log.error("사용 불가능 토큰!!!");
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

	@Operation(summary = "로그아웃", description = "회원 정보를 담은 Token 을 제거한다.")
	@GetMapping("/logout/{userId}")
//	@Hidden
	public ResponseEntity<?> removeToken(@PathVariable ("userId") @Parameter(description = "로그아웃 할 회원의 아이디.", required = true) String userId) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		try {
			memberService.deleteRefreshToken(userId);
			status = HttpStatus.OK;
		} catch (Exception e) {
			log.error("로그아웃 실패 : {}", e);
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

	@Operation(summary = "Access Token 재발급", description = "만료된 access token 을 재발급 받는다.")
	@PostMapping("/refresh")
	public ResponseEntity<?> refreshToken(@RequestBody MemberDto memberDto, HttpServletRequest request)
			throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;
		String token = request.getHeader("refreshToken");
		log.debug("token : {}, memberDto : {}", token, memberDto);
		if (jwtUtil.checkToken(token)) {
			if (token.equals(memberService.getRefreshToken(memberDto.getUserId()))) {
				String accessToken = jwtUtil.createAccessToken(memberDto.getUserId());
				log.debug("token : {}", accessToken);
				log.debug("정상적으로 access token 재발급!!!");
				resultMap.put("access-token", accessToken);
				status = HttpStatus.CREATED;
			}
		} else {
			log.debug("refresh token 도 사용 불가!!!!!!!");
			status = HttpStatus.UNAUTHORIZED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}
    
    @Operation(summary = "회원정보 수정", description = "회원 정보를 수정합니다.")   
    @PutMapping("/edit")
    public ResponseEntity<?> memberEdit(@RequestBody MemberDto memberDto) {
		try {
			memberService.memberEdit(memberDto);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }
    
    @Operation(summary = "회원정보 상세 조회", description = "userId로 회원 정보를 상세 조회합니다.")   
    @GetMapping("/{userId}")
    public ResponseEntity<?> memberDetail(@PathVariable("userId") String userId) {			
		try {
			return ResponseEntity.ok(memberService.getMemberInfo(userId));
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }
    
    //회원 탈퇴(계정정보 화면에서..)
    @Operation(summary = "회원탈퇴", description = "회원 정보를 삭제합니다.")
    @DeleteMapping("/delete/{userId}")
    public ResponseEntity<?> delete(@PathVariable("userId") String userId) {			
		try {
			memberService.deleteMember(userId);
//			session.invalidate();
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }

    @Operation(summary = "회원정보 목록 조회(관리자 기능)", description = "관리자(userId=admin)일 때, 회원 정보를 모두 조회합니다.")   
    @GetMapping("/list")
    public ResponseEntity<?> memberList() {
    	try {
			List<MemberDto> list = memberService.list();
			return ResponseEntity.ok(list);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
    }
}
