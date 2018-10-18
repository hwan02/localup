package com.localup.control;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.core.internal.resources.MoveDeleteHook;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.localup.domain.Criteria;
import com.localup.domain.GuideVO;
import com.localup.domain.PageMaker;
import com.localup.domain.PayInfoVO;
import com.localup.domain.ReplyVO;
import com.localup.persistence.MainDAOImpl;
import com.localup.service.GuideService;
import com.localup.service.PayInfoService;

@Controller
@RequestMapping("pay")
public class PayInfoController {
	
	@Inject
	PayInfoService payInfoService;
	
	@Inject
	GuideService guideService;
	
	//결제페이지 폼 보이기(ver : 모달에서 메인페이지 클릭시)
	@RequestMapping(value="pay",method=RequestMethod.GET)
	public String payGET(Integer board_no,Model model) throws Exception{
		model.addAttribute("GuideVO",guideService.list(board_no));
		return "board/pay";
	}
	
	//결제 DB입력 처리(ver : 모달에서 메인페이지 클릭시)
	@RequestMapping(value="pay",method=RequestMethod.POST)
	public String payPOST(PayInfoVO payInfoVO) throws Exception{
		payInfoService.insert(payInfoVO);
		return "redirect:/index";
	}
	
	//결제페이 ==이동==> main(ver : 모달에서 메인페이지 클릭시)
//	@RequestMapping("index")
//	public String main() {
//		return "main/index";
//	}

	//결제페이지 폼 보이기(ver : 모달에서 마이페이지 클릭시)
//	@RequestMapping(value="payMy",method=RequestMethod.GET)
//	public String payMyGET() throws Exception{
//		return "board/pay";
//	}
	
	//결제 DB입력 처리(ver : 모달에서 마이페이지 클릭시)
	@RequestMapping("payMy")
	public String payMy(PayInfoVO payInfoVO) throws Exception{
		payInfoService.insert(payInfoVO);
		return "redirect:/pay/Mypage";
	}
	
	//결제페이 ==이동==> Mypage(ver : 모달에서 마이페이지 클릭시)
	@RequestMapping("Mypage")
	public String Mypage() {
		return "my/Mypage";
	}
	
	//결제하기 버튼 클릭시 결제 화면창 보이기
	@RequestMapping("payWindow")
	public String payWindow() {
		return"board/payWindow";
	}
	
	//결제내역 폼 보기
	@RequestMapping(value="myPayInfo", method=RequestMethod.GET)
	public String myPayInfoGET(Criteria cri,Model model, Integer board_no,String member_email) throws Exception {
		//model.addAttribute("GuideVO",payInfoService.payList(board_no));
		model.addAttribute("PayInfoVO",payInfoService.payList2(member_email));
		
		//List<BoardVO> list = service.listAll(); //from DB ===> 데이터생성
		//model.addAttribute("list",list);
		//===>model.addAttribute("list",service.listAll());
		
//		page	start	perPageNum
//		1		0		10
//		2		10		10
//		3		20		10
		
//		start = (page-1)*perPageNum 왜? perPageNum이 변경가능 하므로
		//System.out.println("cri page==>" + cri.getPage());
		//System.out.println("cri perPageNum==>" + cri.getPerPageNum());
		model.addAttribute("PayInfoVO",payInfoService.myPayInfoAll(cri.getPageStart(),
                								  cri.getPerPageNum(), member_email));
		
		PageMaker maker = new PageMaker();
			maker.setCri(cri);
			maker.setTotalCount(payInfoService.listCount());
			
		model.addAttribute("maker",maker);
		return"my/myPayInfo";
	}
	


	


	
	
	//결제내역 수정 폼으로 이동
	@RequestMapping(value="myPayInfo", method=RequestMethod.POST)
	public String myPayInfoPOST(PayInfoVO payInfoVO,Model model) throws Exception {
		//System.out.println(payInfoVO);
		
		//payInfoService.update(payInfoVO);
		return"redirect:/pay/myPayInfoUpdate";
	}

	//결제내역 수정 폼
	@RequestMapping(value="myPayInfoUpdate", method=RequestMethod.GET)
	public String myPayInfoUpdateGET(Model model,Integer pay_no, Integer tour_no) throws Exception {
		//System.out.println(payInfoVO);
		//model.addAttribute("GuideVO",payInfoService.payList(tour_no));
		model.addAttribute("PayInfoVO",payInfoService.payList_payno(pay_no));
		return"my/myPayInfoUpdate";
	}
	
	@RequestMapping(value="myPayInfoUpdate", method=RequestMethod.POST)
	public String myPayInfoUpdatePOST(PayInfoVO payInfoVO) throws Exception {
		//System.out.println(payInfoVO);
		
		payInfoService.update(payInfoVO);
		return"redirect:/pay/myPayInfo";
	}
	
}