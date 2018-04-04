package com.ssb.member;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssb.velocity.ApplicationConfig;
import com.ssb.velocity.Mail;
import com.ssb.velocity.MailService;
import com.ssb.member.Member;

@Controller("member.memberController")
public class MemberController {
	
	@ModelAttribute("memberDto")
	public Member command() {
		return new Member();
	}
	
	@Autowired
	private MemberService service;

	@Autowired
	private MailService mailService;

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
	
	@RequestMapping(value="/member/memberSubmitEmail-{uuid}", method=RequestMethod.GET)
	public String memberSubmitEmail(@PathVariable String uuid, Model model) {
		
		System.out.println("uuid"+uuid);
		Map<String, Object> map = new HashMap<>();
		Member dto = new Member();
		if(uuid == null || uuid.equals("")) {
			return "redirect:/main";
		} else {
			try {
				map.put("uuid", uuid);
				String userId = service.memberSubmitEmail(map);
				System.out.println("userId"+userId);
				if(userId != null || !userId.equals("")) {
					dto = service.readMember(userId);
					dto.setUserName(dto.getLastName() + dto.getFirstName());
					
					model.addAttribute("dto", dto);
					model.addAttribute("mode", "mailOk");
				} else {
					return "redirect:/main";
				}
			} catch (Exception e) {
				e.printStackTrace();
				
				return "redirect:/main";
			}
			return ".member.mbj-0003";
		}
		
		
	}
	
	
	/////////////////////////////////////////////////////////////
	@RequestMapping(value="/member/memberJoinSubmit", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> memberSubmit(HttpServletRequest req, Member dto) {
		
		// 패스워드 암호화
		String hashed = encryptPwd(dto.getUserPwd());
		dto.setUserPwd(hashed);
		dto.setUserName(dto.getLastName() + dto.getFirstName());
		
		Map<String, Object> model = new HashMap<>();
		try {
			
			model.put("status", "success");
			
			String uuid = UUID.randomUUID().toString();
			uuid = uuid.replace("-", "");
			
			dto.setUuid(uuid);
			service.insertMember(dto);
			
			Mail mail = new Mail();
	        mail.setMailFrom("ssbank.sist@gmail.com");
	        mail.setMailTo(dto.getEmail1()+"@"+dto.getEmail2());
	        mail.setMailSubject("[쌍용은행] "+ dto.getUserName() +" 님의 회원가입을 환영합니다.");
	 
	        Map < String, Object > mailModel = new HashMap < String, Object > ();
	        mailModel.put("firstName", dto.getFirstName());
	        mailModel.put("lastName", dto.getLastName());
	        mailModel.put("signature", "www.ssbank.com");
	        mailModel.put("uuid", uuid);
	        mail.setModel(mailModel);
	 
	        AbstractApplicationContext context = new AnnotationConfigApplicationContext(ApplicationConfig.class);
	        mailService.sendEmail(mail);
	        context.close();

			/*Mail mailDto = new Mail();
			mailDto.setSenderEmail("ssbank.sist@gmail.com");
			mailDto.setSenderName("쌍용은행");
			mailDto.setReceiverEmail(dto.getEmail1()+"@"+dto.getEmail2());
			
			mailDto.setSubject("[쌍용은행] "+ dto.getUserName() +" 님의 회원가입을 환영합니다." );
			
			String uuid = UUID.randomUUID().toString();
			uuid = uuid.replace("-", "");
			
			mailDto.setContent("아래 링크를 클릭하여 가입을 완료해주세요."+
								"<a href='localhost:9090/member/memberSubmitEmail-"+uuid+"'>");

			dto.setUuid(uuid);
			service.insertMember(dto);
			mailSender.mailSend(mailDto);*/
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
