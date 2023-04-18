package com.sns.comment.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentMapper;

@Service
public class CommentBO {
	
	
	@Autowired
	private CommentMapper commentMapper;
	
	
	// insert
	public int addComment(
			String content, int userId,
			int postId) {
		
		return commentMapper.insertComment(content, userId, postId);
	}
	
}
