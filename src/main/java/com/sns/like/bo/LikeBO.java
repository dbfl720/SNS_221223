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
	
	
	// select
	public void likeToggle(int userId, int postId) {
		// like 있는지 확인
		int likeCount = likeMapper.selectLikeCountByUserIdPostId(userId, postId);
		if(likeCount > 0) { // 있으면 제거
			likeMapper.deleteLikeByUserIdPostId(userId, postId);
			
		} else {  // 없으면 추가
			likeMapper.insertLike(userId, postId);
		}
		
	}
	
	// select
	public boolean checkLike (Integer userId, Integer postId) {
		boolean checkLike = likeMapper.checkLike(userId, postId);
		return checkLike;
	}
	
	
	// select
	public Integer likeCount ( Integer postId) {
		Integer likeCount = likeMapper.likeCount( postId);
		return likeCount;
	}
	
	
	
	
	
}
