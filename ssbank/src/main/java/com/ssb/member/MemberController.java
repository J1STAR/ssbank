package com.ssb.member;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ssb.member.Member;

@Controller("member.memberController")
public class MemberController {
	
	@ModelAttribute("memberDto")
	public Member command() {
		return new Member();
	}
	
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
	
	@RequestMapping(value="/member/member-{stage}", method=RequestMethod.GET)
	public String memberForm(@PathVariable String stage, Model model) {
		
		model.addAttribute("mode", "created");
		return ".member.mbj-"+stage;
	}
	
	@RequestMapping(value="/member/memberJoin", method=RequestMethod.POST)
	public String memberSubmit(Member dto, Model model) {
		
		// 패스워드 암호화
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		String hashed=passwordEncoder.encodePassword(dto.getUserPwd(), null);
		dto.setUserPwd(hashed);
		
		try {
			service.insertMember(dto);
		}catch(Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다. 다른 아이디로 다시 가입하시기 바랍니다.");
			return ".member.mbj-0002";
		}
		
		StringBuffer sb=new StringBuffer();
		dto.setUserName(dto.getLastName() + dto.getFirstName());
		sb.append(dto.getUserName()+ "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		model.addAttribute("message", sb.toString());
		model.addAttribute("dto", dto);
		
		return ".member.mbj-0003";
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
