package com.myhome.comment.model.service;

import java.util.List;
import com.myhome.comment.model.CommentDto;


public interface CommentService  {

    List<CommentDto> findByBoardId(int boardId) throws Exception;

    void insertComment(CommentDto commentDto) throws Exception;

    void updateComment(CommentDto commentDto) throws Exception;

    void deleteComment(int id) throws Exception;
}
