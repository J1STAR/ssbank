package com.ssb.customerVoice;

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

@Controller("customerVoice.counselVoiceController")
public class CounselVoiceController {
	
	@Autowired
	private CounselVoiceService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customerCounsel/customerVoice/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{
		int rows = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
		map.put("categoryIdx", 10);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(rows, dataCount);
		}
		
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<CounselVoice> list = service.listBoard(map);
		
		int listNum, n = 0;
		Iterator<CounselVoice> it = list.iterator();
		while(it.hasNext()) {
			CounselVoice dto = (CounselVoice)it.next();
			listNum = dataCount - (start + n - 1);
			dto.setListNum(listNum);
			n++;
		}
		String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("pagNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "/customerCounsel/customerVoice/list";
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception{
		
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		
		return "/customerCounsel/customerVoice/created";
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSumbit(
			CounselVoice dto,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setMemberIdx(info.getMemberIdx());
		service.insertBoard(dto);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/article")
	public String article(
			@RequestParam(value="boardIdx") int boardIdx,
			@RequestParam(value="pageNo") String page,
			@RequestParam(value="searchKey",defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception{
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		service.updateHitCount(boardIdx);
		
		CounselVoice dto = service.readBoard(boardIdx);
		if(dto==null) 
			return "customerCounsel/error";
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("boardIdx", boardIdx);
		map.put("categoryIdx", 10);
		
		model.addAttribute("pageNo", page);
		model.addAttribute("dto", dto);
		
		return "/customerCounsel/customerVoice/article";
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int boardIdx,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		service.deleteBoard(boardIdx);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/replyList")
	public String listReply(
			@RequestParam int boardIdx,
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			Model model
			) {
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardIdx", boardIdx);
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page>total_page)
			current_page = total_page;
		
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		List<ReplyVoice> listReply = service.listReply(map);
		
		for(ReplyVoice dto: listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "replyList");
		
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "customerCounsel/customerVoice/replyList";
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			ReplyVoice dto,
			HttpSession session
			) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		dto.setMemberIdx(info.getMemberIdx());
		int result = service.insertReply(dto);
		if(result==0)
			state = "false";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customerCounsel/customerVoice/deleteReply", method=RequestMethod.POST)
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
	
	
	
	
}
