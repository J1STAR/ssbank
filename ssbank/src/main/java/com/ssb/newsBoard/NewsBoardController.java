package com.ssb.newsBoard;

import java.io.File;
import java.math.BigDecimal;
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

import com.ssb.common.FileManager;
import com.ssb.common.MyUtil;
import com.ssb.member.SessionInfo;

// 뉴스페이지
@Controller("newsBoard.boardController")
public class NewsBoardController {
	@Autowired
	private NewsBoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value="/customer/newsBoard/newsList") // 사용자가 입력한 주소(인터넷 주소창에 입력하는것)
	public String newsBoardList(
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
		
		int start = (current_page -1 ) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<NewsBoard> list = service.listBoard(map);
		
		int listNum, n = 0;
		Iterator<NewsBoard> it = list.iterator();
		while(it.hasNext()) {
			NewsBoard data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/customer/newsBoard/newsList";
		String articleUrl = cp + "/customer/newsBoard/nib-0001?page=" + current_page;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = listUrl + "?" + query;
			articleUrl = articleUrl+ "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".customer.newsBoard.nib"; // 매핑된 파일 경로(실제 코드가 짜여있는 곳으로 가는 경로)
	}
	
	@RequestMapping(value="/customer/newsBoard/writeNews", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		List<NewsBoard> listCategory = service.listCategory();
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "writeNews");
		
		return ".customer.newsBoard.nib-0002";
	}
	
	@RequestMapping(value="/customer/newsBoard/writeNews", method=RequestMethod.POST)
	public String createdSubmit(
			NewsBoard dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "newsBoard";
		
		dto.setMemberIdx(info.getMemberIdx());
		
		service.insertBoard(dto, pathname);
		
		return "redirect:/customer/newsBoard/newsList";
	}
	
	// article
	@RequestMapping(value="/customer/newsBoard/nib-0001")
	public String article(
			@RequestParam(value="boardIdx") int boardIdx,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		String query = "page=" + page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitCount(boardIdx);
		
		//해당 레코드 가져오기
		NewsBoard dto = service.readBoard(boardIdx);
		if(dto == null)
			return "redirect:/customer/newsBoard/newsList?" + query;
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("boardIdx", boardIdx);
		
		NewsBoard preReadDto = service.preReadBoard(map);
		NewsBoard nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".customer.newsBoard.nib-0001";
	}
	
	@RequestMapping(value="/customer/newsBoard/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		NewsBoard dto = service.readBoard(boardIdx);
		
		if(dto == null) {
			return "redirect:/customer/newsBoard/newsList?page=" + page;
		}
		
		if(!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/customer/newsBoard/newsList?page=" + page;
		}
		
		List<NewsBoard> listCategory = service.listCategory();
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".customer.newsBoard.nib-0002";
	}
	
	@RequestMapping(value="/customer/newsBoard/update", method=RequestMethod.POST)
	public String updateSubmit(
			NewsBoard dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "newsBoard";
		
		service.updateBoard(dto, pathname);
		
		return "redirect:/customer/newsBoard/newsList?page=" + page;
	}
	
	
	@RequestMapping(value="/customer/newsBoard/delete")
	public String delete(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "newsBoard";
		
		service.deleteBoard(boardIdx, pathname, info.getUserId());
		
		return "redirect:/customer/newsBoard/newsList?page="+page;
	}
}
