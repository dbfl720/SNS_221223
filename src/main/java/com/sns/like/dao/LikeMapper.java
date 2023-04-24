package com.sns.like.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.like.model.Like;


//Control + alt + h => call Hierarchy  불러서 체크 .  
@Repository
public interface LikeMapper {

	// select
	public int selectLikeCountByUserIdPostId(  // 순서 중요. userId, postId 
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
	
	
	// select - 안써도 됨. 위에 select 이용.
	public boolean selectCheckLike (
			@Param("userId")Integer userId,
			@Param("postId")Integer postId);
	
	// select
	public int selectLikeCountByPostId (int postId);
	
	
	// select  // xml과 순서 중요. 체크해야됨. postId, userId
	public int selectLikeCountByPostIdOrUserId(
			@Param("postId")int postId,
			@Param("userId")Integer userId);
	
}
