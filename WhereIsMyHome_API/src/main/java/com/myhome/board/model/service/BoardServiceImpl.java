package com.myhome.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myhome.board.model.BoardDto;
import com.myhome.board.model.SearchConditionBoard;
import com.myhome.board.model.mapper.BoardMapper;


@Service
public class BoardServiceImpl implements BoardService {

	private final BoardMapper boardMapper;

	@Autowired
	public BoardServiceImpl(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	@Override
	public List<BoardDto> getBoardList() {
		return boardMapper.selectAll();
	}

	@Override
	public BoardDto readBoard(int id) {
		BoardDto boardDto = boardMapper.selectOne(id);
		if(boardDto != null) {
			boardMapper.updateViewCnt(id);
		}
		return boardDto;
	}

	@Transactional
	@Override
	public int writeBoard(BoardDto board) {
		return boardMapper.insertBoard(board);
	}

	@Transactional
	@Override
	public int removeBoard(int id) {
		return boardMapper.deleteBoard(id);
	}

	@Transactional
	@Override
	public int modifyBoard(BoardDto board) {
		return boardMapper.updateBoard(board);
	}

	@Override
	public List<BoardDto> searchBoard(SearchConditionBoard condition) {
		return boardMapper.searchBoard(condition);
	}
}
