package com.sns.like.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.like.dao.LikeMapper;

@Service
public class LikeBO {

	@Autowired
	private LikeMapper likeMapper;
	
	
	// select
	public void likeToggle(int userId, int postId) {
		// like 있는 확인
		int likeCount = likeMapper.selectLikeByUserIdPostId(userId, postId);
		if(likeCount > 0) { // 있으면 제거
			likeMapper.deleteLikeByUserIdPostId(userId, postId);
			
		} else {
			likeMapper.insertLike(userId, postId);
		}
		
	}
	
}
