package com.localup.test;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class EmailController {
		
//		@Inject
//		private EmailService emailService;
	
		@Autowired
		private EmailSender emailSender;
			
		@RequestMapping(value="send",method=RequestMethod.GET)
		public String formback(Model model) {
			TempKey key = new TempKey();
			model.addAttribute("key",key.getKey(5, true));
			return "test/findPassword";
		}
		
//		//DB입력
//		@RequestMapping(value="send", method=RequestMethod.POST)
//		public String registerPOST(EmailForm emailForm) throws Exception{
//			emailService.create(emailForm);;	
//			return "redirect:test/success3";
//		}
		
		@RequestMapping(value="success", method=RequestMethod.POST)
		public String submit(EmailForm form) throws Exception{
			emailSender.sendEmail(form);
			return "test/success3";
		}
		
		
		
}
