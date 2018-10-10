package com.localup.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Window {
	
	@RequestMapping("open")
	public String open() {
		return "test/windowOPENandCLOSE/open";
	}

	@RequestMapping("close")
	public String close() {
		return "test/windowOPENandCLOSE/close";
	}
}
