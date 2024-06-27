package com.myhome.board.model.service;

import java.util.List;
import com.myhome.board.model.BoardDto;
import com.myhome.board.model.SearchConditionBoard;


public interface BoardService {
	// 게시글 전체 조회
	public List<BoardDto> getBoardList();

	// 게시글 상세조회 (클릭시 읽는거)
	public BoardDto readBoard(int id);

	// 게시글 작성
	public int writeBoard(BoardDto board);

	// 게시글 삭제
	public int removeBoard(int id);

	// 게시글 수정
	public int modifyBoard(BoardDto board);

	// 게시글 검색
	public List<BoardDto> searchBoard(SearchConditionBoard condition);
}
