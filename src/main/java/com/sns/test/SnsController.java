package com.sns.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SnsController {
	
	 @RequestMapping("/sns/login_view")
	 public String test3() {
		 return "sns/sns";
	 }
}
