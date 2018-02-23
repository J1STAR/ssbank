package com.ssb.financial.account;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller("account.accountController")
public class AccountController {
	
	@Autowired
	private AccountService service;

}
