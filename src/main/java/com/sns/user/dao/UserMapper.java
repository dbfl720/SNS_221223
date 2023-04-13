package com.sns.user.dao;

import org.springframework.stereotype.Repository;

import com.sns.user.model.User;

@Repository
public interface UserMapper {
	
	public User selectUserById(String loginId);
}
