package com.ssb.personal.transaction;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController("transaction.transactionController")
public class TransactionController {
	
	@Autowired
	private TransactionService trService;
	
	@RequestMapping(value="/transaction/transactionSubmit", method=RequestMethod.POST)
	public Map<String, Object> transactionSubmit(@RequestParam Map<String, Object> map){
		
		int result = 0;
		try {
			result = trService.transactionSubmit(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("result", result);
		return model;
	}
}
