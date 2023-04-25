package com.sns.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;

@Repository
public interface CommentMapper {

	// insert
	public int insertComment(
			@Param("content") String content,
			@Param("postId") int postId,
			@Param("userId") int userId);
	
	
	
	
	// select
	public List<Comment> selectCommentListByPostId(int postId);  // db에서 가져오는 것이기 때문에 테이블과 매핑되는 Comment로 써라. 


	


	
	// delete
		public int deleteComment( int commentId);
		
		
}
