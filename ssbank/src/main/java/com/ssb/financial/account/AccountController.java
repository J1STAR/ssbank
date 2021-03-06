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
import org.springframework.web.bind.annotation.ResponseBody;
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
		
		List<Account> deposit = service.depositlistAllAccount(map);
		List<Account> saving = service.savinglistAllAccount(map);
		Account deTot = service.deTotalBalance(map);
		Account saTot = service.saTotalBalance(map);
		// 계좌리스트
		model.addAttribute("deposit", deposit);
		model.addAttribute("saving", saving);
		// 총 계좌 잔액
		model.addAttribute("deTot", deTot);
		model.addAttribute("saTot", saTot);

		return ".financial.account.fds-0001";
	}

	// 입출금 계좌 상세보기
	@RequestMapping(value = "/financial/account/deDetail")
	public String deDetail(@RequestParam String accountNo, Model model) {
		Account dto = null;
		dto = service.detailDepositAccount(accountNo);
		model.addAttribute("dto", dto);
		return ".financial.account.fds-0002";
	}

	// 적금계좌
	@RequestMapping(value = "/financial/account/saDetail")
	public String saDetail(@RequestParam String accountNo, Model model) {
		Account dto = null;
		dto = service.detailSavingAccount(accountNo);
		model.addAttribute("dto", dto);
		return ".financial.account.fds-0003";
	}

	// 예금 신규
	@RequestMapping(value = "/financial/account/fdn{stage}", method = RequestMethod.GET)
	public String newAccountForm(@PathVariable String stage, 
			HttpSession session, Model model,@RequestParam int productIdx) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 로그인한 멤버 회원 정보 --0002에 이동시 같이 가야 함
		Account in = service.newAccountMember(info.getMemberIdx());
		String productName = service.productName(productIdx);
		if (stage.equals("0002")) {
			model.addAttribute("info", in);
			model.addAttribute("productName",productName);
		}
		model.addAttribute("productIdx",productIdx);
		return ".financial.account.fdn-"+stage;
	}

	@RequestMapping(value = "/financial/account/accountNew", method = RequestMethod.POST)
	public String newAccountSubmit(Account dto, @RequestParam int productIdx,Model model,HttpSession session) {
		
		//상품코드 넣기
		dto.setProductIdx(productIdx);
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setMemberIdx(info.getMemberIdx());
		dto.setSsn(dto.getSsn1()+"-"+dto.getSsn2());
		int result = service.insertAccount(dto);
		if(result==0){
			model.addAttribute("msg","주민번호가 일치 하지 않습니다.");
			return ".financial.account.fdn-0002";
		}
		//신규가입된 사람
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx",info.getMemberIdx());
		Account create = service.createAccount(map);
		model.addAttribute("name", info.getUserName());
		model.addAttribute("create",create);
		return ".financial.account.fdn-0003";
	}

	// 해지
	@RequestMapping(value = "/financial/account/fdc0001")
	public String cancleStep1(HttpSession session, Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		map.put("memberIdx", info.getMemberIdx());
		// 내 계좌 리스트
		List<Account> account = service.myAccount(map);
		model.addAttribute("account", account);

		return ".financial.account.fdc-0001";
	}
	@RequestMapping(value = "/financial/account/fdc{stage}")
	public String cancleStep2(HttpSession session, Model model,@RequestParam String accountNo,@PathVariable String stage) {
		
		model.addAttribute("accountNo", accountNo);
		
		return ".financial.account.fdc-"+stage;
	}
	
	
	@RequestMapping(value = "/financial/account/deleteAccount",method = RequestMethod.POST)
	public String cancleSubmit(Account dto,HttpSession session,@RequestParam String accountNo,Model model) {
		
		//해지 처리 
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setMemberIdx(info.getMemberIdx());
		dto.setSsn(dto.getSsn1()+"-"+dto.getSsn2());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountNo", accountNo);
		dto.setBalance(service.accountBalance(map));
		dto.setAccountNo(accountNo);
		int result = service.deleteAccount(dto);
		//해지가 안될 경우 
		if(result==0){
			model.addAttribute("msg","주민번호가 일치 하지 않습니다.");
			return ".financial.account.fdc-0003";
		}
		//해지가 될 경우 
		model.addAttribute("msg","해지가 완료되었습니다.");
		return ".financial.account.fdc-0004";
	}
	
	
	// 해지계좌 잔액 확인
	@RequestMapping(value = "/financial/account/balance",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> balance(@RequestParam String accountNo) {
		// 데이터 가져오기
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("accountNo", accountNo);
		int balance = service.accountBalance(map);
		// 데이터 보내기
		Map<String, Object> model = new HashMap<>();
		model.put("balance", balance);
		return model;
	}
	
	@RequestMapping(value="/financial/account/cancleCheck")
	@ResponseBody
	public Map<String, Object> cancleCheck(
			@RequestParam String accountNo
			,@RequestParam String accountPwd){

		// 패스워드 암호화
		/*ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed=passwordEncoder.encodePassword(dto.getUserPwd(), null);
		dto.setUserPwd(hashed);*/
		
		Map<String, Object> map = new HashMap<>();
		map.put("accountNo", accountNo);
		map.put("accountPwd",accountPwd);
		int state = service.accountCancleCheck(map);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	

	
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
