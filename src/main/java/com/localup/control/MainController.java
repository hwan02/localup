package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {
	@RequestMapping("test")
	public String test(String result2) {
		System.out.println(result2);
		return "test";
	}
}
