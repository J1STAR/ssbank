package com.ssb.customerVoice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("customerVoice.inquiryService")
public class InquiryServiceImpl implements InquiryService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertInquiry(Inquiry dto, String mode) {
		int result = 0;
		try {
			if(mode.equals("reply")) {
				// 문자 또는 이메일 답변
				
				dto.setType(1); //답변
				dto.setState(1);
				dto.setPhoneRecv(0);
				dto.setPhone("");
				dto.setEmailRecv(0);
				dto.setEmail("");
				
				Map<String, Object> map = new HashMap<>();
				map.put("num", dto.getParent());
				map.put("state", "1");
				updateInquiryState(map);
			} else {
				dto.setType(0); // 질문
			}
			result = dao.insertData("customerVoice.insertInquiry", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("customerVoice.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		List<Inquiry> list = null;
		try {
			list = dao.selectList("customerVoice.listInquiry", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	@Override
	public List<Inquiry> relationInquiry(int num) {
		List<Inquiry> list = null;
		try {
			list = dao.selectList("customerVoice.relationInquiry", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public Inquiry readInquiry(int num) {
		Inquiry dto = null;
		try {
			dto = dao.selectOne("customerVoice.readInquiry", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateInquiryState(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.updateData("customerVoice.updateInquiryState", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateInquiry(Inquiry dto) {
		int result = 0;
		try {
			result = dao.updateData("customerVoice.updateInquiry", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteInquiry(int num) {
		int result = 0;
		try {
			result = dao.deleteData("customerVoice.deleteInquiry", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}


}
