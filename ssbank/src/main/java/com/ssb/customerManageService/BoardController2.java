package com.ssb.customerManageService;

import java.io.File;
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

import com.ssb.common.FileManager;
import com.ssb.common.MyUtil;
import com.ssb.member.SessionInfo;

@Controller("customerManageService.boardController2")
public class BoardController2 {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/customerCounsel/customerManageService/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		int rows = 10; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);
        map.put("categoryIdx", 9);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;
/*
        // 1페이지인 경우 공지리스트 가져오기
        List<Board> noticeList = null;
        if(current_page==1) {
          noticeList=service.listBoardTop();
        }*/
        
        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 글 리스트
        List<Board> list = service.listBoard(map);

        // 리스트의 번호
        int listNum, n = 0;
        Iterator<Board> it=list.iterator();
        while(it.hasNext()) {
            Board data = (Board)it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            n++;
        }
        
        // ajax(인수 2개 짜리)
        String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "customerCounsel/customerManageService/list";
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/created", method=RequestMethod.GET)
	public String createdForm(
			Model model
			) throws Exception {

		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		return "customerCounsel/customerManageService/created";
	}

	@RequestMapping(value="/customerCounsel/customerManageService/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Board dto,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		if(info.getUserId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "customerManageService";		
			
			dto.setMemberIdx(info.getMemberIdx());
			service.insertBoard(dto, pathname);
		} else {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/article")
	public String article(
			@RequestParam(value="boardIdx") int boardIdx,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam(value="pageNo") String page,
			HttpServletRequest req,
			Model model) throws Exception {

		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		service.updateHitCount(boardIdx);

		Board dto = service.readBoard(boardIdx);
		if(dto==null) {
			return "customerCounsel/customerManageService/error";
		}
		
        dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
         
		// 이전 글, 다음 글
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
		model.addAttribute("pageNo", page);
		
		return "customerCounsel/customerManageService/article";
	}
	
	@RequestMapping(value="/customerCounsel/customerManageService/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="boardIdx") int boardIdx,
			@RequestParam(value="pageNo") String page,
			HttpSession session,			
			Model model	) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		Board dto = service.readBoard(boardIdx);
		if(dto==null) {
			return "customerCounsel/customerManageService/error";
		}

		if(! info.getUserId().equals(dto.getUserId())) {
			return "customerCounsel/customerManageService/error";
		}
		
			
		model.addAttribute("mode", "update");
		model.addAttribute("pageNo", page);
		model.addAttribute("dto", dto);
		
		return "customerCounsel/customerManageService/created";
	}

	@RequestMapping(value="/customerCounsel/customerManageService/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Board dto,
			HttpSession session) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		if(info.getUserId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "customerManageService";		
	
			dto.setMemberIdx(info.getMemberIdx());
			service.updateBoard(dto, pathname);
		} else {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}

	@RequestMapping(value="/customerCounsel/customerManageService/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int boardIdx,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		
		service.deleteBoard(boardIdx);
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
