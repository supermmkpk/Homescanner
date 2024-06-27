package com.myhome.oauth.controller;
import java.net.URI;
import java.net.http.HttpHeaders;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.oauth2.client.annotation.RegisteredOAuth2AuthorizedClient;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriComponentsBuilder;

import com.myhome.oauth.model.service.KakaoService;

import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;

@Tag(name = "OAuth", description = "소셜 로그인")
@RestController
@RequestMapping("/oauthLogin")
@CrossOrigin("*")
@Slf4j
public class OAuthLoginController {
	@Autowired
	private KakaoService kakaoService;
	
	@GetMapping("/login")
	@ResponseBody
	public String login() {
		String url = "https://kauth.kakao.com/oauth/authorize?client_id=65022e0284020017ae02e6d2cedc906f&redirect_uri=http://localhost:8080/myhome/oauthLogin/login/kakao&response_type=code";
		System.out.println("oauthLogin 컨트롤러 접근" );
		return url;
	}
	
	@GetMapping(value="/login/kakao")
	public RedirectView kakaoCallback(@RequestParam String code, HttpServletResponse response) {
		String accessToken = kakaoService.getAccessToken(code);
		System.out.println("accessToken=" + accessToken);
		System.out.println("쿠키 저장, redirect to localhost:5173");
		Cookie cookie = new Cookie("kakao_access_token", accessToken);
	    cookie.setHttpOnly(false);
	    cookie.setSecure(false); // HTTPS 환경에서만 사용
	    cookie.setPath("/");
	    cookie.setMaxAge(24 * 60 * 60);
	    response.addCookie(cookie);
//		session.setAttribute("kakao_access_token", accessToken);
	    
	    // Vue3 애플리케이션으로 리디렉트
	    RedirectView redirectView = new RedirectView();
	    redirectView.setUrl("http://localhost:5173");
	    return redirectView;
	}
	
    @GetMapping("/loginSuccess")
    public ResponseEntity<?> loginSuccess(OAuth2AuthenticationToken authentication) {
        OAuth2User user = authentication.getPrincipal();
        System.out.println(user.getAttributes());
        return ResponseEntity.ok(user);
    }
}
