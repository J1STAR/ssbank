package com.ssb.mailCounsel;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("mailCounsel.mailController")
public class MailController {
	@Autowired
	private MailSender mailSender;
	
	@RequestMapping(value="/customerCounsel/mailCounsel/list", method=RequestMethod.GET)
	public String sendForm() throws Exception {
		return "/customerCounsel/mailCounsel/sendForm";
	}
	
	@RequestMapping(value="/customerCounsel/mailCounsel/sendOk", method=RequestMethod.POST)
	public String sendSubmit(Mail dto, Model model) throws Exception {
		
		boolean b = mailSender.mailSend(dto);
		
		String msg = "<span style='color:blue;'> 관리자 </span> 에게<br>";
		if(b) {
			msg += "메일을 성공적으로 전송 했습니다.";
		} else {
			msg += "메일을 전송하는데 실패했습니다.";
		}
		
		model.addAttribute("message", msg);
		
		return ".customerCounsel.mailCounsel.sendOk";
	}
}
