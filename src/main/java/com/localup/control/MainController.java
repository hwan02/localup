package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.localup.domain.Location;

@Controller
@RequestMapping("main")
public class MainController {
	@RequestMapping("test")
	public String test() {
		return "test";
	}
	@RequestMapping("location")
	public String loc(Location loc, Model model) {
		return "jsp/test";
	}
}
