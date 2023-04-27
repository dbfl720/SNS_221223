package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.sns.common.FileManagerService;
import com.sns.post.dao.PostMapper;
import com.sns.user.dao.UserMapper;
import com.sns.user.model.User;

@Service
public class UserBO {
	
	@Autowired UserMapper userMapper;
	
	@Autowired
	private FileManagerService fileManager;
	
	public User getUserByLoginId(String loginId) {
		return userMapper.selectUserByLoginId(loginId);
	}
	
	
	// insert
	public int addUser(
			String loginId, String password,
			String name, String email) {
		
		return userMapper.insertUser(loginId, password, name, email);
	}
	
	
	// select
	public User getUserByLoginIdPassword(String loginId, String password) {
		return userMapper.selectUserByLoginIdPassword(loginId, password);
	}
		
		
		
	public User getUserById(int id) {  // 필수값 int   // 1명의 User 가져온다. - User 
		return userMapper.selectUserById(id);
	}

	
	// update
	public int updateProfileUser(int userId, String userLoginId, MultipartFile file) {
		
		// 기존 프로필사진 가져오기.
		User user = getUserById(userId);
		
		
		String profileImagePath = null;
		if (file != null) {
			profileImagePath = fileManager.saveFile(userLoginId, file); // ** breakpoint
		}
		
		// 성공여부 체크 후 기존 이미지 제거 
		// -- imagePath가 null이 아닐 때 (성공) 그리고 기존 이미지가 있을 때 => 기존 이미지 삭제
		if (profileImagePath != null && user.getProfileImagePath() != null) {
			// 이미지 제거
			fileManager.deleteFile(user.getProfileImagePath()); // ** 기존 이미지  - post.getImagePaht() // x - imagePath (새로운 이미지)
		}
		
		return userMapper.updateProfileUser( profileImagePath);
	}

	
}
