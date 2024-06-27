package com.myhome.board.model.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.myhome.board.model.BoardDto;
import com.myhome.board.model.SearchConditionBoard;

@Mapper
public interface BoardMapper {
	// 전체 게시글 조회
	public List<BoardDto> selectAll();

	// ID에 해당하는 게시글 하나 가져오기
	public BoardDto selectOne(int id);

	// 게시글 등록
	public int insertBoard(BoardDto board);

	// 게시글 삭제
	public int deleteBoard(int id);

	// 게시글 수정
	public int updateBoard(BoardDto board);

	// 조회수 증가
	public void updateViewCnt(int id);

	// 게시글 검색
	public List<BoardDto> searchBoard(SearchConditionBoard condition);
}
