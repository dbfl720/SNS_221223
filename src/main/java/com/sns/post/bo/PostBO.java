package com.sns.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.comment.bo.CommentBO;
import com.sns.comment.model.Comment;
import com.sns.common.FileManagerService;
import com.sns.like.bo.LikeBO;
import com.sns.post.dao.PostMapper;
import com.sns.post.model.Post;
import com.sns.user.bo.UserBO;

@Service
public class PostBO {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	@Autowired
	private PostMapper postMapper;

	@Autowired
	private FileManagerService fileManager;

	@Autowired
	private LikeBO likeBO;

	@Autowired
	private CommentBO commentBO;
	
	


	// insert
	public int addPost(int userId, String userLoginId, String content, MultipartFile file) {

		String imagePath = null;
		if (file != null) {
			imagePath = fileManager.saveFile(userLoginId, file); // ** breakpoint
		}

		return postMapper.insertPost(userId, content, imagePath);
	}

	
	
	// select
	public List<Post> getPostList() {
		return postMapper.selectPostList();
	}

	
	
	// output : 삭제된 행 개수 (int) intput: postId, userId, (like, comment, file)
	// delete
	public int deletePostByPostIdUserId(
			int postId, int userId) {
		// db 글삭제...
		// 좋아요, 댓글, 사진 ...
		
		
		
		// 기존글 가져오기.
		Post post = getPostByPostIdUserId( postId, userId);
		if (post == null) {
			logger.error("[delete post] postId:{}, userId:{}", postId, userId);
			return 0;
		}
		
		// 댓글
		commentBO.deleteCommentByPost(postId);
		
		
		// 좋아요
		likeBO.deleteLikeByUserIdPostId(postId, userId);

		
		// 사진
		fileManager.deleteFile(post.getImagePath());
	
		

		
		return postMapper.deletePostByPostIdUserId(postId, userId);
	}
	
	
	
	
	// select
	public Post getPostByPostIdUserId(int postId, int userId) {
		return postMapper.selectPostByPostIdUserId(postId, userId);
	}
	
	
	
	
	
}
