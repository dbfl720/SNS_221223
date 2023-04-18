package com.sns.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sns.post.model.Post;

@Repository
public interface PostMapper {

		// public List<Map<String, Object>> selectPostList();
	
	// insert
	public int insertPost (
			@Param("userId") int userId,
			@Param("content") String content,
			@Param("imagePath") String imagePath);
	
	
	
	
	// select
	public List<Post> selectPostList();
}




