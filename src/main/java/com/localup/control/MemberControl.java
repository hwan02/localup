package com.localup.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberControl {
	
	@RequestMapping("login")
	public String login() {
		System.out.println("로그인페이지 요청...");
		
		return "login/login";
	}
	
	@RequestMapping("member")
	public String member() {
		System.out.println("회원가입 페이지 요청...");
		
		return "login/member";
	}
	
	@RequestMapping("find")
	public String find() {
		System.out.println("아이디 비빌먼호 찾기 페이지 요청...");
		
		return "login/find";
	}
}
