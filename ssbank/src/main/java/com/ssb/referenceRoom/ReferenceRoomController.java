package com.ssb.referenceRoom;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

@Controller("referenceRoom.referenceRoomController")
public class ReferenceRoomController {
	@Autowired
	private ReferenceRoomService service;
	@Autowired
	private MyUtil myUtil;
	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/customer/referenceRoom/list")
	public String list(
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
		map.put("categoryIdx", 8);
		
		dataCount = service.dataCount(map);
		if(dataCount!=0)
			total_page = myUtil.pageCount(rows, dataCount);
		
		if(total_page < current_page)
			current_page = total_page;
		
		int start = (current_page -1)* rows +1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		List<ReferenceRoom> list = service.listReferenceRoom(map);
		
		int listNum, n = 0;
		Iterator<ReferenceRoom> it = list.iterator();
		while(it.hasNext()) {
			ReferenceRoom data = (ReferenceRoom)it.next();
			listNum = dataCount - (start + n - 1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/customer/referenceRoom/list";
		String articleUrl = cp + "/customer/referenceRoom/article?page=" + current_page;
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
		
		return ".customer.referenceRoom.list";
	}
	
	@RequestMapping(value="/customer/referenceRoom/write", method=RequestMethod.GET)
	public String createdForm(Model model) throws Exception {
		List<ReferenceRoom> listCategory = service.listCategory();
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("mode", "write");
		
		return ".customer.referenceRoom.created";
	}
	
	@RequestMapping(value="/customer/referenceRoom/write", method=RequestMethod.POST)
	public String createdSubmit(
			ReferenceRoom dto,
			HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "referenceRoom";
			
		dto.setUserId(info.getUserId());
		dto.setMemberIdx(info.getMemberIdx());
		service.insertReferenceRoom(dto, pathname);
		
		return "redirect:/customer/referenceRoom/list";
	}
	
	
	@RequestMapping(value="/customer/referenceRoom/article")
	public String article(
			@RequestParam(value="boardIdx") int boardIdx,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model, HttpServletRequest req) throws Exception {
		String query = "page=" + page;
		if(searchValue.length()!=0) {
			query += "*searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitCount(boardIdx);
		
		ReferenceRoom dto = service.readReferenceRoom(boardIdx);
		if(dto == null)
			return "redirect:/customer/referenceRoom/list?" +query;
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("boardIdx", boardIdx);
		map.put("categoryIdx", 8);
		
		ReferenceRoom preReadDto = service.preReadReferenceRoom(map);
		ReferenceRoom nextReadDto = service.nextReadReferenceRoom(map);
		
		List<ReferenceRoom> listFile = service.listFile(boardIdx);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile", listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		
		return ".customer.referenceRoom.article";
	}
	
	@RequestMapping(value="/customer/referenceRoom/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		ReferenceRoom dto = service.readReferenceRoom(boardIdx);
		
		if(dto == null) {
			return "redirect:/customer/referenceRoom/list?page=" + page;
		}
		
		if(!info.getUserId().equals(dto.getUserId())) {
			return "redirect:/customer/referenceRoom/list?page=" + page;
		}
		
		List<ReferenceRoom> listCategory = service.listCategory();
		List<ReferenceRoom> listFile = service.listFile(boardIdx);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("listFile", listFile);
		
		return ".customer.referenceRoom.created";
	}
	
	@RequestMapping(value="/customer/referenceRoom/update", method=RequestMethod.POST)
	public String updateSubmit(
			ReferenceRoom dto,
			@RequestParam String page,
			HttpSession session) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "referenceRoom";		
	
		service.updateReferenceRoom(dto, pathname);
		
		return "redirect:/customer/referenceRoom/noticeList?page=" + page;
	}
	
	@RequestMapping(value="/customer/referenceRoom/delete")
	public String delete(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "referenceRoom";
		
		service.deleteReferenceRoom(boardIdx, pathname, info.getUserId());
		
		return "redirect:/customer/referenceRoom/list?page="+page;
	}
	
	@RequestMapping(value="/customer/referenceRoom/download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "referenceRoom";

		boolean b = false;
		
		ReferenceRoom dto = service.readFile(fileNum);
		if(dto!=null) {
			String saveFileName = dto.getSaveFileName();
			String originalFileName = dto.getOriginalFileName();
			
			b = fileManager.doFileDownload(saveFileName, originalFileName, pathname, resp);
		}
		
		if (!b) {
			try {
				resp.setContentType("text/html; charset=utf-8");
				PrintWriter out = resp.getWriter();
				out.println("<script>alert('파일 다운로드가 불가능 합니다 !!!');history.back();</script>");
			} catch (Exception e) {
			}
		}
	}
	
	@RequestMapping(value="/customer/referenceRoom/deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileIdx,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "referenceRoom";
		
		ReferenceRoom dto=service.readFile(fileIdx);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFileName(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "fileIdx");
		map.put("value", fileIdx);
		service.deleteFile(map);
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("state", "true");
		return model;
	}
	
	
	
	
	
	
	
	
}
