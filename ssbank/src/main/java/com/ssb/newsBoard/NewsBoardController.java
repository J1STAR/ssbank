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
		
		int categoryIdx, n = 0;
		Iterator<NewsBoard> it = list.iterator();
		while(it.hasNext()) {
			NewsBoard data = it.next();
			categoryIdx = dataCount - (start + n -1);
			data.setCategoryIdx(categoryIdx);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/customer/newsBoard/nib";
		String articleUrl = cp + "/customer/newsBoard/nib-0001?page=" + current_page;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = cp + "/customer/newsBoard/nib-0001?" + query;
			articleUrl = cp + "/customer/newsBoard/nib-0001?page=" + current_page + "&" + query;
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
		model.addAttribute("mode", "created");
		
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
		
		dto.setUserId(info.getUserId());
		
		service.insertBoard(dto, pathname);
		
		return "redirect:/customer/newsBoard/newsList";
	}
	
	@RequestMapping(value="/customer/newsBoard/nib-0001")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		String query = "page=" + page;
		if(searchValue.length()!=0) {
			query += "?searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitCount(num);
		
		//해당 레코드 가져오기
		NewsBoard dto = service.readBoard(num);
		if(dto == null)
			return "redirect:/customer/newsBoard/newsList?" + query;
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);
		
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
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		NewsBoard dto = service.readBoard(num);
		if(dto == null) {
			return "redirect:/customer/newsBoard/newsList?page=" + page;
		}
		
		if(!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/customer/newsBoard/newsList?page=" + page;
		}
		
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
	
	@RequestMapping(value="/customer/newsBoard/nib-0003")
	public String listReply(
			@RequestParam int num,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model) throws Exception {
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("num", num);
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page > total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		List<NewsReply> listReply = service.listReply(map);
		
		for(NewsReply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		// AJAX 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "/customer/newsBoard/nib-0003";
	}
	
	// 댓글 및 댓글의 답글 등록
	@RequestMapping(value="/customer/newsBoard/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			NewsReply dto,
			HttpSession session
			){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		dto.setUserId(info.getUserId());
		int result = service.insertReply(dto);
		if(result == 0) 
			state = "false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//댓글 및 댓글의 답글 삭제
	@RequestMapping(value="/newsBoard/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			) {
		String state = "true";
		service.deleteReply(paramMap);
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		
		return map;
	}
	
	//댓글의 답글 리스트
	@RequestMapping(value="/newsBoard/listReplyAnswer")
	public String listReplyAnwer(
			@RequestParam(value="replyNum") int answer
			,Model model) {
		List<NewsReply> listAnswer = service.listReplyAnswer(answer);
		for(NewsReply dto : listAnswer) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		model.addAttribute("listAnswer", listAnswer);
		
		return "newsBoard/listReplyAnswer";
	}
	
	// 댓글의 답글 개수
	@RequestMapping(value="/newsBoard/replyAnswerCount")
	@ResponseBody
	public Map<String, Object> replyCountAnswer(
			@RequestParam(value="replyNum") int answer) {
		int count = service.replyAnswerCount(answer);
		
		Map<String, Object> model = new HashMap<>();
		model.put("answerCount", count);
		
		return model;
	}
	
	// 댓글의 좋아요/싫어요 
	@RequestMapping(value="/newsBoard/insertreplyLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReplyLike(
			@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		String state = "true";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		
		paramMap.put("userId", info.getUserId());
		int result = service.insertReplyLike(paramMap);
		if(result == 0) {
			state = "false";
		} else {
			Map<String, Object> countMap = service.replyLikeCount(paramMap);
			
			int likeCount = ((BigDecimal)countMap.get("LIKECOUNT")).intValue();
			int disLikeCount = ((BigDecimal)countMap.get("DISLIKECOUNT")).intValue();
			model.put("likeCount", likeCount);
			model.put("disLikeCount", disLikeCount);
		}
		
		model.put("state", state);
		return model;
	}
}
