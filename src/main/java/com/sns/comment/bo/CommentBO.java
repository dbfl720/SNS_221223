package com.sns.comment.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.dao.CommentMapper;
import com.sns.comment.model.Comment;
import com.sns.comment.model.CommentView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class CommentBO {
	
	
	@Autowired
	private CommentMapper commentMapper;
	
	
	@Autowired
	private UserBO userBO;

	
	// insert
	public int addComment(
			String content, int postId,
			int userId) {
		
		return commentMapper.insertComment(content, postId, userId);
	}
	
	
	// ** 댓글쓴이(사용자 이름)을 알기 위해 하는 것임.
	// DB와 연동 O
	// 글에 해당하는 댓글들만 가져오기. 
	// output: 가공된 댓글 리스트              input : postId    
	public List<CommentView> generateCommentViewList(int postId) {
		
		// 결과 리스트 - 결과적으로 글에 해당하는 댓글들(한개가 아닌 여러개)을 TimelineController에 전달해야 하기 때문에 List임.
		List<CommentView> commentViewList = new ArrayList<>();  
		
		// 글에 해당하는 댓글들 가져오기 , db에서 가져오기 .
		// List<Comment> => List<CommentView>
		List<Comment> commentList = commentMapper.selectCommentListByPostId(postId);   // ** breakpoint
		
		
		// 반복문 Comment => CommentView  => 결과 리스트에 담는다.
		for (Comment comment : commentList) {
			// Comment => CommentView
			CommentView commentView = new CommentView(); // 비어있음.
			
			
			// ** CommentView 클래스의 필드 수만큼 똑같이 세팅.  
			// 댓글
			commentView.setComment(comment);
			
			// 댓글쓴이 
			User user = userBO.getUserById(comment.getUserId()); // comment에 해당하는 유저 아이디 
			commentView.setUser(user);
			
			commentViewList.add(commentView);
			
			
			
		}
		
		return commentViewList;
	}



	
	
	
}
