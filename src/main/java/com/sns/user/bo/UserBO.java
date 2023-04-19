package com.sns.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sns.user.dao.UserMapper;
import com.sns.user.model.User;

@Service
public class UserBO {
	
	@Autowired UserMapper userMapper;
	
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
		
		
		
	public User getUserById(int id) {  // 필수값 int 
		return userMapper.selectUserById(id);
	}
}
