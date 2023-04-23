package com.sns.like;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sns.like.bo.LikeBO;

import jakarta.servlet.http.HttpSession;


// like table에 가는 것 이기 때문에 LikeRestController 만듬
@RestController
public class LikeRestController {
	
	
	@Autowired
	private LikeBO likeBO;
	
	
	
	//  GET :  /like?postId=13      @RequestParam으로 받기.
	//  GET or POST: /like/13       @PathVariable으로 받기. (와일드카드)
	@RequestMapping("/like/{postId}") // 어떤 메소드도 허용. get, post
	public Map<String, Object> like(
			@PathVariable int postId,
			HttpSession session) {
		
		Map<String, Object> result = new HashMap<>();
		
		// 로그인 여부 체크
		Integer userId = (Integer)session.getAttribute("userId"); // null 허용 - Integer
		if (userId == null) {
			result.put("code", 300);
			result.put("errorMessage", "로그인 후 사용 가능합니다.");
			return result;
		}
		
		// BO 호출  => BO안에서 like 여부 체크 
		likeBO.likeToggle(userId, postId);
		
		
		// 응답
			result.put("code", 1);
			result.put("result", "성공");
		return result;
	}
}
