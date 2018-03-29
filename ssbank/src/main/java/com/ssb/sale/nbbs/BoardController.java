package com.ssb.sale.nbbs;

import java.io.File;
import java.io.PrintWriter;
import java.net.URLDecoder;
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

@Controller("nbbs.boardController")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;

	@Autowired
	private FileManager fileManager;
	
	@RequestMapping(value="/nbbs")
	public String board() throws Exception {
		return "nbbs/main";
	}

	@RequestMapping(value="/nbbs/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {

		int rows=10;
		int total_page=0;
		int dataCount=0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue=URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map=new HashMap<>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount=service.dataCount(map);
		if(dataCount>0)
			total_page=myUtil.pageCount(rows, dataCount);
		
		if(current_page > total_page)
			current_page=total_page;
		
		int start=(current_page-1)*rows+1;
		int end=current_page*rows;
		map.put("start", start);
		map.put("end", end);
		
		List<Board> list=service.listBoard(map);
		
		int listNum, n=0;
		Iterator<Board> it=list.iterator();
		while(it.hasNext()) {
			Board dto=it.next();
			listNum=dataCount-(start+n-1);
			dto.setListNum(listNum);
			n++;
		}
		
		String paging=myUtil.pagingMethod(current_page, total_page, "listPage");
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("searchKey", searchKey);
		model.addAttribute("searchValue", searchValue);
		
        return "nbbs/list";
	}
	
	@RequestMapping(value="/nbbs/created", method=RequestMethod.GET)
	public String createdForm(
			Model model) throws Exception {
		model.addAttribute("mode", "created");
		return "nbbs/created";
    }
	
	@RequestMapping(value="/nbbs/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Board dto,
			HttpServletRequest req,
			HttpSession session
			) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"nbbs";
		
		dto.setIpAddr(req.getRemoteAddr());
		
		int result=service.insertBoard(dto, pathname);
		String state="success";
		if(result==0)
			state="fail";
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
    }
	
	@RequestMapping(value="/nbbs/article")
	public String article(
			@RequestParam int num,
			@RequestParam int pageNo,
			@RequestParam(defaultValue="subject") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {
		
		searchValue=URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitCount(num);
		Board dto=service.readBoard(num);
		if(dto==null)
			return list(pageNo, searchKey, searchValue, req, model);
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		Map<String, Object> map=new HashMap<>();
		map.put("num", num);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		Board preReadDto=service.preReadBoard(map);
		Board nextReadDto=service.nextReadBoard(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		return "nbbs/article";
	}
	
	@RequestMapping(value="/nbbs/delete")
	@ResponseBody
	public Map<String, Object>  delete(
			@RequestParam int num,
			@RequestParam(defaultValue="") String saveFilename,
			HttpSession session
			) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"nbbs";
		
		// 자료 삭제
		int result=service.deleteBoard(num, pathname, saveFilename);

		String state="success";
		if(result==0)
			state="fail";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
    }
	
	@RequestMapping(value="/nbbs/update", method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") int pageNo,
			@RequestParam(defaultValue="subject") String searchKey,
			@RequestParam(defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model
			) throws Exception {

		Board dto = service.readBoard(num);
		if(dto==null) {
			return list(pageNo, searchKey, searchValue, req, model);
		}

		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);

		return "nbbs/created";
	}
	
	@RequestMapping(value="/nbbs/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			Board dto,
			HttpSession session
			) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"nbbs";
		
		int result=service.updateBoard(dto, pathname);
    	
		String state="success";
		if(result==0)
			state="fail";
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
    }
	
	@RequestMapping(value="/nbbs/download")
	public void download(
			@RequestParam(value="num") int num,
			HttpServletResponse resp,
			HttpSession session
			) throws Exception{
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+File.separator+"uploads"+File.separator+"nbbs";
		Board dto=service.readBoard(num);
		boolean flag=false;
		
		if(dto!=null) {
			flag=fileManager.doFileDownload(
					     dto.getSaveFilename(), 
					     dto.getOriginalFilename(), pathname, resp);
		}
		
		if(! flag) {
			resp.setContentType("text/html;charset=utf-8");
			PrintWriter out=resp.getWriter();
			out.print("<script>alert('파일 다운로드가 실패했습니다.');history.back();</script>");
		}
	}
}
