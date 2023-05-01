package com.sns.following.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FollowingMapper {

	
	// select
	public int selectFollowingCountByFollowingUserIdAndFollowerUserId(
			@Param("followingUserId")int followingUserId,
			@Param("followerUserId")Integer followerUserId);
	
	
	// delete
	public int deleteFollowingByFollowingUserIdAndFollowerUserId (
			@Param("followingUserId")int followingUserId,
			@Param("followerUserId")int followerUserId);
			
			
	
	// insert
	public void insertFollowing(
			@Param("followingUserId")int followingUserId,
			@Param("followerUserId")int followerUserId);
	
}
