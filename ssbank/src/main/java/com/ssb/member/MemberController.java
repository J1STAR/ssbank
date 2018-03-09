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
	
	@RequestMapping(value="/member/submitOK")
	public String submitOKForm(HttpSession session, Member dto, @RequestParam String mode, Model model) {
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", mode);
		
		session.invalidate();
		
		return ".member.mbj-0003";
	}
	
	
	
	
	/////////////////////////////////////////////////////////////
	@RequestMapping(value="/member/memberJoinSubmit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberSubmit(Member dto) {
		
		// 패스워드 암호화
		String hashed = encryptPwd(dto.getUserPwd());
		dto.setUserPwd(hashed);
		
		Map<String, Object> model = new HashMap<>();
		try {
			service.insertMember(dto);
			model.put("status", "success");
		}catch(Exception e) {
			model.put("status", "failed");
		}
		
		return model;
	}
	
	@RequestMapping(value="/member/memberModiSubmit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberModiSubmit(Member dto) {
		
		String hashed = null; 
		if(dto.getUserPwd() == null || dto.getUserPwd().equals("")) {
			dto.setUserPwd("");
			hashed = dto.getUserPwd();
		} else {
			hashed = encryptPwd(dto.getUserPwd());
		}
		dto.setUserPwd(hashed);
		
		Map<String, Object> model = new HashMap<>();
		try {
			service.updateMember(dto);
			model.put("status", "success");
		} catch (Exception e) {
			model.put("status", "failed");
		}
		
		return model;
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
