package com.myhome.comment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myhome.comment.model.CommentDto;
import com.myhome.comment.model.mapper.CommentMapper;

@Service
public class CommentServiceImpl implements CommentService {
	
	private final CommentMapper commentMapper;
	
	@Autowired
	public CommentServiceImpl(CommentMapper commentMapper) {
		this.commentMapper = commentMapper;
	}

	@Override
	public List<CommentDto> findByBoardId(int boardId) throws Exception {
		return commentMapper.findByBoardId(boardId);
	}

	@Override
	public void insertComment(CommentDto commentDto) throws Exception {
		System.out.println(commentDto);
		commentMapper.insertComment(commentDto);
	}

	@Override
	public void updateComment(CommentDto commentDto) throws Exception {
		commentMapper.updateComment(commentDto);
	}

	@Override
	public void deleteComment(int id) throws Exception {
		commentMapper.deleteComment(id);
	}
}
