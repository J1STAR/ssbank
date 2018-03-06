package com.ssb.personal.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("personalAccount.accountController")
public class AccountController {

	@Autowired
	private AccountService acService;
	
	@RequestMapping(value="/personal/lookupAccount", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> lookupAccount(@RequestParam int memberIdx){

		List<Map<String, Object>> listAccount = null;
		try {
			listAccount = acService.lookupAccount(memberIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("listAccount", listAccount);
		return model;
	}
	
}
