package com.ssb.financial.loan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.View;

import com.ssb.common.MyExcelView;
import com.ssb.financial.account.Account;

@Controller("loan.loanController")
public class LoanController {
	/*@Autowired
	private LoanService service;*/
	
	@Autowired
	private MyExcelView excel;

	// 대출 계좌 조회
	@RequestMapping(value = "/financial/loan")
	public String loanSearch() {
		
		return ".financial.loan.las-0001";

	}
	
	//대출 신규
	@RequestMapping(value="/financial/loan/rbs{stage}")
	public String newLoan(@PathVariable String stage,@RequestParam int productIdx,Model model) {
		
		model.addAttribute("productIdx",productIdx);
		return ".financial.loan.rbs-"+stage;
	}

	
	
	//계좌 엑셀 다운로드
	@RequestMapping(value="/financial/loan/excel")
	public View excelDownload(Map<String, Object> model,@RequestParam int memberIdx) {
		String filename ="account.xls";
		String sheetName = "계좌목록";
		
		//내려받을 목록리스트
		List<String> columnLabels = new ArrayList<>();
		//내려받을 목록값
		List<Object[]> columnValues = new ArrayList<>();
		
		//내려받을 것들 목룍리스트
		columnLabels.add("계좌번호");
		
		
		/*//내려받을 값 넣는 처리
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", memberIdx);
		//List<Account> list = service.listAllAccount(map);
		for(Account dto :list) {
			columnValues.add(new Object[] {});
		}*/
		
		model.put("filename", filename);
		model.put("sheetName", sheetName);
		model.put("columnLabels", columnLabels);
		model.put("columnValues", columnValues);
		
		return excel;
	}
}
