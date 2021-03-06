package com.ssb.counsel;

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

@Controller("counsel.counselController")
public class CounselController {
	
	@Autowired
	private CounselService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/counsel")
	public String main() throws Exception {
		return ".counsel.main";
	}
	//상품에서 갈 경우
	@RequestMapping(value="/counsel/product")
	public String product(@RequestParam int categoryIdx,Model model) throws Exception {
		model.addAttribute("categoryP",categoryIdx);
		return ".counsel.main";
	}
	
	@RequestMapping(value="/counsel/list")
	public String list(
			@RequestParam(value="categoryIdx",defaultValue="4")int categoryIdx
			,@RequestParam(value="pageNo",defaultValue="1")int current_page
			,HttpServletRequest req,Model model,HttpSession session 
			) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		int rows=10;
		int total_page=0;
		int dataCount=0;
		
	
		
		Map<String, Object> map = new HashMap<>();
		map.put("categoryIdx", categoryIdx);
		map.put("memberIdx", info.getMemberIdx());
		
		
		dataCount= service.dataCount(map);
		System.out.println("dataCount : controller"+dataCount);
		if(dataCount>0) {
			total_page=myUtil.pageCount(rows, dataCount);
		}
		if(current_page>total_page) {
			current_page=total_page;
		}
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Counsel> list=service.listCounsel(map);
		
		int listNum,n=0;
		Iterator<Counsel> it = list.iterator();
		while(it.hasNext()) {
			Counsel dto= it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list",list);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("dataCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		model.addAttribute("categoryIdx",categoryIdx);
		return"counsel/cpc-0001";
	}
	
	@RequestMapping(value="counsel/article")
	public String article(
			@RequestParam int categoryIdx
			,@RequestParam int boardIdx
			,@RequestParam int pageNo
			,@RequestParam(defaultValue="subject") String searchKey
			,@RequestParam(defaultValue="") String searchValue
			,HttpServletRequest req
			,Model model
			,HttpSession session
			) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		searchValue=URLDecoder.decode(searchValue, "utf-8");
		//조회수 올리기
		service.updateHitCount(boardIdx);
		//글 가져오기
		Counsel dto=service.readBoard(boardIdx);
		if(dto==null)
			return list(categoryIdx,pageNo, req, model,session);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardIdx",boardIdx);
		map.put("memberIdx", info.getMemberIdx());
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		
		model.addAttribute("dto",dto);
		
		
		return "counsel/cpc-0002";
	}
	
	@RequestMapping(value="counsel/created",method=RequestMethod.GET)
	public String insertFrom(@RequestParam int categoryIdx,Model model,HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		model.addAttribute("categoryIdx",categoryIdx);
		model.addAttribute("memberIdx",info.getMemberIdx());
		model.addAttribute("name",info.getUserName());
		model.addAttribute("mode","created");
		return "counsel/cpc-0003";
	}
	
	@RequestMapping(value="counsel/created",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertSubmit(
			Counsel dto
			,HttpServletRequest req,
			HttpSession session
			) throws Exception {
		
		int result =service.insertBoard(dto);
		String state="success";
		if(result==0) state="fail";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/counsel/replyList")
	public String replyList(
			@RequestParam int categoryIdx
			,@RequestParam int boardIdx
			,@RequestParam(value="pageNo", defaultValue="1") int current_page
			,Model model,HttpSession session
			) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		int rows=5;
		int total_page=0;
		int dataCount=0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("boardIdx", boardIdx);
		dataCount = service.replyCount(map);
		total_page=myUtil.pageCount(rows, dataCount);
		if(current_page >total_page) current_page=total_page;
		
		int start =(current_page-1)*rows+1;
		int end = current_page*rows;
		
		map.put("start", start);
		map.put("end", end);
		List<Reply> listReply = service.listReply(map);
		for(Reply dto:listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("userName",info.getUserName());
		model.addAttribute("listReply",listReply);
		model.addAttribute("categoryIdx",categoryIdx);
		model.addAttribute("pageNo",current_page);
		model.addAttribute("replyCount",dataCount);
		model.addAttribute("total_page",total_page);
		model.addAttribute("paging",paging);
		
		return "counsel/cpc-0004";
	}
	
	@RequestMapping(value="/counsel/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			){
		
		SessionInfo info =(SessionInfo) session.getAttribute("member");
		String state="ture";
		
		dto.setMemberIdx(info.getMemberIdx());
		int result=service.insertReply(dto);
		if(result==0) state="false";
		
		Map<String, Object> model= new HashMap<>();
		model.put("state",state);
		
		return model;
	}
	
	@RequestMapping(value="/counsel/deleteReply",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			){
		String state = "true";
		service.deleteReply(paramMap);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/counsel/delete")
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam Map<String, Object> paramMap
			){
		String state = "true";
		service.deleteBoardReply(paramMap);
		service.deleteBoard(paramMap);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
}
