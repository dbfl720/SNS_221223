package com.sns.timeline.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.CommentView;
import com.sns.post.bo.PostBO;
import com.sns.post.model.Post;
import com.sns.timeline.model.CardView;
import com.sns.user.bo.UserBO;
import com.sns.user.model.User;


//DB 연동 x 
@Service
public class TimelineBO {
	
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
	
	// CardView를 만드는 메소드. 
	// ******* 글로 적어서 원리를 알아내라! 이해해랏! 손으로 연습하고 !! 중요 중요 !! 
	public List<CardView> generateCardList() {  // 새로운 가공 객체를 만들때는 generate   
		
		List<CardView> cardViewList = new ArrayList<>();  // []    // ** breakpoint
		
		// List<Post> getPostList()
		// 글 목록을 가져온다.  post list를 가져온다. 
		List<Post> postList = postBO.getPostList();
		
		
		// postList 반복문 -  post를 이용해서 카드에 정보 담기.  
		// ****** 1:1로   Post를 -> CardView로 변환  => 최종적으로 cardViewList에 넣는다. (add)
		// Post => CardView 
		for(Post post : postList) {   // 0 1 2 
			CardView card = new CardView();  // 비어있는 카드 1개 생성.
				
		// 글
		card.setPost(post);  // post를 카드 에 넣는다. 
			
		//  User getUserById(int id)
		// 글쓴이 정보
		User user = userBO.getUserById(post.getUserId());  // **글쓴이 정보는 글 안에 들어있기 때문에 post.getId() ** post에 유저 아이디 정보가 들어있어서.. (post.getUserId())
		card.setUser(user);  // 지금 가져온 user정보를 카드에 넣는다. 
		
		// 댓글들 (여러개라 List) 
		List<CommentView> commentList = commentBO.generateCommentViewList(post.getId());   // 글번호에 해당하는 거 달라. : post.getId()
		card.setCommentList(commentList);
		
		//******!!!!! 카드 리스트에 채우기!!! ****!!!!
		cardViewList.add(card);
		
		}  // for 

		return cardViewList;
	} // List<CardView)
}
