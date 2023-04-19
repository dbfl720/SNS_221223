package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentMapper;
import com.sns.comment.model.Comment;
import com.sns.common.model.CommentView;

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
	
	
	// output: 가공된 댓글 리스트              input : postId    
	public List<CommentView> generateCommentViewList(int postId) {
		
		// 결과 리스트
		List<CommentView> commentViewList = new ArrayList<>();  
		
		// 글에 해당하는 댓글들 가져오기
		// List<Comment> => List<CommentView>
		List<Comment> commentList = commentMapper.selectCommentListByPostId(postId);   // ** breakpoint
		
		
		// 반복문 Comment => CommentView  => 결과 리스트에 담는다.
		for (Comment comment : commentList) {
			// Comment => CommentView
			CommentView commentView = new CommentView(); // 비어있음.
			
			
		}
		
		return commentViewList;
	}



	
	
	
}
