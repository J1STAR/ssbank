package com.ssb.financial.fund;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("fund.fundController")
public class FundController {
	
	/*@Autowired
	private FundService service;*/
	
	//펀드 신규
	@RequestMapping(value="/financial/fund/fundNew")
	public String fundNew() {
		return ".financial.fund.nfc";
		
	}
	
	//펀드 조회
		@RequestMapping(value="/financial/fund/fundSearch")
		public String fundSearch() {
			return ".financial.fund.nfs";
			
		}

}
