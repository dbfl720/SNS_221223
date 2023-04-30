package com.sns.following;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.following.bo.FollowingBO;

import jakarta.servlet.http.HttpSession;

@RestController
public class FollowingRestController {
	
	@Autowired
	private FollowingBO followingBO;
	
	
	@RequestMapping("/following/{followingUserId}")
	public Map<String, Object> follwoing(
			@PathVariable int followingUserId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
	
		
		// 로그인 여부 체크
		Integer followerUserId = (Integer)session.getAttribute("userId"); // null 허용 - Integer
		if (followerUserId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인 후 사용 가능합니다.");
			return result;
		}
		
		
		// BO 호출 => 
		followingBO.followingToggle(followingUserId, followerUserId);
		
		
		// 응답
				result.put("code", 1);
				result.put("result", "성공");
				return result;
	}
	
}
