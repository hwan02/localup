package com.localup.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.domain.MemberVO;
import com.localup.service.MemberService;

@Controller
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	//회원정보 수정폼
	@RequestMapping(value="myUpdate", method=RequestMethod.GET)
	public String myUpdateGET(Model model,String member_email)throws Exception{
		model.addAttribute("memberVO",memberService.read(member_email));
		return "memberUpdate/myUpdate";	
	}
	
	//회원정보 DB수정
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public String myUpdatePOST(MemberVO memberVO)throws Exception{
		memberService.update(memberVO);		//수정작업
		return "redirect:myUpdate";		//수정작업확인	
	}
	
//	//목록요청 처리
//	@RequestMapping("updateCheck")
//	public String listAll(Model model) throws Exception{
//		
//		//컨트롤러 영역에서 조회된 결과를 영역저장 - 뷰와 공유
//		model.addAttribute("listAll",memberService.listAll()); 
//		return "memberUpdate/myUpdateCheck";
//	}

	//목록요청 처리
	@RequestMapping("updateCheck")
	public String read(String member_email,Model model) throws Exception{
		
		//컨트롤러 영역에서 조회된 결과를 영역저장 - 뷰와 공유
		model.addAttribute("memberVO",memberService.read(member_email)); 
		return "memberUpdate/myUpdateCheck";
	}
	

}
