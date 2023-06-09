package com.sns.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sns.post.dao.PostMapper;

@Controller
public class TestController {
	
	
	@Autowired
	PostMapper postMapper;
	
	
	@ResponseBody
	@RequestMapping("/test1")
	public String test1() {
		return "Hello World";
	}
	
	
	@ResponseBody
	@RequestMapping("/test2")
	public Map<String, Object> test2() {
		Map<String, Object> map = new HashMap<>();
		map.put("a", 1);
		map.put("b", 1);
		map.put("c", 4);
		map.put("d", 3);
		return map;
	}
	
	
	
	 @RequestMapping("/test3")
	 public String test3() {
		 return "test/test";
	 }
	
	
//	@ResponseBody
//	@RequestMapping("/test4")
//	public List<Map<String, Object>> test4() {
//		return postMapper.selectPostList();
//	}
}
