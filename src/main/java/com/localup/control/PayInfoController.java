package com.localup.control;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.localup.domain.PayInfoVO;
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
	
}
