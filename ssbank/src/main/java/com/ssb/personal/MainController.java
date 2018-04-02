package com.ssb.personal;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssb.financial.loan.LoanService;
import com.ssb.personal.account.AccountService;

@Controller("personal.mainController")
public class MainController {
	
	@Autowired
	private LoanService service;
	
	@Autowired
	private AccountService acService;
	
	@RequestMapping(value="/personal/lookupAccount", method=RequestMethod.GET)
	public String loopUpAccountForm() {
		
		return ".personal.account.paa-0001";
	}
	
	@RequestMapping(value="/personal/lookupDetailAccount", method=RequestMethod.GET)
	public String loopUpDetailAccountForm(String accountNo, Model model) {
		
		model.addAttribute("accountNo", accountNo);
		
		if(accountNo != null && accountNo.charAt(3) == '3') {
			return ".financial.loan.las-0001";
		} else {
			return ".personal.account.paa-0002";
		}
	}
	
	@RequestMapping(value="/personal/transaction", method=RequestMethod.GET)
	public String transactionForm(String accountNo, Model model) {
		
		model.addAttribute("accountNo", accountNo);
		
		if(accountNo != null && accountNo.charAt(3) == '3') {
			Map<String, Object> map = new HashMap<>();
			map.put("accountNo", accountNo);
			int payment=service.loanPayment(map);
			model.addAttribute("payment",payment);
			return ".financial.loan.prp-0001";
		} else {
			return ".personal.transaction.pit-0001";
		}
		
	}
	
	@RequestMapping(value="/personal/transaction-{status}", method=RequestMethod.POST)
	public String transactionStatus(@PathVariable String status, @RequestParam Map<String, Object> map, Model model) {
		
		model.addAttribute("trStatus", status);

		if( map.get("accountNo") != null ) 
			model.addAttribute("sendAccount", map.get("accountNo"));
		
		if( map.get("accountNo2") != null ) 
			model.addAttribute("recvAccount", map.get("accountNo2"));
		
		model.addAttribute("amount", map.get("amount"));
		if( status.equals("1") && map.get("accountNo") != null ) {
			model.addAttribute("currBalance", acService.getAccountBalance((String)map.get("accountNo")));
		} else if (status.equals("1") && map.get("accountNo") == null) {
			model.addAttribute("currBalance", acService.getAccountBalance((String)map.get("accountNo2")));
		}

		return ".personal.transaction.pit-0002";
	}
	
}
