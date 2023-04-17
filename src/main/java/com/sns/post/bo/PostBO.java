package com.sns.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.post.dao.PostMapper;

@Service
public class PostBO {

	
	@Autowired 
	private PostMapper postMapper;
	
	// insert
	public int addPost(
			int userId, String userLoginId,
			String content, MultipartFile file) {
		
			String imagePath = null;
			if (file != null) {
			
			}
			
			return postMapper.insertPost(userId, content, imagePath);
	}
}
