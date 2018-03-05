package com.ssb.accountBook;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssb.common.MyExcelView;
import com.ssb.member.SessionInfo;

@Controller("accountBook.accountBookController")
public class AccountBookController {
	
	@Autowired
	private AccountBookService service;
	
	@Autowired
	private MyExcelView excel;
	
	@RequestMapping(value="/acBookNcarBook/accountBook", method=RequestMethod.GET)
	public String accountBookList(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();
		
		map.put("memberIdx", info.getMemberIdx());
		System.out.println(info.getMemberIdx());
		
		List<AccountBook> listAll = service.listAllAccountBook(map);
		
		model.addAttribute("listAll", listAll);
		
		return ".acBookNcarBook.accountBook.write";
	}
	
	
}
