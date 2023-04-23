package com.sns.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.like.model.Like;

@Repository
public interface LikeMapper {

	// select
	public int selectLikeCountByUserIdPostId(
			@Param("userId")int userId,
			@Param("postId")int postId);
	
	
	// insert
	public void insertLike(
			@Param("userId")int userId,
			@Param("postId")int postId);
	
	// delete
	public void deleteLikeByUserIdPostId(
			@Param("userId")int userId,
			@Param("postId")int postId);
	
	
	// select
	public boolean checkLike (
			@Param("userId")Integer userId,
			@Param("postId")Integer postId);
	
	// select
	public int likeCount (
			@Param("postId")Integer postId);
	
}
