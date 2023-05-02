package com.sns.timeline;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sns.timeline.bo.TimelineBO;
import com.sns.timeline.model.CardView;

import jakarta.servlet.http.HttpSession;

@RequestMapping("/timeline")
@Controller
public class TimelineController {

	
	@Autowired
	private TimelineBO timelineBO;
	

	
	//localhost:8080/timeline/timeline_view
	@GetMapping("/timeline_view")
	public String timelineView(Model model, HttpSession session) { // session은 Controller에서 주로 만듬. / BO에서 안만듬.
		

		//List<Post> postList = postBO.getPostList();
		Integer userId = (Integer)session.getAttribute("userId"); // null 허용 - Integer
		List<CardView> cardList = timelineBO.generateCardList(userId); // 화면용 가공용은 view이름 쓸 것임.
		
		
		
		model.addAttribute("cardList", cardList);
		//model.addAttribute("postList", postList);
		model.addAttribute("view", "timeline/timeline");  // jsp - timeline폴더 - timeline.jsp 
		
		return "template/layout";
	}
	

}
