package com.ssb.personal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("personal.mainController")
public class MainController {
	
	@RequestMapping("/personal/lookupAccount")
	public String loopUpAccountForm() {
		
		return ".personal.paa-0001";
	}
}
