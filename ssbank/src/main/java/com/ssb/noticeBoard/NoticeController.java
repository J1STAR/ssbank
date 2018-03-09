package com.ssb.noticeBoard;

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

import com.ssb.common.FileManager;
import com.ssb.common.MyUtil;
import com.ssb.member.SessionInfo;

// 공지사항 페이지
@Controller("noticeBoard.noticeController")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	// 리스트화면
	@RequestMapping(value="/customer/noticeBoard/noticeList")
	public String noticeList(
			@RequestParam(value="page", defaultValue="1") int current_page,
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
		
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page -1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Notice> list = service.listNotice(map);
		
		int listNum, n = 0;
		Iterator<Notice> it = list.iterator();
		
		while(it.hasNext()) {
			Notice data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/customer/noticeBoard/noticeList";
		String articleUrl = cp + "/customer/noticeBoard/article?page="+current_page;
		
		if(searchValue.length() !=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8"); 
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/customer/noticeBoard/article?" + query;
			articleUrl = cp + "/customer/notcieBoard/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".customer.noticeBoard.list";
	}
	
	@RequestMapping(value="/customer/noticeBoard/writeNotice", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		List<Notice> listCatrgory = service.listCategory();
		
		model.addAttribute("listCategory", listCatrgory);
		model.addAttribute("mode", "writeNotice");
		
		return ".customer.noticeBoard.created";
	}
	
	@RequestMapping(value="/customer/noticeBoard/writeNotice", method=RequestMethod.POST)
	public String createdSubmit(
			Notice dto,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "newsBoard";
		
		dto.setMemberIdx(info.getMemberIdx());
		
		service.insertNotice(dto, pathname);
		
		return "redirect:/customer/noticeBoard/noticeList";
	}
	
	@RequestMapping(value="/customer/noticeBoard/article")
	public String article(
			@RequestParam(value="boardIdx") int boardIdx,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		String query = "page=" + page;
		if(searchValue.length() != 0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitCount(boardIdx);
		
		// 해당 레코드 가져오기
		Notice dto = service.readNotice(boardIdx);
		
		if(dto == null)
			return "redirect:/customer/noticeBoard/noticeList";
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("boardIdx", boardIdx);
		
		Notice preReadDto = service.preReadNotice(map);
		Notice nextReadDto = service.nextReadNotice(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		
		return ".customer.noticeBoard.article";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
