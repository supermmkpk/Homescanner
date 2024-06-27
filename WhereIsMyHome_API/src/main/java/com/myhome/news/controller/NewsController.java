package com.myhome.news.controller;

import java.net.URI;
import java.util.List;

import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myhome.news.model.NaverResultDto;
import com.myhome.news.model.NewsDto;

import io.swagger.v3.oas.annotations.tags.Tag;

/**
 * <pre>
 * 뉴스 REST 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Tag(name = "News", description = "뉴스 크롤링")
@RestController
@RequestMapping("/news")
@CrossOrigin("*")
public class NewsController {
	@GetMapping("/{display}")
	public ResponseEntity<?> list(@PathVariable String display) {
		
		// 네이버 검색 API 요청
		String clientId = "rMxTwMYkjCMJY9na9K2I"; 		
        String clientSecret = "CASmLgBHpK";
        
        //String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text;    // JSON 결과
        URI uri = UriComponentsBuilder
        		  .fromUriString("https://openapi.naver.com")
        		  .path("/v1/search/news.json")
        		  .queryParam("query", "부동산")
        		  .queryParam("display", display)
        		  .queryParam("start", 1)
        		  .queryParam("sort", "date") //정확도: sim, 날짜:date
        		  .encode()
        		  .build()
        		  .toUri();
        		  
        // Spring 요청 제공 클래스 
        RequestEntity<Void> req = RequestEntity
        						 .get(uri)
        						 .header("X-Naver-Client-Id", clientId)
        						 .header("X-Naver-Client-Secret", clientSecret)
        						 .build();
        // Spring 제공 restTemplate
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> resp = restTemplate.exchange(req, String.class);
        
        return resp;
        
        // JSON 파싱 (Json 문자열을 객체로 만듦, 문서화)
//        ObjectMapper om = new ObjectMapper();
//        NaverResultDto resultDto = null;
//        
//        try {
//        	resultDto = om.readValue(resp.getBody(), NaverResultDto.class);
//		} catch (JsonMappingException e) {
//			e.printStackTrace();
//		} catch (JsonProcessingException e) {
//			e.printStackTrace();
//		}
//        
//        List<NewsDto> books =resultDto.getItems();	// books를 list.html에 출력 -> model 선언

//		return "/book/list";
	}
}
