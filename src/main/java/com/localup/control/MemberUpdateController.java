package com.localup.control;

import java.lang.ProcessBuilder.Redirect;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.domain.MemberUpdateVO;
import com.localup.service.MemberUpdateService;

@Controller
public class MemberUpdateController {
	
	@Inject
	MemberUpdateService memberUpdateService;
	
	//회원정보 수정폼
	@RequestMapping(value="memberUpdate", method=RequestMethod.GET)
	public String memberUpdateGET(Model model)throws Exception{
		model.addAttribute("memberUpdateVO",memberUpdateService.listAll());
		return "test/memberUpdate/update";	
	}
	
	//회원정보 DB수정
	@RequestMapping(value="memberUpdate", method=RequestMethod.POST)
	public String memberUpdatePOST(MemberUpdateVO memberUpdateVO)throws Exception{
		memberUpdateService.update(memberUpdateVO);		//수정작업
		return "redirect:/updateCheck";					//수정작업확인	
	}
	
	//목록요청 처리
	@RequestMapping("updateCheck")
	public String listAll(Model model) throws Exception{
		
		//컨트롤러 영역에서 조회된 결과를 영역저장 - 뷰와 공유
		model.addAttribute("listAll",memberUpdateService.listAll()); 
		return "test/memberUpdate/listAll";
	}
	
//	//다음주소 API
//	@RequestMapping(value="memberAddr", method=RequestMethod.GET)
//	public String addrAPI()throws Exception{
//		return "test/daumAddrAPI/addrAPI";	
//	}
}
