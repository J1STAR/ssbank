package com.ssb.financial.account;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("account.accountService")
public class AccountServiceImpl implements AccountService {

	@Autowired
	private CommonDAO dao;
	
	//예금
	@Override
	public List<Account> listAllAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {
			list = dao.selectList("account.listAllAccount",map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Account> listOneAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {

		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Account detailAccount(int accountNo) {
		Account dto = null;
		try {

		} catch (Exception e) {
		}
		return dto;
	}

	
	
	//적금
	@Override
	public List<Account> listAllSavingsProduct(Map<String, Object> map) {
		List<Account> list = null;
		try {

		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Account> listOneSavingsProduct(Map<String, Object> map) {
		List<Account> list = null;
		try {

		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Account detailSavingProduct(int accountNo) {
		Account dto = null;
		try {

		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int insertAccount(Account dto) {
		int result=0;
		try {
			result = dao.insertData("account.insertAccount",dto);
		} catch (Exception e) {
		}
		return result;
	}

	

	@Override
	public int insertSavingAccount(Account dto) {
		int result=0;
		try {

		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteSavingAccount(Map<String, Object> map) {
		int result=0;
		try {

		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteCheckSavingAccount(Map<String, Object> map) {
		int result=0;
		try {

		} catch (Exception e) {
		}
		return result;
	}
	@Override
	public int deleteAccount(Map<String, Object> map) {
		int result=0;
		try {

		} catch (Exception e) {
		}
		return result;
	}

}
