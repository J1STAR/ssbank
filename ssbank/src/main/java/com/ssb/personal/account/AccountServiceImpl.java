package com.ssb.personal.account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("personalAccount.accountService")
public class AccountServiceImpl implements AccountService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Map<String, Object>> lookupAccount(int memberIdx) {
		
		List<Map<String, Object>> listAccount = null;
		try {
			listAccount = dao.selectList("personalAccount.lookupAccount", memberIdx);
		} catch (Exception e) {
		}
		return listAccount;
	}
	
}