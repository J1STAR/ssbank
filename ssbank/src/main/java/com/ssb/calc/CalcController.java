package com.ssb.calc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("calc.calcController")
public class CalcController {
	
	
	@RequestMapping(value="/calc/saving")
	public String calcMenu1() {
		return ".calc.cal-0001";
	}
}
