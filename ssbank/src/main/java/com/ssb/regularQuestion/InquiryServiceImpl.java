package com.ssb.regularQuestion;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("regularQuestion.inquiryService")
public class InquiryServiceImpl implements InquiryService{
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertInquiry(Inquiry dto, String mode) {
		int result = 0;
		try {
			if(mode.equals("reply")) {
				
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return 0;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Inquiry> listInquiry(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Inquiry> relationInquiry(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Inquiry readInquiry(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateInquiryState(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateInquiry(Inquiry dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteInquiry(int boardIdx) {
		// TODO Auto-generated method stub
		return 0;
	}

}
