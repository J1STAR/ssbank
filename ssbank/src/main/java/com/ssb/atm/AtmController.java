package com.ssb.atm;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("atm.atmController")
public class AtmController {
	
	@RequestMapping(value="/atm", method=RequestMethod.GET)
	public String atmForm() {
		return ".atm";
	}
}
