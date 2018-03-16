package com.ssb.sale;

import java.io.File;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.net.URLEncoder;

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
import com.ssb.sale.Sale;

@Controller("sale.saleController")
public class SaleController {
	@Autowired
	private SaleService service;
	
	@Autowired
	private MyUtil myutil;
	
	@Autowired
	private  FileManager filemanager;
	
	

	@RequestMapping(value = "/sale/raa-0001")
	public String saleList(@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,HttpServletRequest req,Model model) throws Exception{
		String cp = req.getContextPath();
		int rows=10;
		int total_page=0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0)
			total_page = myutil.pageCount(rows, dataCount);
		
		
		if(total_page < current_page)
		current_page = total_page;
		
		
		int start = (current_page -1 ) * rows + 1;
		int end = current_page * rows;
		map.put("start", start);
		map.put("end", end);
		
		
		List<Sale> list = service.listSale(map);
		
		int listNum, n = 0;
		Iterator<Sale> it = list.iterator();
		while(it.hasNext()) {
			Sale data = it.next();
			listNum = dataCount - (start + n -1);
			data.setListNum(listNum);
			n++;
		}
		
		String query = "";
		String listUrl = cp + "/sale/list";
		String articleUrl = cp + "/sale/raa-0001?page=" + current_page;
		if(searchValue.length()!=0) {
			query = "searchKey=" + searchKey + "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");
		}
		
		if(query.length()!=0) {
			listUrl = listUrl + "?" + query;
			articleUrl = articleUrl+ "&" + query;
		}
		
		String paging = myutil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".sale.raa-0001";

	}
	@RequestMapping(value="/sale/article")
	public String article(
			@RequestParam(value="saleIdx") int saleIdx,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		String query = "page=" + page;
		if(searchValue.length()!=0) {
			query += "&searchKey=" + searchKey + "&searchValue=" + searchValue;
		}
		searchValue = URLDecoder.decode(searchValue, "utf-8");
		
		service.updateHitSale(saleIdx);
		
		//해당 레코드 가져오기
		Sale dto = service.readSale(saleIdx);
		if(dto == null)
			return "redirect:/sale/raa-0001?" + query;
		
		dto.setAddr1(myutil.htmlSymbols(dto.getAddr1()));
		
		// 이전글, 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("saleIdx", saleIdx);
		
		Sale preReadDto = service.preReadSale(map);
		Sale nextReadDto = service.nextReadSale(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".sale.raa-0001";
	}

	@RequestMapping(value = "/sale/raa-0002")
	public String saleInsertMain() {
		return ".sale.raa-0002";
	}

	@RequestMapping(value = "/sale/raa-0003")
	public String cheongYak() {
		return ".sale.raa-0003";
	}

	@RequestMapping(value = "/sale/insert", method=RequestMethod.GET)
	public String saleCreatedForm(Model model) {
		
		model.addAttribute("mode", "created");
		return ".sale.raa-0005";
	}
	@RequestMapping(value="/sale/created", method=RequestMethod.POST)
	public String createdSubmit(
			Sale dto,
			HttpSession session
			) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		
		String pathname=root+"uploads"+File.separator+"sale";

		service.insertSale(dto, pathname);
		
		return "redirect:/sale/raa-0001";
	}
	
	@RequestMapping(value="/sale/update", method=RequestMethod.GET)
	public String updateSaleFom(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		
		Sale dto = service.readSale(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");		
		
		return ".sale.created";
	}
	@RequestMapping(value="/sale/update", 
			method=RequestMethod.POST)
	public String updateSubmit(
			Sale dto, 
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"sale";		
		// 수정 하기
		service.updateSale(dto, pathname);
		
		return "redirect:/sale/list?page="+page;
	}

	@RequestMapping(value="/sale/delete")
	public String delete(
			@RequestParam int num,
			HttpSession session) throws Exception {
		
		String root=session.getServletContext().getRealPath("/");
		String pathname=root+"uploads"+File.separator+"sale";
		
		service.deleteSale(num, pathname);
		return "redirect:/sale/list";
	}
}
