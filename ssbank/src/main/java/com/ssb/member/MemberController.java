package com.ssb.member;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("member.memberController")
public class MemberController {
	
	@Autowired
	private MemberService service;
	

	@RequestMapping(value="/member/login",method=RequestMethod.GET)
	public String loginForm(String login_error,Model model, HttpSession session) {
		
		boolean bLoginError = login_error != null;
		
		String msg ="";
		if(bLoginError) {
			msg="아이디 또는 패스워드를 잘못 입력 하셨습니다.";
			model.addAttribute("message", msg);
		}
		return ".member.login";
	}
	
	@RequestMapping(value="/member/noAuthorized")
	public String noAuthorized() {
		// 접근 오서라이제이션(Authorization:권한)이 없는 경우
		
		return ".member.noAuthorized";
	}
	
	@RequestMapping(value="/member/expired")
	public String expired() {
		// 세션이 만료 된 경우
		
		return ".member.expired";
	}
	

	

}
