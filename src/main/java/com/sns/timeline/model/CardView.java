package com.sns.timeline.model;

import java.util.List;

import com.sns.comment.model.CommentView;
import com.sns.post.model.Post;
import com.sns.user.model.User;

// View용 객체  - db부화 막을 수 있음. - mvc modle 아님    // dto라고 생각해라 (즉, 가공하는 객체) // 데이터를 여기에 담음.
// 글 1개와 매핑됨, 즉 카드 하나 .
public class CardView {
		//  글 1개
		private Post post;  // post를 통으로 넣는다.
		
		
		// 글쓴이 정보
		private User user;      //user를 통으로 넣는다.
		
		
		
		// 댓글들 : *** 여러개 이기 때문에 List로 해야됨. !!!  // comment는 사용자 이름이 없기 때문에, CommentView객체가 필요함.
		private List<CommentView> commentList;

		
		// 좋아요 n개
		
		
		// 내가(로그인 된 사람) 좋아요 한지 여부 boolean


		public Post getPost() {
			return post;
		}



		public void setPost(Post post) {
			this.post = post;
		}



		public User getUser() {
			return user;
		}



		public void setUser(User user) {
			this.user = user;
		}



		public List<CommentView> getCommentList() {
			return commentList;
		}



		public void setCommentList(List<CommentView> commentList) {
			this.commentList = commentList;
		}
		
		


		
		
		
		
		
		
		
}
