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

	// 예금 리스트 전부
	@Override
	public List<Account> depositlistAllAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {
			list = dao.selectList("account.depositlistAllAccount", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Account> savinglistAllAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {
			list = dao.selectList("account.savinglistAllAccount", map);
		} catch (Exception e) {
		}
		return list;
	}
	//계좌상세보기
	@Override
	public Account detailDepositAccount(String accountNo) {
		Account dto= null;
		try {
			dto = dao.selectOne("account.detailDepositAccount",accountNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public Account detailSavingAccount(String accountNo) {
		Account dto= null;
		try {
			dto = dao.selectOne("account.detailSavingAccount",accountNo);
		} catch (Exception e) {
		}
		return dto;
	}
	//계좌 총 잔액
	@Override
	public Account deTotalBalance(Map<String, Object> map) {
		Account dto= null;
		try {
			dto = dao.selectOne("account.deTotalBalance",map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public Account saTotalBalance(Map<String, Object> map) {
		Account dto= null;
		try {
			dto = dao.selectOne("account.saTotalBalance",map);
		} catch (Exception e) {
		}
		return dto;
	}
	
	



	
	@Override
	public Account newAccountMember(int memberIdx) {
		Account dto = null;
		try {
			dto = dao.selectOne("account.newAccountMember", memberIdx);
			dto.setName(dto.getLastName() + dto.getFirstName());
		} catch (Exception e) {
		}
		return dto;
	}

	

	@Override
	public int insertAccount(Account dto) {
		int result = 0;
		try {
			result = dao.insertData("account.insertAccount", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Account> myAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {
			list = dao.selectOne("account.myAccount", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public Account accountBalance(Map<String, Object> map) {
		Account dto = null;
		try {
			dto = dao.selectOne("account.accountBalance", map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public int deleteAccount(Map<String, Object> map) {
		int result = 0;
		try {

		} catch (Exception e) {
		}
		return result;
	}

	
	
	

}
