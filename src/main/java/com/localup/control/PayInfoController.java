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
	
	//결제페이지 폼 보이기
	@RequestMapping(value="pay",method=RequestMethod.GET)
	public String payGET() throws Exception{
		return "board/pay";
	}
	
	//결제 DB입력 처리
	@RequestMapping(value="pay",method=RequestMethod.POST)
	public String payPOST(PayInfoVO payInfoVO) throws Exception{
		payInfoService.insert(payInfoVO);
		return "redirect:main";
	}
	
	//결제페이 ==이동==> 페인페이지
	@RequestMapping("main")
	public String main() throws Exception{
		return "main/main";
	}
}
