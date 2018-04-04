package com.ssb.sale;

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

@Controller("sale.saleController")
public class SaleController {
	@Autowired
	private SaleService service;
	
	@Autowired
	private MyUtil myutil;
	


	@RequestMapping(value = "/sale/raa-0001")
	public String saleListMain(Model model
			) throws Exception{
		
		List<Sale> list=service.cityCount();
		
		model.addAttribute("list",list);
		
		
		return ".sale.raa-0001";
	}
	
	@RequestMapping(value = "/sale/saleList")
	public String saleList(@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="sortType", defaultValue="1") String sortType,
			@RequestParam(value="searchKey", defaultValue="addr") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			@RequestParam String modeIdx,
			@RequestParam(value="modeType", defaultValue="1") String modeType
			,HttpServletRequest req,Model model) throws Exception{

		int rows=10;
		int total_page=0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("modeType", modeType);
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("sortType", sortType);
		map.put("modeIdx", modeIdx);
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
		

		String paging = myutil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "sale/saleList";

	}
	
	
	@RequestMapping(value="/sale/article")
	public String article(
			@RequestParam(value="saleIdx") int saleIdx,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			Model model) throws Exception {
		

		// 해당 레코드 가져 오기
		Sale dto = service.readSale(saleIdx);
		/*
        dto.setContent(MyUtil.htmlSymbols(dto.getContent()));*/
        
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("saleIdx", saleIdx);

		Sale preReadDto = service.preReadSale(map);
		Sale nextReadDto = service.nextReadSale(map);
        
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);


        return "sale/article";
	}

	@RequestMapping(value = "/sale/raa-0002")
	public String saleSoldMain(Model model) throws Exception{


		int dataCount = 0;
		int sellDataCount=0;
		int buyDataCount=0;
		

		Map<String, Object> map = new HashMap<String, Object>();
		dataCount = service.totalDataCount(map);
		sellDataCount =service.sellDataCount(map);
		buyDataCount =service.buyDataCount(map);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("sellDataCount", sellDataCount);
		model.addAttribute("buyDataCount", buyDataCount);
		
		return ".sale.raa-0002";
	}
	@RequestMapping(value = "/sale/raa-0003")
	public String cheongYak() {
		return ".sale.raa-0003";
	}
	@RequestMapping(value = "/sale/chy-0001")
	public String cheongYaklist() {
		return ".sale.chy-0001";
	}

	@RequestMapping(value = "/sale/raa-0005", method=RequestMethod.GET)
	public String saleCreatedForm(Model model, @RequestParam String mode) {
		
		model.addAttribute("mode", mode);
		return ".sale.raa-0005";
	}
	
	@RequestMapping(value="/sale/created", method=RequestMethod.POST)
	public String createdSubmit(
			Sale dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		dto.setMemberIdx(info.getMemberIdx());
		
		
			service.insertSale(dto);
		
		return ".sale.raa-0006";
	}
	
	@RequestMapping(value="/sale/update", method=RequestMethod.GET)
	public String updateSaleForm(
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

		service.updateSale(dto);
		
		return "redirect:/sale/list?page="+page;
	}

	@RequestMapping(value="/sale/delete")
	public String delete(
			@RequestParam int num,
			HttpSession session) throws Exception {

		service.deleteSale(num);
		return "redirect:/sale/list";
	}
	@RequestMapping(value="/sale/raa-0007")
	public String saleAllList() {
		
		return ".sale.raa-0007";
	}
}
