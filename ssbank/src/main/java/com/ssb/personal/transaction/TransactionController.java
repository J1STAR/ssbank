package com.ssb.personal.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ssb.common.MyUtil;

@RestController("transaction.transactionController")
public class TransactionController {
	
	@Autowired
	private TransactionService trService;
	
	@Autowired
	private MyUtil myUtil;
	
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
	
	@RequestMapping(value="/transaction/transactionList", method=RequestMethod.POST)
	public Map<String, Object> transactionList(@RequestParam Map<String, Object> map){
		
		List<Map<String, Object>> resultList = null;
		
		System.out.println(map.get("startDate"));
		System.out.println(map.get("endDate"));
		if(map.get("page").equals("") || map.get("page") == null) {
			map.put("page", 1);
		}
		try {
			resultList = trService.transactionList(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("transactionList", resultList);
		return model;
	}
}
