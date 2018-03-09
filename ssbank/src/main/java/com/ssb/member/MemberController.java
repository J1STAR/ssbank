	package com.ssb.member;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping(value="/member/memberJoin-{stage}", method=RequestMethod.GET)
	public String memberForm(@PathVariable String stage, Model model) {
		
		model.addAttribute("mode", "created");
		return ".member.mbj-"+stage;
	}
	
	@RequestMapping(value="/member/memberModi-{stage}", method=RequestMethod.GET)
	public String memberModiForm(@PathVariable String stage, Model model) {
		
		model.addAttribute("mode", "update");
		
		if(stage.equals("0001")) {
			return ".member.mbm-0001";
		} else {
			return ".member.mbj-0002";
		}
	
	}
	
	@RequestMapping(value="/member/readMemberInfo", method=RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> readMemberInfo(@RequestParam String memberIdx){
		
		Map<String, Object> model = new HashMap<>();
		
		try {
			model.put("member", service.readMemberInfo(memberIdx));
		} catch (Exception e) {
			// TODO: handle exception
		}
		return model;
	}
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////
	@RequestMapping(value="/member/memberJoinSubmit", method=RequestMethod.POST)
	public String memberSubmit(Member dto, Model model) {
		
		// 패스워드 암호화
		String hashed = encryptPwd(dto.getUserPwd());
		dto.setUserPwd(hashed);
		
		try {
			service.insertMember(dto);
		}catch(Exception e) {
			model.addAttribute("message", "회원가입이 실패했습니다. 다른 아이디로 다시 가입하시기 바랍니다.");
			return ".member.mbj-0002";
		}
		
		StringBuffer sb=new StringBuffer();
		dto.setUserName(dto.getLastName() + dto.getFirstName());
		sb.append(dto.getUserName() + "님의 회원 가입이 정상적으로 처리되었습니다.<br>");
		sb.append("메인화면으로 이동하여 로그인 하시기 바랍니다.<br>");
		
		model.addAttribute("message", sb.toString());
		model.addAttribute("dto", dto);
		
		return ".member.mbj-0003";
	}
	
	@RequestMapping(value="/member/memberModiSubmit", method=RequestMethod.POST)
	public String memberModiSubmit(Member dto, Model model) {
		
		String hashed = null; 
		if(dto.getUserPwd() == null || dto.getUserPwd().equals("")) {
			dto.setUserPwd("");
			hashed = dto.getUserPwd();
		} else {
			hashed = encryptPwd(dto.getUserPwd());
		}
		dto.setUserPwd(hashed);
		
		
		
	}
	
	@RequestMapping(value="/member/memberPwdCheck", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberPwdCheck(Member dto){
		
		// 패스워드 암호화
		String hashedInputPwd = encryptPwd(dto.getUserPwd());
		
		Map<String, Object> model = new HashMap<>();
		try {
			Member resultMember = service.readMember(dto.getUserId());
			if(hashedInputPwd.equals(resultMember.getUserPwd())) {
				model.put("status", "success");
			} else {
				model.put("status", "falied");
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return model;
	}
	
	
	
	
	
	
	
	
	/////////////////////////////////////////////////////////////
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
	
	public String encryptPwd(String inputPwd) {
		ShaPasswordEncoder passwordEncoder=new ShaPasswordEncoder(256);
		return passwordEncoder.encodePassword(inputPwd, null);
	}
}
