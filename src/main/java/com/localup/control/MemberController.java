package com.localup.control;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.localup.domain.Criteria;
import com.localup.domain.MemberVO;
import com.localup.domain.PageMaker;
import com.localup.domain.SubVO;
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
	
	//사용자 정보페이지 보이기(작성:yr)
	@RequestMapping(value="mInfo",method=RequestMethod.GET)
	//public String mInfoGET(Model model,String member_email, SubVO subVO, HttpSession session) throws Exception {
	public String mInfoGET(Model model, SubVO subVO, HttpSession session) throws Exception {
		String sub_guide = subVO.getMember_email_guide();
		//memberService.subCheck(member_email_sub, member_email_guide)
		int subInfo = memberService.subCheck(subVO.getMember_email_sub(), sub_guide);
		
		System.out.println("subInfo>>>>"+subInfo);
		
		//subInfo=1이라면 이미 팔로워  subInfo=0이라면 아직 팔로워하지 않았음
		if(subInfo==0) {
			model.addAttribute("subInfo", "enable");			
		}else {
			model.addAttribute("subInfo", "disable");			
		}
		
		System.out.println("member_email>>"+sub_guide);
		model.addAttribute("memberVO",memberService.read(sub_guide));
		//model.addAttribute("member_email",member_email);
		model.addAttribute("myLevel",memberService.readLevel(sub_guide));
		model.addAttribute("boardList",memberService.listIdBoard(sub_guide));
		model.addAttribute("countSub",memberService.countSub(sub_guide));//구독자 수
		model.addAttribute("member_email_sub",memberService.readSub(sub_guide));
		
		//model.addAttribute("loginSubId",memberService.readLoginSub(member_email)); //로그인한 아이디가 팔로우한 테이블에 있는지
		return "board/mInfo";
	}
	
	//구독하기
	@RequestMapping(value="addSub",method=RequestMethod.POST)
	public @ResponseBody int addSub(Model model,String member_email_guide,SubVO subVO) throws Exception {
		memberService.addSub(subVO);
		
		String sub_guide = subVO.getMember_email_guide();
		//memberService.subCheck(member_email_sub, member_email_guide)
		int subInfo = memberService.subCheck(subVO.getMember_email_sub(), sub_guide);
		
		//subInfo=1이라면 이미 팔로워  subInfo=0이라면 아직 팔로워하지 않았음
		if(subInfo==0)
			model.addAttribute("subInfo", "enable");
		else 
			model.addAttribute("subInfo", "disable");
		
		model.addAttribute("countSub",memberService.countSub(sub_guide));//구독자 수
		model.addAttribute("member_email_sub",memberService.readSub(sub_guide));
		//return memberService.countSub(member_email_guide); //구독자 수
		return memberService.countSub(sub_guide); //구독자 수
	}
	
	//구독 취소
	@RequestMapping(value="minusSub",method=RequestMethod.POST)
	public @ResponseBody int minusSub(Model model,String member_email_guide,String member_email_sub, SubVO subVO) throws Exception {
		memberService.minusSub(member_email_sub, member_email_guide);
		
		String sub_guide = subVO.getMember_email_guide();
		//memberService.subCheck(member_email_sub, member_email_guide)
		int subInfo = memberService.subCheck(subVO.getMember_email_sub(), sub_guide);
		
		//subInfo=1이라면 이미 팔로워  subInfo=0이라면 아직 팔로워하지 않았음
		if(subInfo==0)
			model.addAttribute("subInfo", "enable");
		else 
			model.addAttribute("subInfo", "disable");
		
		model.addAttribute("countSub",memberService.countSub(sub_guide));//구독자 수
		model.addAttribute("member_email_sub",memberService.readSub(sub_guide));	
		//return memberService.countSub(member_email_guide);
		return memberService.countSub(sub_guide);
	}
	
	//내가 팔로우한 사용자들
	@RequestMapping(value="myCreate",method=RequestMethod.GET)
	public String myCreate(Model model, String member_email_sub) throws Exception {
		model.addAttribute("creator",memberService.readGuide(member_email_sub));
		return "/my/myCreator";
	}
	
	//나를 팔로우한 사용자들
	@RequestMapping(value="myFan",method=RequestMethod.GET)
	public String myFan(Model model, String member_email_guide) throws Exception {
		model.addAttribute("member_email_sub",memberService.readSub(member_email_guide));
		return "/my/myFan";
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
