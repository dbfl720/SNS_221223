package com.sns.following.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.following.dao.FollowingMapper;

@Service
public class FollowingBO {

	@Autowired
	private FollowingMapper followingMapper;
	
	
	
	// insert
		public void followingToggle(int followingUserId, int followerUserId) {
			// like 있는지 확인
			int followingCount = followingMapper.selectFollowingCountByFollowingUserIdAndFollowerUserId(followingUserId, followerUserId);
			if(followingCount > 0) { // 있으면 제거
				followingMapper.deleteFollowingByFollowingUserIdAndFollowerUserId(followingUserId, followerUserId);
				
			} else {  // 없으면 추가
				followingMapper.insertFollowing(followingUserId, followerUserId);
			}
			
		}
	
	
	
	
	
	public boolean existFollowing(int followingUserId, Integer followerUserId) {
		// 비로그인
		if (followerUserId == null) {
			return false;
		}
	
		// 로그인 , 개수는 boolean이 될 수 없기 때문에 조건문 만들기. => 0보다 크면 ture.
		return followingMapper.selectFollowingCountByFollowingUserIdAndFollowerUserId(followingUserId, followerUserId) > 0; 
	}
	
	
	
	// select
		public int getFollowingCountByFollowingUserId(int followingUserId) {  // 개수 리턴 int 
			return followingMapper.selectFollowingCountByFollowingUserIdAndFollowerUserId(followingUserId, null);
			
		}

		
		
		
		// delete
		public int deleteFollowingByFollowingUserIdAndFollowerUserId (
				int followingUserId, int followerUserId) {
			return followingMapper.deleteFollowingByFollowingUserIdAndFollowerUserId(followingUserId, followerUserId);
		}
}
