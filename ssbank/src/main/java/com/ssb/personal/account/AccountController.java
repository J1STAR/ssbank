package com.ssb.personal.account;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController("personalAccount.accountController")
public class AccountController {

	@Autowired
	private AccountService acService;
	
	@RequestMapping(value="/personal/lookupAccount", method=RequestMethod.POST)
	public Map<String, Object> lookupAccount(@RequestParam String memberIdx, @RequestParam String productIdx){

		List<Map<String, Object>> listAccount = null;
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", memberIdx);
		map.put("productIdx", productIdx);
		try {
			listAccount = acService.lookupAccount(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("listAccount", listAccount);
		return model;
	}
	
	
	
	@RequestMapping(value="/personal/pwdCheck", method=RequestMethod.POST)
	public Map<String, Object> pwdCheck(@RequestParam String accountNo, @RequestParam String accountPwd) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("accountNo",  accountNo);
		map.put("accountPwd", accountPwd);
		
		int result = 0;
		try {
			result = acService.pwdCheck(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("result", result);
		
		return model;
	}
}
