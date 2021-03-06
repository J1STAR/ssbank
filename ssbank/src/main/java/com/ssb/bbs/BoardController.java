package com.ssb.bbs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("bbs.boardController")
public class BoardController {
	
	@Autowired
	public BoardService service;
	
	@RequestMapping(value="bbs/list")
	public String boardList() {
		return ".bbs.list";
	}
	
	@RequestMapping(value="bbs/created")
	public String createForm() {
		return ".bbs.created";
	}
	
	@RequestMapping(value="bbs/article")
	public String article() {
		return ".bbs.article";
	}
}
