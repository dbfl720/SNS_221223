package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeMapper;

@Service
public class LikeBO {

	@Autowired
	private LikeMapper likeMapper;
	
	
	// select - 좋아요 삭제,추가 
	public void likeToggle(int userId, int postId) {
		// like 있는지 확인
		int likeCount = likeMapper.selectLikeCountByPostIdOrUserId(postId, userId);
		if(likeCount > 0) { // 있으면 제거
			likeMapper.deleteLikeByUserIdPostId(postId, userId);
			
		} else {  // 없으면 추가
			likeMapper.insertLike(userId, postId);
		}
		
	}
	
	// select - 좋아요 true,false 체크 
//	public boolean checkLike (Integer userId, Integer postId) {  // null 일수 있어서 Integer.
//		boolean checkLike = likeMapper.selectCheckLike(userId, postId);   // breakpoint **
//		return checkLike;
//	}
	
	
	public boolean existLike(int postId, Integer userId) { //postId - null이면 안되서 int, userId - null 이라서 Integer
		// 비로그인
		if (userId == null) {
			return false;
		}
	
		// 로그인 , 개수는 boolean이 될 수 없기 때문에 조건문 만들기. => 0보다 크면 ture.
		return likeMapper.selectLikeCountByPostIdOrUserId(postId, userId) > 0;     //// 순서 중요. userId, postId  - LikeMapper랑 파라미터 순서 매치!
		
	}
	
	
	// select
	public int getLikeCountByPostId (int postId) {  // 개수 리턴 int 
		return likeMapper.selectLikeCountByPostIdOrUserId(postId, null);
		
	}
	
	
	// delete
	public int deleteLikeByUserIdPostId (
			int postId, int userId) {
		return likeMapper.deleteLikeByUserIdPostId(postId, userId);
	}
	

}
