package com.localup.control;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.request;

import javax.inject.Inject;

import org.eclipse.core.internal.resources.MoveDeleteHook;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.domain.GuideVO;
import com.localup.domain.PayInfoVO;
import com.localup.persistence.MainDAOImpl;
import com.localup.service.GuideService;
import com.localup.service.PayInfoService;

@Controller
@RequestMapping("pay")
public class PayInfoController {
	
	@Inject
	PayInfoService payInfoService;
	
	//결제페이지 폼 보이기(ver : 모달에서 메인페이지 클릭시)
	@RequestMapping(value="pay",method=RequestMethod.GET)
	public String payGET() throws Exception{
		return "board/pay";
	}
	
	//결제 DB입력 처리(ver : 모달에서 메인페이지 클릭시)
	@RequestMapping(value="pay",method=RequestMethod.POST)
	public String payPOST(PayInfoVO payInfoVO) throws Exception{
		payInfoService.insert(payInfoVO);
		return "redirect:/pay/main";
	}
	
	//결제페이 ==이동==> main(ver : 모달에서 메인페이지 클릭시)
	@RequestMapping("main")
	public String main() {
		return "main/main";
	}

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
	public String myPayInfoGET(Model model, Integer tour_no, Integer pay_no ) throws Exception {
		model.addAttribute("GuideVO",payInfoService.payList(tour_no));
		model.addAttribute("PayInfoVO",payInfoService.payList2(pay_no));
		return"my/myPayInfo";
	}
	
	//결제내역 수정
	@RequestMapping(value="myPayInfo", method=RequestMethod.POST)
	public String myPayInfoPOST(PayInfoVO payInfoVO) throws Exception {
		payInfoService.update(payInfoVO);
		return"redirect:/pay/main";
	}
	
}
