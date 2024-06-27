package com.myhome.comment.controller;

import java.util.ArrayList;
import java.util.List;

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

import com.myhome.comment.model.CommentDto;
import com.myhome.comment.model.service.CommentService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;

@Tag(name = "Comment", description = "게시글에 대한 댓글을 조작합니다.")
@RestController
@RequestMapping("/comment")
@CrossOrigin("*")
public class CommentController {
	private final CommentService commentService;

	@Autowired
	public CommentController(CommentService commentService) {
		this.commentService = commentService;
	}
	
	@Operation(summary="댓글 목록", description="게시글 번호로 댓글을 모두 조회합니다.")
	@GetMapping("/{boardId}")
	public ResponseEntity<?> listByBoardId(@PathVariable int boardId) {
		try {
			List<CommentDto> commentList = new ArrayList<>();
			commentList = commentService.findByBoardId(boardId);
			System.out.println(commentList);
			return ResponseEntity.ok(commentList);
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PostMapping("/regist")
	public ResponseEntity<?> regist(@RequestBody CommentDto commentDto) {
		try {
			System.out.println("controller, " + commentDto);
			commentService.insertComment(commentDto);
			return new ResponseEntity<>(HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@PutMapping("/update")
	public ResponseEntity<?> updateComment(@RequestBody CommentDto commentDto) {
		try {
			commentService.updateComment(commentDto);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteComment(@PathVariable int id) {
		try {
			commentService.deleteComment(id);
			return new ResponseEntity<>(HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

}
