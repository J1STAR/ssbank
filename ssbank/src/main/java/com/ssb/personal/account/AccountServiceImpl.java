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
	public int getAccountBalance(String accountNo) {
		int balance = 0;
		
		try {
			balance = dao.selectOne("personalAccount.getAccountBalance",accountNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return balance;
	}
	
	@Override
	public List<Map<String, Object>> lookupAccount(Map<String, Object> map) {
		
		List<Map<String, Object>> listAccount = null;
		try {
			listAccount = dao.selectList("personalAccount.lookupAccount", map);
		} catch (Exception e) {
		}
		return listAccount;
	}

	@Override
	public List<Map<String, Object>> listAccount(Map<String, Object> map) {
		
		List<Map<String, Object>> listAccount = null;
		try {
			listAccount = dao.selectList("personalAccount.listAccount", map);
		} catch (Exception e) {
		}
		return listAccount;
	}
	
	@Override
	public int pwdCheck(Map<String, Object> map) {
		
		int result = 0;
		
		try {
			result = dao.selectOne("personalAccount.pwdCheck", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
}
