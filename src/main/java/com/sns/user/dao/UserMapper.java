package com.sns.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.sns.user.model.User;

@Repository
public interface UserMapper {
	
	public User selectUserByLoginId(String loginId);
	
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email);
	
	
	public User selectUserByLoginIdPassword(
			@Param("loginId") String loginId,
			@Param("password") String password);
	
	
	
	public User selectUserById(int id);
	
	
	public int updateProfileUser(
			@Param("id") int userId,
			@Param("profileImagePath") String profileImagePath);
	
}
