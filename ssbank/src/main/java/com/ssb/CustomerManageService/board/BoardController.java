package com.ssb.CustomerManageService.board;

import java.net.URLDecoder;
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

@Controller("customerManageService.boardController")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customerManageService/board/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception{
		int rows = 10;
		int total_page;
		int dataCount;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String , Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		
		List<Board> list = service.listBoard(map);
		
		// 글번호 만들기
		int listNum, n = 0;
		Iterator<Board> it = list.iterator();
		while(it.hasNext()) {
			Board data = it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}	
		
		// ajax(인수 2개짜리)
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);
		model.addAttribute("total_page", total_page);
		
		return "customerManageService/board/list";
	}
	
	@RequestMapping(value="/customerManageService/board/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception{
		
		model.addAttribute("pageNo", 1);
		model.addAttribute("mode", "created");
		
		return "customerManageService/board/created";
	}
	
	@RequestMapping(value="/customerManageService/board/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Board dto,
			HttpSession session) throws Exception{
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		String state = "true";
		
		dto.setUserId(info.getUserId());
		service.insertBoard(dto, "created");
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customerManageService/board/article")
	public String article(
			@RequestParam(value="boardNum") int boardNum,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo") String page,
			HttpServletRequest req,
			Model model
			) throws Exception{
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		service.updateHitCount(boardNum);
		
		Board dto = service.readBoard(boardNum);
		if(dto == null)	{
			return "customerManageService/error";
		}
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("serachValue", searchValue);
		map.put("groupNum", dto.getGroupNum());
		map.put("orderNo", dto.getOrderNo());
		
		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("pageNo", page);
		
		return "customerManageService/board/article";
	}
	
	@RequestMapping(value="/customerManageService/board/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="boardNum") int boardNum,
			@RequestParam(value="pageNo") String page,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info =(SessionInfo)session.getAttribute("member");
		Board dto = service.readBoard(boardNum);
		if(dto == null) {
			return "customerManageService/error";
		}
		
		if(!info.getUserId().equals(dto.getUserId()))	{
			return "customerManageService/error";
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", page);
		model.addAttribute("dto", dto);
		
		return "customerManageService/board/created";
	}
	
	@RequestMapping(value="/customerManageService/board/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Board dto,
			HttpSession session) throws Exception{
		
		String state = "true";
		
		service.updateBoard(dto);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customerManageService/board/reply", method=RequestMethod.GET)
	public String replyForm(
			@RequestParam(value="boardNum") int boardNum,
			@RequestParam(value="pageNo") String page,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(!info.getUserId().equals("admin")) {
			return "customerManageService/error";
		}
		
		Board dto = service.readBoard(boardNum);
		if(dto == null) {
			return "customerManageService/error";
		}
		
		String str = "[" + dto.getSubject() +"] 에 대한 답변입니다.\n";
		dto.setContent(str);
		
		model.addAttribute("dto", dto);
		model.addAttribute("pageNo", page);
		model.addAttribute("mode", "reply");
		
		return "customerManageService/board/created";
	}
	
	@RequestMapping(value="/customerManageService/board/reply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> replySubmit(
			Board dto,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		dto.setUserId(info.getUserId());
		service.insertBoard(dto, "reply");
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	
	public Map<String, Object> delete(
			@RequestParam int boardNum,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		Board dto = service.readBoard(boardNum);
		if(dto != null) {
			if(info.getUserId().equals("admin") || info.getUserId().equals(dto.getUserId())) {
				service.deleteBoard(boardNum);
			} else {
				state = "false";
			}
		} else {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	
	
	
	
	
	
	
	
	
}
