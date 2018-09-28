package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("guide")
public class GuideController {
	
	//가이드 상세 페이지 (작성자 : rys)
	//가이드 상세 페이지 폼 보기
	@RequestMapping("guideDetailPage")
	public String guideDetailPage() {
		return "board/guide";
	}
	
}
