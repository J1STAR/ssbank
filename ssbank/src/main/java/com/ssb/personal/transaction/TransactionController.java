package com.ssb.personal.transaction;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssb.common.MyUtil;

@Controller("transaction.transactionController")
public class TransactionController {
	
	@Autowired
	private TransactionService trService;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/transaction/transactionSubmit", method=RequestMethod.POST)
	@ResponseBody
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
	
	@RequestMapping(value="/transaction/transactionATMSubmit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> transactionATMSubmit(@RequestParam Map<String, Object> map) {
		
		int result;
		
		result = trService.transactionATMSubmit(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("result", result);
		
		return model;
	}
	
	@RequestMapping(value="/transaction/transactionRepaySubmit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> transactionRepaySubmit(@RequestParam Map<String, Object> map){
		
		int result = 0;
		try {
			result = trService.transactionRepaySubmit(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("result", result);
		return model;
	}
	
	@RequestMapping(value="/transaction/transactionList", method=RequestMethod.POST)
	public String transactionList(@RequestParam Map<String, Object> map, HttpServletRequest req, Model model){
		
		List<Map<String, Object>> resultList = null;
		
		int current_page = 0;
		if(map.get("page") == null) {
			map.put("page", 1);
			current_page = 1;
		} else {
			current_page = Integer.parseInt((String) map.get("page"));
		}
		
		int rows = 20; 
		int total_page = 0;
		int dataCount = 0;
		
		dataCount = trService.transactionCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			map.put("page", total_page);
		
		int start = (current_page -1 ) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		String cp = req.getContextPath();
		String listUrl = cp + "/transaction/transactionList";
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		try {
			resultList = trService.transactionList(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		model.addAttribute("transactionList", resultList);
		model.addAttribute("paging", paging);
		model.addAttribute("dataCount", dataCount);
		
		return "personal/transaction/trTable";
	}
}
