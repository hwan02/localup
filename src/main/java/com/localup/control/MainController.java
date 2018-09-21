package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

//import com.localup.domain.Location;

@Controller
public class MainController {
	
	@RequestMapping("main")
	public String main() {
		System.out.println("메인페이지 요청...");
		
		return "main/main";
	}
}
