package com.ssb.accountBook;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssb.common.MyExcelView;
import com.ssb.member.SessionInfo;

@Controller("accountBook.accountBookController")
public class AccountBookController {

	@Autowired
	private AccountBookService service;

	@Autowired
	private MyExcelView excel;

	// 가계부 메인
	@RequestMapping(value = "/acBookNcarBook/accountBook", method = RequestMethod.GET)
	public String accountBook(HttpSession session, Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());

		// 수입 총합, 지출 총합, 총 총합
		int expenseTot = service.expenseTot(map);
		int incomeTot = service.incomeTot(map);
		int total = -(expenseTot) + incomeTot;

		DecimalFormat df = new DecimalFormat("#,###");
		
		model.addAttribute("exTot", df.format(expenseTot));
		model.addAttribute("inTot", df.format(incomeTot));
		model.addAttribute("total", df.format(total));

		return ".accountBook.ggcommon";
	}

	// 지출. AJAX
	@RequestMapping(value = "/acBookNcarBook/expense")
	public String accountBookExpense(
			String startDate, String endDate,
			HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		List<AccountBook> expenseList = service.expenseList(map);

		model.addAttribute("expenseList", expenseList);

		return "accountBook/expense";
	}

	// 수입. AJAX
	@RequestMapping(value = "/acBookNcarBook/income")
	public String accountBookIncome(
			String startDate, String endDate,
			HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		List<AccountBook> incomeList = service.incomeList(map);

		model.addAttribute("incomeList", incomeList);

		return "accountBook/income";
	}

	// 달력. AJAX
	@RequestMapping(value = "/acBookNcarBook/calendar")
	public String accountBookCalendar(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());

		List<AccountBook> calendarList = service.calendarList(map);

		model.addAttribute("calendarList", calendarList);

		return "accountBook/calendar";
	}
	
	//AJAX 입력
	@RequestMapping(value = "/acBookNcarBook/insertAccountBook", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertAccountBook(AccountBook dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		dto.setMemberIdx(info.getMemberIdx());
		int result=service.insertAccountBook(dto);
		if(result == 0)
			state="false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	//AJAX 수정
	@RequestMapping(value = "/acBookNcarBook/updateAccountBook", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateAccountBook(AccountBook dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		dto.setMemberIdx(info.getMemberIdx());
		int result=service.updateAccountBook(dto);
		if(result == 0)
			state="false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	//AJAX 삭제
	@RequestMapping(value = "/acBookNcarBook/deleteAccountBook")
	@ResponseBody
	public Map<String, Object> deleteAccountBook(AccountBook dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		
		dto.setMemberIdx(info.getMemberIdx());
		int result=service.deleteAccountBook(dto);
		if(result == 0)
			state="false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}
