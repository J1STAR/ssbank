package com.ssb.financial;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("financial.financialController")
public class FinancialController {
	@RequestMapping(value="/financial")
	public String FinMain() {
		return ".finanicial.account.saveAccountResearch";
	}


}
