package com.sns.like.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface LikeMapper {

	// select
	public int selectLikeByUserIdPostId(
			@Param("userId")int userId,
			@Param("postId")int postId);
	
	
	// insert
	public int insertLike(
			@Param("userId")int userId,
			@Param("postId")int postId);
	
	// delete
	public void deleteLikeByUserIdPostId(
			@Param("userId")int userId,
			@Param("postId")int postId);
}
