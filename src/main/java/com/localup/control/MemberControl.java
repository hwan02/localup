package com.localup.control;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.domain.MemberVO;
import com.localup.service.MemberService_sign;
import com.localup.domain.EmailForm;

//이메일 발송을 위한 계정
//ID : localup.signup@gmail.com
//PW : localup.signup.pw

@Controller
public class MemberControl {

	@Autowired
	private JavaMailSender mailSender;
	
	@Inject
	MemberService_sign memberService_sign;
	
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		System.out.println("로그아웃 요청...");
		
		return "redirect:login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public String login() {
		System.out.println("로그인페이지 요청...");
		
		return "login/login";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String signin(HttpServletRequest request, Model model) {
		System.out.println("로그인 요청...");
		
		try {
			if(!memberService_sign.signin(request.getParameter("id"), request.getParameter("pw"))) {
				model.addAttribute("login_result", "fail");
				return "login/login";
			}
		} catch (Exception e) {
			// 로그인 에러 발생
			//e.printStackTrace();
		}
		
		request.getSession().setAttribute("login", true);
		request.getSession().setAttribute("member_email", request.getParameter("id"));
		return "redirect:index";
	}
	
	@RequestMapping("findEmail")
	public String findEmail(HttpServletRequest request, Model model) {
		System.out.println("이메일 찾기 요청...");
	
		try {
			model.addAttribute("id", memberService_sign.findEmail(request.getParameter("name"), request.getParameter("phone")));
		} catch (Exception e) {
			//이메일 찾기 에러 발생
			//e.printStackTrace();
		}
		
		return "login/idResult";
	}
	
	@RequestMapping("findPw")
	public String findPw(HttpServletRequest request, Model model) {
		System.out.println("비밀번호 찾기 요청...");
		
		String member_email = request.getParameter("id");
		String temp_pw = ""; //임시비밀번호
		
		//임시비밀번호 생성
		String str = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		Random random = new Random();
		int size = 0;
		while(size < 10) size = random.nextInt(16); //10~15자리
		for(int i=0; i<size; i++) {
			int idx = random.nextInt(str.length());
			temp_pw += str.charAt(idx);
		}
		
		try {
			if(memberService_sign.update_pw(request.getParameter("name"), member_email, temp_pw) > 0) {
				EmailForm form = new EmailForm();
				form.setReceiver(member_email);
				form.setSubject("로컬업 임시비밀번호");
				form.setContent("로컬업 임시비밀번호입니다. \n"
						   +"[ "+temp_pw+" ]"
						   +"\n로그인 후 비밀번호를 변경해주세요.");
				sendEmail(form);
				model.addAttribute("id", "회원님의 이메일로 임시 비밀번호를 발송하였습니다");
			}
		} catch(Exception e) {
			//e.printStackTrace();
		}
		
		return "login/idResult";
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
			memberService_sign.insert(memberVO);
		} catch (Exception e) {
			// 회원 등록 실패(이미 사용중인 이메일)
			//e.printStackTrace();
			return "login/member_fail";
		}
		
		try {
			sendEmail(form);
		} catch (Exception e) {
			// 메일 발송 실패
			//e.printStackTrace();
			return "login/member_fail";
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
			//코드를 두자리씩 끊어서 16진수로 변환 -> 각각에 이메일 길이값 만큼 빼주기 -> 하나의 이메일로 묶기3
		}
		
		try {
			if(memberService_sign.update_state(member_eamil, 1) < 1) { // 0:이메일 인증 전, 1:이메일 인증 후
				// 이메일이 등록되어 있지 않음
				return "login/member_fail";
			}
		} catch (Exception e) {
			// 이메일 인증 실패
			//e.printStackTrace();
			return "login/member_fail";
		}
		request.setAttribute("member_eamil", member_eamil);
		
		return "login/member_success";
	}
	
	//메일 발송 기능 제공
	public void sendEmail(EmailForm emailFomr) throws Exception{
		MimeMessage msg = mailSender.createMimeMessage();
		msg.setSubject(emailFomr.getSubject()); //메일 제목
		msg.setText(emailFomr.getContent());
		msg.setRecipient(RecipientType.TO, new InternetAddress(emailFomr.getReceiver()));
		mailSender.send(msg);
	}
}
