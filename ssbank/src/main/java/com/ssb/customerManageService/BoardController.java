/*package com.ssb.customerManageService;

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
import com.ssb.newsBoard.NewsBoard;

@Controller("customerManageService.boardController")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/customerCounsel/customerManageService/list") // 사용자가 입력한 주소(인터넷 주소창에 입력하는것)
	public String boardList(
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
		map.put("categoryIdx", 9);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page -1 ) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Board> list = service.listBoard(map);
		
		int listNum, n = 0;
		Iterator<Board> it = list.iterator();
		while(it.hasNext()) {
			Board data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/customerCounsel/customerManageService/list";
		String articleUrl = cp + "/customerCounsel/customerManageService/article?page=" + current_page;
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
		
		return ".customerCounsel.customerManageService.list"; // 매핑된 파일 경로(실제 코드가 짜여있는 곳으로 가는 경로)
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/write", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		List<Board> listCategory = service.listCategory();
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "write");
		
		return ".customerCounsel.customerManageService.created";
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/write", method=RequestMethod.POST)
	public String createdSubmit(
			Board dto,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "customerManageService";
		
		dto.setMemberIdx(info.getMemberIdx());
		
		service.insertBoard(dto, pathname);
		
		return "redirect:/customerCounsel/customerManageService/list";
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/article")
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
		Board dto = service.readBoard(boardIdx);
		if(dto == null)
			return "redirect:/customerCounsel/customerManageService/list?" + query;
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("boardIdx", boardIdx);
		map.put("categoryIdx", 9);
		
		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".customerCounsel.customerManageService.article";
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Board dto = service.readBoard(boardIdx);
		
		if(dto == null) {
			return "redirect:/customerCounsel/customerManageService/list?page=" + page;
		}
		
		if(!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/customerCounsel/customerManageService/list?page=" + page;
		}
		
		List<Board> listCategory = service.listCategory();
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		
		return ".customerCounsel.customerManageService.created";
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/update", method=RequestMethod.POST)
	public String updateSubmit(
			Board dto,
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "customerManageService";
		
		service.updateBoard(dto, pathname);
		
		return "redirect:/customerCounsel/customerManageService/list?page=" + page;
	}
	
	
	@RequestMapping(value="/customerCounsel/customerManageService/delete")
	public String delete(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "customerManageService";
		
		service.deleteBoard(boardIdx, pathname, info.getUserId());
		
		return "redirect:/customerCounsel/customerManageService/list?page="+page;
	}
	
	
	
	
}
*/