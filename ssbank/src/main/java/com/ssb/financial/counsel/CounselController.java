package com.ssb.financial.counsel;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("counsel.counselController")
public class CounselController {
	/*@Autowired
	private CounselService service;*/
	
	//적금 상담
	@RequestMapping(value ="/financial/counsel/saveCon")
	public String save() {
		return ".financial.counsel.cpc";
	}
	//예금 상담
	@RequestMapping(value ="/financial/counsel/accountCon")
	public String account() {
		return ".financial.counsel.cdc";
	}
	//펀드 상담
	@RequestMapping(value ="/financial/counsel/fundCon")
	public String fund() {
		return ".financial.counsel.cfc";
	}
	//대출 상담
	@RequestMapping(value ="/financial/counsel/loanCon")
	public String loan() {
		return ".financial.counsel.clc";
	}

}
