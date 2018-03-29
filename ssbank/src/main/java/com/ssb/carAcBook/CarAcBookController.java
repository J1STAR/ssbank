package com.ssb.carAcBook;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssb.accountBook.AccountBook;
import com.ssb.common.MyExcelView;
import com.ssb.member.SessionInfo;

@Controller("carAcBook.carAcBookController")
public class CarAcBookController {

	@Autowired
	private CarAcBookService service;

	@Autowired
	private MyExcelView excel;

	// 차계부 메인
	@RequestMapping(value = "/acBookNcarBook/carAcBook", method = RequestMethod.GET)
	public String carAcBook(HttpSession session, Model model) {

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());

		List<CarAcBook> myCarList = service.myCarList(map);
		List<CarAcBook> carModelList = service.carModelList(map);

		model.addAttribute("myCarList", myCarList);
		model.addAttribute("carModelList", carModelList);

		return ".carAcBook.cbcommon";
	}

	// 기록. AJAX
	@RequestMapping(value = "/acBookNcarBook/record")
	public String carAcBookRecord(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());
		
		List<CarAcBook> myRecordList = service.myRecordList(map);
		
		model.addAttribute("myRecordList", myRecordList);

		return "carAcBook/record";
	}

	// 통계. AJAX
	@RequestMapping(value = "/acBookNcarBook/stat")
	public String carAcBookStat(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());

		return "carAcBook/stat";
	}

	// 내 차 점검. AJAX
	@RequestMapping(value = "/acBookNcarBook/check")
	public String carAcBookCheck(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());


		return "carAcBook/check";
	}

	// 정비목록. AJAX
	@RequestMapping(value = "/acBookNcarBook/relist")
	public String carAcBookRelist(HttpSession session, Model model) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map = new HashMap<>();

		map.put("memberIdx", info.getMemberIdx());

		return "carAcBook/relist";
	}
	
	//AJAX 입력
		@RequestMapping(value = "/acBookNcarBook/insertCarAcBook", method=RequestMethod.POST)
		@ResponseBody
		public Map<String, Object> insertCarAcBook(CarAcBook dto, HttpSession session) {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String state="true";
			
			dto.setMemberIdx(info.getMemberIdx());
			int result=service.insertCarAcBook(dto);
			if(result == 0)
				state="false";
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}

}
