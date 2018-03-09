package com.ssb.sale.bbs;

import java.io.File;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.ssb.sale.bbs.Board;
import com.ssb.common.FileManager;
import com.ssb.common.MyUtil;
import com.ssb.member.SessionInfo;

@Controller("sale.bbs.boardController")
public class BoardController {
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value="/sale/bbs/list")
	public String list(
			@RequestParam(value="page", defaultValue="1") int current_page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpServletRequest req,
			Model model) throws Exception {
		
   	    String cp = req.getContextPath();
   	    
		int rows = 1; // 한 화면에 보여주는 게시물 수
		int total_page = 0;
		int dataCount = 0;
   	    
		if(req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			searchValue = URLDecoder.decode(searchValue, "utf-8");
		}
		
        // 전체 페이지 수
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("searchKey", searchKey);
        map.put("searchValue", searchValue);

        dataCount = service.dataCount(map);
        if(dataCount != 0)
            total_page = myUtil.pageCount(rows, dataCount) ;

        // 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
        if(total_page < current_page) 
            current_page = total_page;

        // 리스트에 출력할 데이터를 가져오기
        int start = (current_page - 1) * rows + 1;
        int end = current_page * rows;
        map.put("start", start);
        map.put("end", end);

        // 글 리스트
        List<Board> list = service.listBoard(map);

        // 리스트의 번호
        Date endDate = new Date();
        long gap;
        int listNum, n = 0;
        Iterator<Board> it=list.iterator();
        while(it.hasNext()) {
            Board data = (Board)it.next();
            listNum = dataCount - (start + n - 1);
            data.setListNum(listNum);
            
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date beginDate = formatter.parse(data.getCreateDate());
/*            
            // 날짜차이(일)
            gap=(endDate.getTime() - beginDate.getTime()) / (24 * 60 * 60* 1000);
            data.setGap(gap);
*/
         // 날짜차이(시간)
            gap=(endDate.getTime() - beginDate.getTime()) / (60*60* 1000);
            data.setGap(gap);
            
            data.setCreateDate(data.getCreateDate().substring(0, 10));
            
            n++;
        }
        
        String query = "";
        String listUrl = cp+"/sale/bbs/list";
        String articleUrl = cp+"/sale/bbs/article?page=" + current_page;
        if(searchValue.length()!=0) {
        	query = "searchKey=" +searchKey + 
        	         "&searchValue=" + URLEncoder.encode(searchValue, "utf-8");	
        }
        
        if(query.length()!=0) {
        	listUrl = cp+"/sale/bbs/list?" + query;
        	articleUrl = cp+"/sale/bbs/article?page=" + current_page + "&"+ query;
        }
        
        String paging = myUtil.paging(current_page, total_page, listUrl);

        model.addAttribute("list", list);
        model.addAttribute("articleUrl", articleUrl);
        model.addAttribute("page", current_page);
        model.addAttribute("dataCount", dataCount);
        model.addAttribute("total_page", total_page);
        model.addAttribute("paging", paging);		
		
		return ".sale.bbs.list";
	}
	
	@RequestMapping(value="/sale/bbs/created", method=RequestMethod.GET)
	public String createdForm(
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		} //로그인 안되었으면 로그인되게 하고
		
		if(! info.getUserId().equals("admin")) {
			return "redirect:/sale/bbs/list";
		} //어드민만
		
		model.addAttribute("mode", "created");
		return ".sale.bbs.created";
	}
	
	@RequestMapping(value="/sale/bbs/created", method=RequestMethod.POST)
	public String createdSubmit(
			Board dto,
			HttpSession session
			) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		if(info.getUserId().equals("admin")) {
		String pathname;
		String root = session.getServletContext().getRealPath("/");
		pathname = root + "uploads" + File.separator + "sale/bbs";
		
		dto.setUserId(info.getUserId());
		System.out.println(root); //root 주소 가져오기
		service.insertBoard(dto, pathname);
		}
		return "redirect:/sale/bbs/list";
	}
	
	@RequestMapping(value="/sale/bbs/article")
	public String article(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			@RequestParam(value="searchKey", defaultValue="subject") String searchKey,
			@RequestParam(value="searchValue", defaultValue="") String searchValue,
			HttpSession session,
			Model model) throws Exception {

		String query="page="+page;
		if(searchValue.length()!=0) {
			query+="&searchKey="+searchKey+"&searchValue="+searchValue;
		}
		
		searchValue = URLDecoder.decode(searchValue, "utf-8");

		service.updateHitCount(num);

		// 해당 레코드 가져 오기
		Board dto = service.readBoard(num);
		if(dto==null)
			return "redirect:/bbs/list?"+query;
		
        dto.setContent(myUtil.htmlSymbols(dto.getContent()));
        
		// 이전 글, 다음 글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", searchKey);
		map.put("searchValue", searchValue);
		map.put("num", num);

		Board preReadDto = service.preReadBoard(map);
		Board nextReadDto = service.nextReadBoard(map);
        
		// 파일
		List<Board> listFile=service.listFile(num);
				
		model.addAttribute("dto", dto);
		model.addAttribute("preReadDto", preReadDto);
		model.addAttribute("nextReadDto", nextReadDto);
		model.addAttribute("listFile",listFile);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

        return ".sale.bbs.article";
	}
	
	@RequestMapping(value="/sale/bbs/update", 
			method=RequestMethod.GET)
	public String updateForm(
			@RequestParam(value="num") int num,
			@RequestParam(value="page") String page,
			HttpSession session,			
			Model model	) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Board dto = service.readBoard(num);
		if(dto==null) {
			return "redirect:/bbs/list?page="+page;
		}
			
		if(! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/list?page="+page;
		}
		List<Board> listFile=service.listFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);
		model.addAttribute("listFile", listFile);
		
		return ".sale.bbs.created";
	}

	@RequestMapping(value="/sale/bbs/update", 
			method=RequestMethod.POST)
	public String updateSubmit(
			Board dto, 
			@RequestParam(value="page") String page,
			HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		if(info==null) {
			return "redirect:/member/login";
		}
		
		if(info.getUserId().equals("admin")) {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + File.separator + "uploads" + File.separator + "notice";		
	
			dto.setUserId(info.getUserId());
			service.updateBoard(dto, pathname);
		} 
		
		return "redirect:/sale/bbs/list?page="+page;
	}
	
	@RequestMapping(value="/sale/bbs/fileDelete")
	public String fileDelete(
			@RequestParam int num,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sale/bbs";
		
		Board dto = service.readBoard(num);
		if(dto==null) {
			return "redirect:/sale/bbs/list?page=" + page;
		}
		if(dto.getSaveFilename() != null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname); //실제파일삭제
			dto.setSaveFilename("");
			dto.setOriginalFilename("");
			service.updateBoard(dto, pathname); //DB 테이블의 파일명 변경(삭제)
		}
		
		return "redirect:/sale/bbs/update?num=" + num + "&page=" + page; //다시 수정으로 back
	}
	
	@RequestMapping(value="/sale/bbs/delete")
	public String delete(
			@RequestParam int boardIdx,
			@RequestParam String page,
			HttpSession session
			) throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "sale/bbs";
		
		service.deleteBoard(boardIdx, pathname, info.getUserId());
		
		return "redirect:/sale/bbs/list?page="+page;
	}
	
	@RequestMapping(value="/sale/bbs/download")
	public void download(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "sale/bbs";

		boolean b = false;
		
		Board dto = service.readFile(fileNum);
		if(dto!=null) {
			String saveFilename = dto.getSaveFilename();
			String originalFilename = dto.getOriginalFilename();
			
			b = fileManager.doFileDownload(saveFilename, originalFilename, pathname, resp);
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
	
	//게시글 좋아요
	@RequestMapping(value="/bbs/insertBoardLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertBoardLike(
			@RequestParam int num
			, HttpSession session
			){
		String state = "true";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		
		if(info == null) {
			state = "loginFail";
		} else {
			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("num", num);
			paramMap.put("userId", info.getUserId());
			int result = service.insertBoardLike(paramMap);
			if(result == 0) {
				state = "false";
			} else {
				int likeBoardCount = service.likeBoardCount(num);
				model.put("likeBoardCount", likeBoardCount);
			}
		}
		
		model.put("state", state);
		return model;
	}
	
	
	//댓글리스트 : AJAX - Text
	@RequestMapping(value="/bbs/listReply")
	public String listReply(
			@RequestParam int num
			, @RequestParam(value="pageNo", defaultValue="1") int current_page
			, Model model
			) {
		int rows = 5;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);

		dataCount = service.replyDataCount(map);
		total_page = myUtil.pageCount(rows, dataCount);
		if(current_page > total_page)
			current_page = total_page;
		int start = (current_page - 1) * rows + 1;
		int end = current_page * rows;
		
		map.put("start", start);
		map.put("end", end);
		List<Reply> listReply = service.listReply(map);
		
		for(Reply dto : listReply) {
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		}
		
		//AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");
		
		//포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return "bbs/listReply";
	}
	
	//댓글/답글등록 : AJAX - JSON
	@RequestMapping(value="/bbs/insertReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReply(
			Reply dto,
			HttpSession session
			){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		if(info == null) {
			state = "loginFail";
		} else {
			dto.setUserId(info.getUserId());
			int result = service.insertReply(dto);
			if(result == 0)
				state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
	
	//댓글/답글 삭제
	@RequestMapping(value="/bbs/deleteReply", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteReply(
			@RequestParam Map<String, Object> paramMap
			, HttpSession session
			){
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		if(info==null) {
			state = "loginFail";
		} else {
			service.deleteReply(paramMap);
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	@RequestMapping(value="bbs/listReplyAnswer")
	public String listReplyAnswer(
			@RequestParam(value="replyNum") int answer
			, Model model
			) {
		List<Reply> listAnswer = service.listReplyAnswer(answer);
		for(Reply dto : listAnswer)
			dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		model.addAttribute("listAnswer", listAnswer);
		return "bbs/listAnswer";
	}
	
	@RequestMapping(value="bbs/replyCountAnswer")
	@ResponseBody
	public Map<String, Object> replyCountAnswer(
			@RequestParam(value="replyNum") int answer
			){
		int count = service.replyCountAnswer(answer);
		
		Map<String, Object> model = new HashMap<>();
		model.put("answerCount", count);
		return model;
	}
	
	@RequestMapping(value="/bbs/insertReplyLike", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> insertReplyLike(
			@RequestParam Map<String, Object> paramMap
			, HttpSession session
			){
		String state = "true";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();
		
		if(info==null) {
			state = "loginFail";
		} else {
			paramMap.put("userId", info.getUserId());
			int result = service.insertReplyLike(paramMap);
			if(result==0) {
				state = "false";
			} else {
				Map<String, Object> countMap = service.replyLikeCount(paramMap);
				
				//마이바티스의 resultType이 map인 경우 int는 BigDecimal로 넘어옴
				int likeCount = ((BigDecimal)countMap.get("LIKECOUNT")).intValue();
				int disLikeCount = ((BigDecimal)countMap.get("DISLIKECOUNT")).intValue();
				
				model.put("likeCount", likeCount);
				model.put("disLikeCount", disLikeCount);
			}
		}
		model.put("state", state);
		return model;
	}
	@RequestMapping(value="/sale/bbs/deleteFile", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> deleteFile(
			@RequestParam int fileNum,
			HttpServletResponse resp,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + File.separator + "uploads" + File.separator + "sale/bbs";
		
		Board dto=service.readFile(fileNum);
		if(dto!=null) {
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
		}
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("field", "fileNum");
		map.put("num", fileNum);
		service.deleteFile(map);
		
   	    // 작업 결과를 json으로 전송
		Map<String, Object> model = new HashMap<>(); 
		model.put("state", "true");
		return model;
	}
	
	
}
