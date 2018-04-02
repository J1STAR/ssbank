/*package com.ssb.regularQuestion;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssb.common.MyUtil;
import com.ssb.member.SessionInfo;
import com.ssb.noticeBoard.Notice;

@Controller("regularQuestion.inquiryController")
public class InquiryController {
	@Autowired
	private InquiryService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customerCounsel/regularQuestion/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{
		String cp = req.getContextPath();
		
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Inquiry> list = service.listInquiry(map);
		
		int num, n = 0;
		Iterator<Inquiry> it = list.iterator();
		while(it.hasNext()) {
			Inquiry data = (Inquiry)it.next();
			num = dataCount - (start + n - 1);
			data.setNum(num);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/customerCounsel/regularQuestion/list";
		String articleUrl = cp + "/customerCounsel/regularQuestion/article?page=" + current_page;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = listUrl + "?" + query;
			articleUrl = articleUrl+ "&" + query;
		}
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".customerCounsel.regularQuestion.list";
	}
	
	
	@RequestMapping(value="/customerCounsel/regularQuestion/created", method=RequestMethod.GET)
	public String createdForm(Model model) {
		model.addAttribute("mode", "created");
		
		return ".customerCounsel.regularQuestion.created";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/created", method=RequestMethod.POST)
	public String createdSubmit(
			Inquiry dto,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "inquiry";
			
		dto.setMemberIdx(info.getMemberIdx());
		service.insertInquiry(dto, "created");
		
		
		return "redirect:/customerCounsel/regularQuestion/list";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/article")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") String pageNo,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		String query = "pageNo=" + pageNo;
		if(searchValue.length()!=0) {
			query += "*searchKey=" + searchKey + "&searchValue" + searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		Inquiry dto = service.readInquiry(num);
		if(dto == null)
			return "redirect:/customerCounsel/regularQuestion/list?" +query;
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);
		
		
		return ".customerCounsel.regularQuestion.article";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int num,
			@RequestParam String pageNo,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Inquiry dto = service.readInquiry(num);
		
		if(dto == null) {
			return "redirect:/customerCounsel/regularQuestion/list?pageNo=" + pageNo;
		}
		
		if(!info.getUserId().equals(dto.getMemberIdx())) {
			return "redirect:/customerCounsel/regularQuestion/list?pageNo=" + pageNo;
		}
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", pageNo);
		
		return ".customerCounsel.regularQuestion.created";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/update", method=RequestMethod.POST)
	public String updateSubmit(
			Inquiry dto,
			@RequestParam String pageNo,
			HttpSession session) throws Exception{
		String root = session.getServletContext().getRealPath("member");
		String pathname = root + "uploads" + File.separator + "inquiry";
		
		service.updateInquiry(dto, pathname);
		
		return "redirect:/customerCounsel/regularQuestion/list?pageNo" + pageNo;
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/delete")
	public String delete(
			@RequestParam int num,
			@RequestParam String pageNo,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("member");
		String pathname = root + "uploads" +File.separator + "inquiry";
		
		service.deleteInquiry(num, pathname, info.getUserId());
		
		return "redirect:/customerCounsel/regularQuestion/list?pageNo" + pageNo;
	}
}
*/