package com.myhome.notice.controller;

import java.util.List;
import java.util.Optional;

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

import com.myhome.notice.model.NoticeDto;
import com.myhome.notice.model.service.NoticeService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

/**
 * <pre>
 * 공지사항 REST 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Tag(name = "Notice", description = "공지사항 관리")
@RestController
@RequestMapping("/notice")
@CrossOrigin("*")
public class NoticeController {

	private final NoticeService noticeService;
	
	@Autowired
	public NoticeController(NoticeService noticeService) {
		this.noticeService=noticeService;
	}
	
	@Operation(summary="공지사항 목록", description = "공지사항 목록을 전체 조회하며, PathVariable로 limit이 있을 경우, limit개를 조회합니다." )
	@GetMapping(path={"/{limit}", ""})
	public ResponseEntity<?> getNotices(@PathVariable(required=false) Integer limit) {
		try {
			List<NoticeDto> notices = noticeService.getNotices(limit);
			return ResponseEntity.ok(notices);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Operation(summary="공지사항 상세 조회", description = "공지사항 id로 상세 조회합니다.")
	@GetMapping("/detail/{noticeId}")
	public ResponseEntity<?> detail(@PathVariable int noticeId) {		
		try {
			NoticeDto noticeDto = noticeService.detailNotice(noticeId);
			return ResponseEntity.ok(noticeDto);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		
	}
		
	@Operation(summary="공지사항 등록(관리자)", description = "공지사항을 등록합니다.")
	@PostMapping("/regist")
	public ResponseEntity<?> writeNotice(@RequestBody NoticeDto noticeDto) {
		try {
			noticeService.writeNotice(noticeDto);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Operation(summary="공지사항 삭제(관리자)", description = "공지사항을 삭제합니다.")
	@DeleteMapping("/delete/{noticeId}")
	public ResponseEntity<?> deleteNotice(@PathVariable int noticeId) {
		try {
			noticeService.deleteNotice(noticeId);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@Operation(summary="공지사항 수정(관리자)", description = "공지사항을 수정합니다.")
	@PutMapping("/modify")
	public ResponseEntity<?> modifyNotice(@RequestBody NoticeDto noticeDto) {
		try {
			System.out.println(noticeDto.getId() + ", "+noticeDto.getContents() + ", "+noticeDto.getTitle() + ", ");
			noticeService.modifyNotice(noticeDto);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
	}
}
