package com.ssb.financial.loan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	@RequestMapping(value = "/financial/loan/loanSearch")
	public String loanSearch() {
		return ".financial.loan.las";

	}

	// 신청내역조회
	@RequestMapping(value = "/financial/loan/loanHistory")
	public String loanHistory() {
		return ".financial.loan.rbs";

	}

	// 이자 조회/납부
	@RequestMapping(value = "/financial/loan/loanIntHistory")
	public String loanIntHistory() {
		return ".financial.loan.lsp";

	}

	// 원금상환/한도해지
	@RequestMapping(value = "/financial/loan/loanPcRedem")
	public String loanPcRedem() {
		return ".financial.loan.prp";

	}

	//원금상환예약
	@RequestMapping(value = "/financial/loan/redemReserve")
	public String redemReserve() {
		return ".financial.loan.prr";

	}
	//담보예금해지/대출상환
	@RequestMapping(value = "/financial/loan/mortgage")
	public String mortgage() {
		return ".financial.loan.mdc";
		
	}
	//한도 증액/감액
	@RequestMapping(value = "/financial/loan/limitIncrese")
	public String limitIncrese() {
		return ".financial.loan.llp";
		
	}
	//예금담보대출
	@RequestMapping(value = "/financial/loan/loanDeposit")
	public String loanDeposit() {
		return ".financial.loan.scl";
		
	}
	//신용대출
	@RequestMapping(value = "/financial/loan/loanCredit")
	public String loanCredit() {
		return ".financial.loan.pcl";
		
	}
	//부동산대출
	@RequestMapping(value = "/financial/loan/loanRsa")
	public String loanRsa() {
		return ".financial.loan.rcl";
		
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
