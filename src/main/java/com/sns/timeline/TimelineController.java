package com.sns.timeline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	
	//localhost:8080/timeline/timeline_view
	@GetMapping("/timeline_view")
	public String timelineView(Model model, HttpSession session) {
		
		Integer userId = (Integer)session.getAttribute("userId");
		
		
		// select DB
		List<Post> postList = 
		
		model.addAttribute("postList", postList);
		model.addAttribute("view", "timeline/timeline");  // jsp - timeline폴더 - timeline.jsp 
		
		return "template/layout";
	}
	
	
}
