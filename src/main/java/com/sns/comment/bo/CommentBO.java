package com.sns.comment.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentMapper;
import com.sns.comment.model.Comment;

@Service
public class CommentBO {
	
	
	@Autowired
	private CommentMapper commentMapper;
	
	
	// insert
	public int addComment(
			String content, int postId,
			int userId) {
		
		return commentMapper.insertComment(content, postId, userId);
	}
	
	
	// select
	public List<Comment> getCommentList() {
		return commentMapper.selectCommentList();
	}
	
}
