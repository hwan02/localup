package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("main")
	public String test() {
		System.out.println("메인페이지 요청...");
		
		return "main/main";
	}
}
