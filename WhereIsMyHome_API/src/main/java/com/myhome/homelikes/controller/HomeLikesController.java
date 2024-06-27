package com.myhome.homelikes.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.myhome.homelikes.model.HomeLikesDto;
import com.myhome.homelikes.model.service.HomeLikesService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

/**
 * <pre>
 * 관심 주택정보 REST 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Tag(name="HomeLikes", description="관심 주택 관리")
@RestController
@RequestMapping("/homeLikes")
@CrossOrigin("*")
public class HomeLikesController { 
	
	private HomeLikesService homeLikesService;	
	
	@Autowired
	public HomeLikesController(HomeLikesService homeLikesService) {
		this.homeLikesService=homeLikesService;
	}

	@Operation(summary="관심 주택 추가", description="해당 회원, 해당 매물에 대하여 관심주택으로 등록합니다.")
	@PostMapping("/add")
	public ResponseEntity<?> add(@RequestBody HomeLikesDto homeLikesDto) {
		System.out.println("debug: --관심 주택 추가--");
		try {
			homeLikesService.insert(homeLikesDto);
			System.out.println("debug: 추가 성공 : " + homeLikesDto);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Operation(summary="관심 주택 이름 목록 조회", description="해당 회원에 대하여 관심주택 목록을 이름과 함께 조회합니다.")
	@GetMapping("/list/{userId}")
	public ResponseEntity<?> list(@PathVariable String userId) {
		System.out.println("debug: --관심 주택 조회--");

		try {
			List<Map<String, String>> list = homeLikesService.list(userId);
			return ResponseEntity.ok(list);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Operation(summary="관심 주택 여부", description="해당 회원에 대하여 좋아요 등록 여부를 조회합니다.")
	@GetMapping("/isLiked")
	public ResponseEntity<?> isLiked(@ModelAttribute HomeLikesDto homeLikesDto) {
		System.out.println("debug: --아파트별 관심 주택 조회--");
		System.out.println(homeLikesDto);
		
		try {
			boolean isLiked = homeLikesService.isLiked(homeLikesDto);
			System.out.println(isLiked);
			return ResponseEntity.ok(isLiked);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@Operation(summary="관심 주택 삭제", description="해당 회원이 등록했던 관심주택을 삭제합니다.")
	@DeleteMapping("/delete")
	public ResponseEntity<?> delete(@ModelAttribute HomeLikesDto homeLikesDto) {
		System.out.println("debug: --관심 주택 삭제--");
		
		try {
			homeLikesService.delete(homeLikesDto);
			System.out.println("debug: 삭제 성공 : ");
			
			return new ResponseEntity<>(HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}

}
