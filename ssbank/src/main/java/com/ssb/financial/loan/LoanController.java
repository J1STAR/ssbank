package com.ssb.financial.loan;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import com.ssb.common.MyExcelView;
import com.ssb.member.SessionInfo;

@Controller("loan.loanController")
public class LoanController {
	@Autowired
	private LoanService service;
	
	@Autowired
	private MyExcelView excel;

	// 대출 계좌 조회
	@RequestMapping(value = "/financial/loan")
	public String loanSearch(HttpSession session,Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", info.getMemberIdx());
		int totalLoan = service.totalLoan(map);
		List<Loan> loanList = service.loanList(map);
		model.addAttribute("totalLoan",totalLoan);
		model.addAttribute("loanList",loanList);
		return ".financial.loan.las-0001";

	}
	
	//대출 신규
	@RequestMapping(value="/financial/loan/rbs{stage}")
	public String newLoan(@PathVariable String stage,
			@RequestParam int productIdx,
			Model model,HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Loan in = service.newMember(info.getMemberIdx());
		String productName = service.productName(productIdx);
		if (stage.equals("0002")) {
			model.addAttribute("info", in);
			model.addAttribute("productName",productName);
		}
		model.addAttribute("productIdx",productIdx);
		
		return ".financial.loan.rbs-"+stage;
	}
	
	@RequestMapping(value="/financial/loan/loanNew",method = RequestMethod.POST)
	public String loanSubmit(Loan dto,@RequestParam int productIdx,HttpSession session,Model model) {
		System.out.println(dto.getLendMoney()+"컨트롤러");
		dto.setProductIdx(productIdx);
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setMemberIdx(info.getMemberIdx());
		dto.setSsn(dto.getSsn1()+"-"+dto.getSsn2());
		int result = service.insertLoan(dto);	
		if(result==0){
			model.addAttribute("msg","주민번호가 일치 하지 않습니다.");
			return ".financial.account.rbs-0002";
		}
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx",info.getMemberIdx());
		Loan create = service.createLoan(map);
		model.addAttribute("name", info.getUserName());
		model.addAttribute("create",create);
		return ".financial.loan.rbs-0003";
	}
	
	
	//계좌 엑셀 다운로드
	@RequestMapping(value="/financial/loan/excel")
	public View excelDownload(Map<String, Object> model,HttpSession session) {
		String filename ="loan.xls";
		String sheetName = "대출목록";
		
		//내려받을 목록리스트
		List<String> columnLabels = new ArrayList<>();
		//내려받을 목록값
		List<Object[]> columnValues = new ArrayList<>();
		
		//내려받을 것들 목룍리스트
		columnLabels.add("상품명");
		columnLabels.add("계좌번호");
		columnLabels.add("대출일");
		columnLabels.add("만기일");
		columnLabels.add("대출신청금액");
		columnLabels.add("대출잔액");
		columnLabels.add("이자납입일");
	
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", info.getMemberIdx());
		List<Loan> loanList = service.loanList(map);
		for(Loan dto :loanList) {
			columnValues.add(new Object[] { 
					dto.getProductName(),
					dto.getAccountNo(),
					dto.getCreateDate(),
					dto.getLastDate(),
					dto.getLendMoney(),
					"",
					dto.getInterestDate()
					});
		}
		
		model.put("filename", filename);
		model.put("sheetName", sheetName);
		model.put("columnLabels", columnLabels);
		model.put("columnValues", columnValues);
		
		return excel;
	}
	@RequestMapping(value="/loan/repay" , method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> repay(Loan dto){
		
		String data="대출 상환 성공";
		int result=service.repay(dto);
		if(result==0) {
			data="대출 상환 실패";
		}
		Map<String, Object> model = new HashMap<>();
		model.put("data", data);
		return model;
	}
	
	@RequestMapping(value="/loan/repayList")
	public String repayList(@RequestParam String accountNo,Model model) {
		Map<String, Object> map = new HashMap<>();
		map.put("accountNo", accountNo);
		List<Loan> repayList =service.repayList(map);
		model.addAttribute("repayList",repayList);
		model.addAttribute("accountNo",accountNo);
		return ".financial.loan.scl-0001";
	}
}
