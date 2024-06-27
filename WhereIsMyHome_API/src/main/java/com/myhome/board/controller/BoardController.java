package com.myhome.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.myhome.board.model.BoardDto;
import com.myhome.board.model.SearchConditionBoard;
import com.myhome.board.model.service.BoardService;

import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;


/**
 * <pre>
 * 게시판(커뮤니티) REST 컨트롤러 클래스
 * </pre>
 * @author 박봉균
 * @since JDK17
 */
@Tag(name = "Board", description = "게시글 관리")
@RestController
@RequestMapping("/board")
@CrossOrigin("*")
public class BoardController {
	
	private final BoardService boardService;
	
	@Autowired	
	public BoardController(BoardService boardService) {
		this.boardService = boardService;
	}

	@Operation(summary = "게시글 목록 조회", description = "모든 게시글의 정보를 조회합니다.")
    @GetMapping("")
    public ResponseEntity<?> list() {
        List<BoardDto> boards = boardService.getBoardList();
    	return ResponseEntity.ok(boards);
    }

	@Operation(summary = "게시글 상세 조회", description = "게시글의 상세 정보를 조회합니다.")
    @GetMapping("/{id}")
    public ResponseEntity<?> detail(@PathVariable int id) {
		
		BoardDto board = boardService.readBoard(id);
		System.out.println(board);
		return new ResponseEntity<>(board, board == null ? HttpStatus.NOT_FOUND : HttpStatus.OK);
    }
    
	@Operation(summary = "게시글 작성", description = "게시글을 작성합니다.")
    @PostMapping("")
    public ResponseEntity<?> create(@RequestBody BoardDto board) {
		int result = boardService.writeBoard(board);
		System.out.println("create : " + board);
		return new ResponseEntity<>(result, result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

	@Operation(summary = "게시글 수정", description = "게시글을 수정합니다.")
    @PutMapping("/{id}")
    public ResponseEntity<?> update(@PathVariable int id, @RequestBody BoardDto updatedBoard) {
        updatedBoard.setId(id);
        int result = boardService.modifyBoard(updatedBoard);
        return new ResponseEntity<>(result, result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }

	@Operation(summary = "게시글 삭제", description = "게시글을 삭제합니다.")
    @DeleteMapping("/{id}")
    public ResponseEntity<?> delete(@PathVariable int id) {
		int result = boardService.removeBoard(id);
		return new ResponseEntity<>(result, result == 1 ? HttpStatus.OK : HttpStatus.BAD_REQUEST);
    }
    
	@Operation(summary = "게시글 검색", description = "게시글을 검색합니다.")
	@GetMapping("/search")
	public ResponseEntity<?> search(@ModelAttribute SearchConditionBoard condition) {
		System.out.println(condition);
		List<BoardDto> boards = boardService.searchBoard(condition);
		return ResponseEntity.ok(boards);
	}
}