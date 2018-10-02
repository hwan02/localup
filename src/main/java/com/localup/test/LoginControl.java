package com.localup.test;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;

@Controller
public class LoginControl {
	
	@Inject
	private UserService userService;
	
	// 로그인 입력폼
	//@RequestMapping(value="login", method=RequestMethod.GET)
	public String loginGET() throws Exception {
		return "test/login";
	}//loginGET

	// 로그인 처리
	//@RequestMapping(value="login", method=RequestMethod.POST)
	public String loginPOST(UserVO userVO) throws Exception {
		userService.login(userVO);
		return "Redirect:test/success2";
	}//loginPOST
	
	
	// 로그인 성공폼
	//@RequestMapping("success2")
	public String success2() throws Exception {
		return "test/success2";
	}//success2
}// main
