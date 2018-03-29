package com.ssb.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("calc.calcController")
public class CalcController {
	
	//적금
	@RequestMapping(value="/calc/saving")
	public String calcMenu1() {
		return ".calc.cal-0001";
	}
	//예금
	@RequestMapping(value="/calc/deposit")
	public String calcMenu2() {
		return ".calc.cal-0002";
	}
	//대출
	@RequestMapping(value="/calc/loan")
	public String calcMenu3() {
		return ".calc.cal-0003";
	}
	@RequestMapping(value="/calc/exchange")
	public String calcMenu4() {
		return ".calc.cal-0004";
	}
	
}
