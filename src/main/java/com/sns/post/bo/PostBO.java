package com.sns.post.bo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.comment.bo.CommentBO;
import com.sns.common.FileManagerService;
import com.sns.like.bo.LikeBO;
import com.sns.post.dao.PostMapper;
import com.sns.post.model.Post;
import com.sns.user.bo.UserBO;

@Service
public class PostBO {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private PostBO postBO;
	
	@Autowired
	private PostMapper postMapper;

	@Autowired
	private FileManagerService fileManager;

	@Autowired
	private LikeBO likeBO;

	@Autowired
	private CommentBO commentBO;
	
	
	@Autowired
	private UserBO userBO;

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
		
		// 기존 글 가져온다.
		List<Post> post = getPostList();
		if (post == null) {  // **실무에서는 null체크 필수임..
			logger.warn("[글 삭제] post is null. postId:{}, userId:{}", postId, userId); // 에러 메시지 쌓아둬서 에러사이트에서 보는 방법. 와일드 카드.
			return 0; // 메소드 종료.
		}
		
		// 댓글
		commentBO.generateCommentViewList(postId);
		
		// 좋아요
		likeBO.getLikeCountByPostId(postId);
		
		// 사진
		fileManager.deleteFile(post.getImagePath());
		
		return postMapper.deletePostByPostIdUserId(postId, userId);
	}
	
	
}
