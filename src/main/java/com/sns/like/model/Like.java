package com.sns.like.model;

import java.util.Date;

public class Like {

	private int postId;
	private int userId;
	private Date careatedAt;
	
	
	
	public int getPostId() {
		return postId;
	}
	public void setPostId(int postId) {
		this.postId = postId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Date getCareatedAt() {
		return careatedAt;
	}
	public void setCareatedAt(Date careatedAt) {
		this.careatedAt = careatedAt;
	}
	
	
}
