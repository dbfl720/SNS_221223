package com.sns.like.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeMapper;
import com.sns.like.model.Like;

@Service
public class LikeBO {

	@Autowired
	private LikeMapper likeMapper;
	
	
	// select - 좋아요 삭제,추가 
	public void likeToggle(int userId, int postId) {
		// like 있는지 확인
		int likeCount = likeMapper.selectLikeCountByUserIdPostId(userId, postId);
		if(likeCount > 0) { // 있으면 제거
			likeMapper.deleteLikeByUserIdPostId(userId, postId);
			
		} else {  // 없으면 추가
			likeMapper.insertLike(userId, postId);
		}
		
	}
	
	// select - 좋아요 true,false 체크 
	public boolean checkLike (Integer userId, Integer postId) {  // null 일수 있어서 Integer.
		boolean checkLike = likeMapper.selectCheckLike(userId, postId);
		return checkLike;
	}
	
	
	// select
	public Integer likeCount ( Integer postId) {
		Integer likeCount = likeMapper.selectLikeCount( postId);
		return likeCount;
	}
	
	
	
	
	
}
