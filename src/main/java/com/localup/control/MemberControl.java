package com.localup.control;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.domain.MemberVO;
import com.localup.test.EmailForm;
import com.localup.test.EmailSender;
import com.localup.test.EmailService;

//이메일 발송을 위한 계정
//ID : localup.signup@gmail.com
//PW : localup.signup.pw

@Controller
public class MemberControl {
	
	@Inject
	private EmailService emailService;
	
	@Autowired
	private EmailSender emailSender;
	
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
	
	@RequestMapping(value="member/wait", method=RequestMethod.POST)
	public String member_wait(MemberVO memberVO) {
		EmailForm form = new EmailForm();
		form.setReceiver(memberVO.getMember_email());
		form.setSubject("로컬업 이메일 인증");
		
		/* 이메일 코드화 */
		String member_email = memberVO.getMember_email();
		char[] email = member_email.toCharArray();
		String code = "";
		for(int i=0; i<email.length; i++) {
			code += Integer.toHexString((int)email[i]+member_email.length());
			//이메일의 각 문자를 16진수로 변환 -> 각각에 이메일 길이값만큼 더해주기 -> 하나의 코드로 묶기
		}
		
		form.setContent("로컬업 이메일 인증을 위한 링크입니다.\n"
					   +"http://localhost/member/success?code="+code
					   +"\n링크를 클릭하여 회원가입을 완료하세요.");
		try {
			emailSender.sendEmail(form);
		} catch (Exception e) {
			// 메일 발송 실패
			e.printStackTrace();
		}
		System.out.println("회원가입 대기 페이지 요청...");
		System.out.println(memberVO);
		
		return "login/member_wait";
	}
	
	@RequestMapping(value="member/success", method=RequestMethod.GET)
	public String member_success(HttpServletRequest request) {
		System.out.println("회원가입 완료 페이지 요청...");
		
		/* 코드 해독 */
		String code =  request.getParameter("code");
		String member_eamil = "";
		for(int i=0; i<code.length()-1; i+=2) {
			member_eamil += (char)((Integer.parseInt(code.substring(i, i+2),16))-code.length()/2);
			//코드를 두자리씩 끊어서 16진수로 변환 -> 각각에 이메일 길이값 만큼 빼주기 -> 하나의 이메일로 묶기
		}
		
		request.setAttribute("member_eamil", member_eamil);
		
		return "login/member_success";
	}
}
