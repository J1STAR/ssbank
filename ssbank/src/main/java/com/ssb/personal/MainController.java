package com.ssb.personal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller("personal.mainController")
public class MainController {
	
	@RequestMapping(value="/personal/lookupAccount", method=RequestMethod.GET)
	public String loopUpAccountForm() {
		
		return ".personal.account.paa-0001";
	}
	
	@RequestMapping(value="/personal/transaction", method=RequestMethod.GET)
	public String transactionForm() {
		return ".personal.transaction.pit-0001";
	}
	
	@RequestMapping(value="/personal/transaction-{status}", method=RequestMethod.GET)
	public String transactionStatus(@PathVariable String status, Model model) {
		
		model.addAttribute("trStatus", status);
		return ".personal.transaction.pit-0002";
	}
}
