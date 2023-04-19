package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.common.model.CommentView;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.CardView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;

@Service
public class TimelineBO {
	
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	
	@Autowired
	private CommentBO commentBO;
	
	// ******* 글로 적어서 원리를 알아내라! 이해해랏! 손으로 연습하고 !! 중요 중요 !! 
	public List<CardView> generateCardList() {  // 새로운 가공 객체를 만들때는 generate    // ** breakpoint
		List<CardView> cardViewList = new ArrayList<>();  // []
		
		// List<Post> getPostList()
		// 글 목록을 가져온다.  post list를 가져온다. 
		List<Post> postList = postBO.getPostList();
		
		
		// postList 반복문  
		// => 1:1  Post -> CardView  => cardViewList에 넣는다. (add)
		for(Post post : postList) {   // 0 1 2 
			CardView card = new CardView();  // 비어있는 네모 생성.
			
		
		// 글
		card.setPost(post);
			
	
		//  User getUserById(int id)
		// 글쓴이 정보
		User user = userBO.getUserById(post.getUserId());  // ** post에 유저 아이디 정보가 들어있어서.. (post.getUserId())
		card.setUser(user);
		
		
		// 댓글들
		List<CommentView> commentList = commentBO.generateCommentViewList(post.getId());
		card.setCommentList(commentList);
		
		
		//******!!!!! 카드 리스트에 채우기!!! ****!!!!
		cardViewList.add(card);
		
		
		}
	
		
		
		return cardViewList;
	}
}
