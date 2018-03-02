package com.ssb.financial.account;

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
import org.springframework.web.servlet.View;

import com.ssb.common.MyExcelView;
import com.ssb.member.SessionInfo;

@Controller("account.accountController")
public class AccountController {

	@Autowired
	private AccountService service;
	@Autowired
	private MyExcelView excel;

	// 내가 가지고 있는 예금조회
	@RequestMapping(value = "/financial/account", method = RequestMethod.GET)
	public String accountList(HttpSession session, Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		// 전체 계좌 가져오기
		map.put("memberIdx", info.getMemberIdx());
		System.out.println(info.getMemberIdx());

		List<Account> deposit = service.depositlistAllAccount(map);
		List<Account> saving = service.savinglistAllAccount(map);
		Account deTot = service.deTotalBalance(map);
		Account saTot = service.saTotalBalance(map);
		
		//계좌리스트
		model.addAttribute("deposit", deposit);
		model.addAttribute("saving", saving);
		//총 계좌 잔액
		model.addAttribute("deTot", deTot);
		model.addAttribute("saTot", saTot);

		return ".financial.account.fds-0001";
	}

	// 입출금 계좌 상세보기
	@RequestMapping(value = "/financial/account/deDetail")
	public String deDetail(@RequestParam String accountNo, Model model) {
		Account dto = null;
		dto = service.detailDepositAccount(accountNo);
		System.out.println("controller"+dto.toString());
		model.addAttribute("dto",dto);
		return ".financial.account.fds-0002";
	}

	// 적금계좌
	@RequestMapping(value = "/financial/account/saDetail")
	public String saDetail(@RequestParam String accountNo, Model model) {
		Account dto = null;
		dto = service.detailSavingAccount(accountNo);
		model.addAttribute("dto",dto);
		return ".financial.account.fds-0003";
	}

	// 예금 신규
	@RequestMapping(value = "/financial/account/fdn{stage}", method = RequestMethod.GET)
	public String newAccountForm(@PathVariable String stage, HttpSession session, Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 로그인한 멤버 회원 정보 --0002에 이동시 같이 가야 함
		Account in = service.newAccountMember(info.getMemberIdx());
		if (stage.equals("0002")) {
			model.addAttribute("info", in);
		}
		return ".financial.account.fdn-" + stage;
	}

	@RequestMapping(value = "/financial/account/accountNew", method = RequestMethod.POST)
	public String newAccountSubmit(@RequestParam Account dto) {

		service.insertAccount(dto);

		// 계좌 조회페이지로 이동
		return "redirect: /financial/account/fds";
	}

	// 해지
	@RequestMapping(value = "/financial/account/cancel{stage}")
	public String cancelAccount(
			@RequestParam String stage
			,HttpSession session
			,@RequestParam String accountNo,
			Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", info.getMemberIdx());
		List<Account> account = service.myAccount(map);
		//Account account = service.;
		if(stage.equals("0002")) {
			//해지 조회 페이지 이동 
		map.put("accountNo", accountNo);
		Account balance= service.accountBalance(map);
		model.addAttribute("balance",balance);
		}
		//나의 계좌 
		model.addAttribute("account",account);
		
		return ".financial.account.fdc-0001";
	}

	
	// 대출 엑셀 다운로드
	@RequestMapping(value = "/financial/account/excel")
	public View excelDownload(Map<String, Object> model, HttpSession session) {
		String filename = "account.xls";
		String sheetName = "계좌목록";
		// 내려받을 목록리스트
		List<String> columnLabels = new ArrayList<>();
		// 내려받을 목록값
		List<Object[]> columnValues = new ArrayList<>();

		// 내려받을 것들 목룍리스트
		columnLabels.add("상품명");
		columnLabels.add("계좌번호");
		columnLabels.add("이율");
		columnLabels.add("만기일/최근거래일");
		columnLabels.add("잔액");

		// 내려받을 값 넣는 처리
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", info.getMemberIdx());
		List<Account> deposit = service.depositlistAllAccount(map);
		List<Account> saving = service.savinglistAllAccount(map);
		for (Account dep : deposit) {
			columnValues.add(new Object[] { dep.getProductName(), dep.getAccountNo(), dep.getInterestRate(),
					dep.getLastTrDate(), dep.getBalance() });
		}
		for (Account sav : saving) {
			columnValues.add(new Object[] { sav.getProductName(), sav.getAccountNo(), sav.getInterest(),
					sav.getLastTrDate(), sav.getBalance() });
		}

		model.put("filename", filename);
		model.put("sheetName", sheetName);
		model.put("columnLabels", columnLabels);
		model.put("columnValues", columnValues);

		return excel;
	}

}
