package com.sns.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.comment.model.Comment;

@Repository
public interface CommentMapper {

	// insert
	public int insertComment(
			@Param("content") String content,
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
	
	
	// select
	public List<Comment> selectCommentList();
}
