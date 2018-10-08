package com.localup.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MoalTest {
	
	@RequestMapping("modal")
	public String modal() {
		return"test/Modal/modal_TEST";
	}
}
