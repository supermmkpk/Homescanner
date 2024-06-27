package com.myhome.school.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myhome.school.model.SchoolDto;
import com.myhome.school.model.service.SchoolService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

/**
 * <pre>
 * 학군 정보 REST 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Tag(name="School", description="학군(학교) 정보 조회")
@RestController
@RequestMapping("/school")
@CrossOrigin("*")
public class SchoolController {
	
	private final SchoolService schoolService;
	
	@Autowired
	public SchoolController(SchoolService schoolService) {
		this.schoolService = schoolService;
	}
	
	@Operation(summary="법정동으로 조회", description="해당 법정동의 학교 정보 조회")
	@GetMapping("/{dong}")
	public ResponseEntity<?> listByDong(@PathVariable String dong) {
		try {
			List<SchoolDto> list = schoolService.listByDong(dong);
			System.out.println("debug : 법정동=" + dong + " 학교 조회 성공.");
			return ResponseEntity.ok(list);
		} catch(Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}
	}

}
