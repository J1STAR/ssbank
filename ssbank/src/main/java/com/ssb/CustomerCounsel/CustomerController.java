package com.ssb.CustomerCounsel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("customerCounsel.customerController")
public class CustomerController {
	
	@RequestMapping("/customerCounsel/main")
	public String main() throws Exception {
		return ".customerCounsel.main";
	}
}
