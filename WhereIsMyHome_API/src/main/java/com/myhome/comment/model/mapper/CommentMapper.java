package com.myhome.comment.model.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.myhome.comment.model.CommentDto;

@Mapper
public interface CommentMapper {

	List<CommentDto> findByBoardId(int boardId) throws SQLException;

	void insertComment(CommentDto commentDto) throws SQLException;

	void updateComment(CommentDto commentDto) throws SQLException;

	void deleteComment(int id) throws SQLException;
}
