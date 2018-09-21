package com.localup.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localup.domain.MemberVO;
import com.localup.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
	//회원정보 수정폼
	@RequestMapping(value="myUpdate", method=RequestMethod.GET)
	public String myUpdateGET(Model model,String member_email)throws Exception{
		model.addAttribute("memberVO",memberService.read(member_email));
		return "myUpdate/myUpdate";	
	}
	
	//회원정보 DB수정
	@RequestMapping(value="myUpdate", method=RequestMethod.POST)
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
		return "myUpdate/myUpdateCheck";
	}
	
	//회원탈퇴
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(@RequestParam("member_email") String member_email, RedirectAttributes rttr) throws Exception{
		memberService.delete(member_email);
		rttr.addFlashAttribute("msg","SUCCESS");
		return "redirect:/member/main";
	}
	
	//메인 가상 경로 : pull 한후 메인 컨트롤러에 main.jsp 가는 경로가 없으므로 생성함
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() throws Exception{
		return "main/main";
	}
}
