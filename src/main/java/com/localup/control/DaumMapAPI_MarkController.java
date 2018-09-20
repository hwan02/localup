package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DaumMapAPI_MarkController {
	
	@RequestMapping("markercreate")
	public String markercreate() {
		return "test/daumMapAPI/markerCreate2";
	}

	//카카오 로그인 버튼
	@RequestMapping("kakaoLogin")
	public String kakaoLogin() {
		return "test/kakaoLogin/login";
	}
}
