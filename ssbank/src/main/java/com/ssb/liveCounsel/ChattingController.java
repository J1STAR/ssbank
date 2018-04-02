package com.ssb.liveCounsel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("liveCounsel.chattingController")
public class ChattingController {
	@RequestMapping(value="/customerCounsel/liveCounsel/list")
	public String main(Model model) throws Exception{
		return "/customerCounsel/liveCounsel/chat";
	}
}
