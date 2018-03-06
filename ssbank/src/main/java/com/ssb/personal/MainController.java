package com.ssb.personal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("personal.mainController")
public class MainController {
	
	@RequestMapping(value="/personal/lookupAccount", method=RequestMethod.GET)
	public String loopUpAccountForm() {
		
		return ".personal.paa-0001";
	}
}
