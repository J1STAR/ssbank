package com.ssb.regularQuestion;

import java.net.URLDecoder;
import java.util.HashMap;
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

@Controller("regularQuestion.inquiryController2")
public class InquiryController2 {
	@Autowired
	private InquiryService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value="/customerCounsel/regularQuestion/list")
	public String list(
			@RequestParam(value="pageNo", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
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
        map.put("memberIdx", info.getMemberIdx());

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows,  dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 글 리스트
        List<Inquiry> list = service.listInquiry(map);
        
        // ajax(인수 2개 짜리)
        String paging = myUtil.paging(current_page, total_page);
		
		model.addAttribute("list", list);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		
		
		return "customerCounsel/regularQuestion/list";
	}
	
	
	@RequestMapping(value="/customerCounsel/regularQuestion/created", method=RequestMethod.GET)
	public String createdForm(Model model) {
		model.addAttribute("pageNo", "1");
		model.addAttribute("mode", "created");
		return "customerCounsel/regularQuestion/created";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/created", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> createdSubmit(
			Inquiry dto,
			HttpSession session) throws Exception{
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		
		dto.setMemberIdx(info.getMemberIdx());
		service.insertInquiry(dto, "created");
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/article")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="pageNo") String page,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		Inquiry dto = service.readInquiry(num);
		if(dto==null) {
			return "customerCounsel/customerManageService/error";
		}
		
		if(! info.getUserId().equals("admin") && ! info.getUserId().equals(dto.getUserId())) {
			return "customerCounsel/customerManageService/error";
		}
		
		 List<Inquiry> list = service.relationInquiry(num);
		 for(Inquiry vo:list) {
			 vo.setContent(myUtil.htmlSymbols(vo.getContent()));
		 }
		
		 model.addAttribute("list", list);
		 model.addAttribute("dto", dto);
		 model.addAttribute("pageNo", page);
		 
		return "customerCounsel/regularQuestion/article";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/update", method=RequestMethod.GET)
	public String updateForm(
			Model model) throws Exception{
		model.addAttribute("mode", "update");
		return "customerCounsel/regularQuestion/created";
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/update", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateSubmit(
			) throws Exception{

		
		String state="true";
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
		
	}
	
	@RequestMapping(value="/customerCounsel/regularQuestion/delete")
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session) throws Exception{

		SessionInfo info=(SessionInfo)session.getAttribute("member");
		String state="true";
		Inquiry dto = service.readInquiry(num);
		if(dto!=null) {
			if(info.getUserId().equals("admin") || info.getUserId().equals(dto.getUserId())) {
				service.deleteInquiry(num);
			} else {
				state="false";
			}
		} else {
			state="false";
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("state", state);
		return model;
	}
}
