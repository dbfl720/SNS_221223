package com.sns.timeline.model;

import java.util.List;

import com.sns.comment.model.CommentView;
import com.sns.post.model.Post;
import com.sns.user.model.User;

// View용 객체  - db부화 막을 수 있음. - mvc modle 아님    // 즉, 가공하는 객체) // 데이터를 여기에 담음.
// 글 1개와 매핑됨, 즉 카드 하나 .
public class CardView {
		//  글 1개
		private Post post;  // post를 통으로 넣는다.
		
		
		// 글쓴이 정보
		private User user;      //user를 통으로 넣는다.
		
		
		
		// 댓글들 : *** 여러개 이기 때문에 List로 해야됨. !!!  // comment는 사용자 이름이 없기 때문에, CommentView객체가 필요함.
		private List<CommentView> commentList;

		
		// 좋아요 n개
		private int likeCount;  // 개수 int 
		
		
		
		// 내가(로그인 된 사람) 좋아요 한지 여부 boolean
		private boolean filledLike;  // 기본값 false 


		
		

		
		
		// 내가 following 한지 여부 boolean
		private boolean checkedFollowing;




		// following 개수
		private int FollowingCount;




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




		public int getLikeCount() {
			return likeCount;
		}




		public void setLikeCount(int likeCount) {
			this.likeCount = likeCount;
		}




		public boolean isFilledLike() {
			return filledLike;
		}




		public void setFilledLike(boolean filledLike) {
			this.filledLike = filledLike;
		}




		public boolean isCheckedFollowing() {
			return checkedFollowing;
		}




		public void setCheckedFollowing(boolean checkedFollowing) {
			this.checkedFollowing = checkedFollowing;
		}




		public int getFollowingCount() {
			return FollowingCount;
		}




		public void setFollowingCount(int followingCount) {
			FollowingCount = followingCount;
		}
		


		
		

		
		
		
		
		
		


		
		
		
		

		

		
		

		
		
		
		
		
		
}
