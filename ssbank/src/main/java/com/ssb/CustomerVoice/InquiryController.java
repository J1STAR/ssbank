package com.ssb.CustomerVoice;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

// 고객의 소리
@Controller("customerVoice.inquiryController")
public class InquiryController {
	@Autowired
	private InquiryService service;
	

}
