package com.localup.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localup.domain.MemberVO;
import com.localup.service.BoardService;
import com.localup.service.MemberService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Inject
	MemberService memberService;
	
//	@Inject
//	BoardService boardService;
	
	//회원정보 수정(작성자 : rys)
	//회원정보 수정폼
	@RequestMapping(value="myUpdate", method=RequestMethod.GET)
	public String myUpdateGET(Model model,String member_email)throws Exception{
		model.addAttribute("memberVO",memberService.read(member_email));
		return "my/myUpdate";	
	}
	
	//회원정보 DB수정
	@RequestMapping(value="myUpdate", method=RequestMethod.POST)
	public String myUpdatePOST(MemberVO memberVO)throws Exception{
		memberService.update(memberVO);		//수정작업
		return "redirect:myUpdate";		//수정작업확인	
	}
	
	//회원 탈퇴시 ==이동==> 메인페이지
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String delete(@RequestParam("member_email") String member_email) throws Exception{
		memberService.delete(member_email);
		return "redirect:/member/main";
	}
	
	//메인 가상 경로 : pull 한후 메인 컨트롤러에 main.jsp 가는 경로가 없으므로 생성함
	@RequestMapping(value="main", method=RequestMethod.GET)
	public String main() throws Exception{
		return "main/main";
	}
	
	//사용자정보 페이지 폼 보기
	/*@RequestMapping("mInfo")
	public String mInfoGET(Model model,String member_id_guide1) throws Exception {
		//model.addAttribute("memberVO",memberService.read(member_email));
		//model.addAttribute("boardVO",boardService.BoarRead(board_no));
		return"board/mInfo";
	}*/
	
	//사용자 정보페이지 레벨 보이기(작성:yr)
	@RequestMapping("mInfo")
	public String mInfoGET(Model model,String member_email) throws Exception {
		System.out.println("member_email>>"+member_email);
		model.addAttribute("memberVO",memberService.read(member_email));
		//model.addAttribute("member_email",member_email);
		model.addAttribute("myLevel",memberService.readLevel(member_email));
		model.addAttribute("boardList",memberService.listIdBoard(member_email));
		return"board/mInfo";
	}
	
	//위의 사용자정보 페이지 레벨 테스트용
	/*@RequestMapping("mInfotest")
	public String mInfoGET2(Model model,String member_email) throws Exception {
		System.out.println("member_email>>"+member_email);
		model.addAttribute("member_email",member_email);
		model.addAttribute("myLevel",memberService.readLevel(member_email));
		return"test/levelTest";
	}*/
	
}
