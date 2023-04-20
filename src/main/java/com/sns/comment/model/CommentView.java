package com.sns.comment.model;

import com.sns.user.model.User;


// comment는 사용자 이름이 없기 때문에, CommentView객체가 필요함.
// ** 댓글 하나  // 모든 클래스들은 하나의 객체를 만드는 것.
public class CommentView {
	// 댓글 하나
	private Comment comment;
	
	
	// 댓글쓴이 - 이걸로 사용자 이름 알 수 있음. ??
	private User user;
	
	


	public Comment getComment() {
		return comment;
	}


	public void setComment(Comment comment) {
		this.comment = comment;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}
	
	
}
