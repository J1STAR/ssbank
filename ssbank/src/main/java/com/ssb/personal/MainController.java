package com.ssb.personal;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssb.personal.transaction.Transaction;

@Controller("personal.mainController")
public class MainController {
	
	@RequestMapping(value="/personal/lookupAccount", method=RequestMethod.GET)
	public String loopUpAccountForm() {
		
		return ".personal.account.paa-0001";
	}
	
	@RequestMapping(value="/personal/lookupDetailAccount", method=RequestMethod.GET)
	public String loopUpDetailAccountForm() {
		
		return ".personal.account.paa-0002";
	}
	
	@RequestMapping(value="/personal/transaction", method=RequestMethod.GET)
	public String transactionForm(@RequestParam(defaultValue="") String accountNo, Model model) {
		
		model.addAttribute("accountNo", accountNo);
		
		return ".personal.transaction.pit-0001";
	}
	
	@RequestMapping(value="/personal/transaction-{status}", method=RequestMethod.POST)
	public String transactionStatus(@PathVariable String status, @RequestParam Map<String, Object> map, Model model) {
		
		model.addAttribute("trStatus", status);

		if( status.equals("1") ) {
			model.addAttribute("sendAccount", map.get("accountNo"));
			model.addAttribute("recvAccount", map.get("accountNo2"));
			model.addAttribute("amount", map.get("amount"));
			model.addAttribute("currBalance", Integer.parseInt((String)map.get("balance")) - Integer.parseInt((String)map.get("amount")));
		}
		
		
		return ".personal.transaction.pit-0002";
	}
}
