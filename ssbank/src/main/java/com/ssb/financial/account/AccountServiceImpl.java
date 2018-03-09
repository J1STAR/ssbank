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
			//계좌 활성화 된 것만 가져오기
			map.put("status", 1);
			list = dao.selectList("account.depositlistAllAccount", map);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	@Override
	public List<Account> savinglistAllAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {
			map.put("status", 1);
			list = dao.selectList("account.savinglistAllAccount", map);
		} catch (Exception e) {
		}
		return list;
	}

	// 계좌상세보기
	@Override
	public Account detailDepositAccount(String accountNo) {
		Account dto = null;
		try {
			dto = dao.selectOne("account.detailDepositAccount", accountNo);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public Account detailSavingAccount(String accountNo) {
		Account dto = null;
		try {
			dto = dao.selectOne("account.detailSavingAccount", accountNo);
		} catch (Exception e) {
		}
		return dto;
	}

	// 계좌 총 잔액
	@Override
	public Account deTotalBalance(Map<String, Object> map) {
		Account dto = null;
		try {
			dto = dao.selectOne("account.deTotalBalance", map);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public Account saTotalBalance(Map<String, Object> map) {
		Account dto = null;
		try {
			dto = dao.selectOne("account.saTotalBalance", map);
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
	//상품명 가지고 오기
	@Override
	public String productName(int productIdx) {
		String dto = null;
		try {
			dto = dao.selectOne("account.productName", productIdx);
		} catch (Exception e) {
		}
		return dto;
	}
	@Override
	public int insertAccount(Account dto) {
		int result = 0;
		try {
			dao.callUpdateProcedure("account.insertAccount", dto);
			result=1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Account> myAccount(Map<String, Object> map) {
		List<Account> list = null;
		try {
			map.put("status",1);
			list = dao.selectList("account.myAccount", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int accountBalance(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("account.accountBalance", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int deleteAccount(Map<String, Object> map) {
		int result = 0;
		try {

		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int accountCancleCheck(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("account.accountCancleCheck",map);
		} catch (Exception e) {
		}
		return result;
	}
	//
	@Override
	public Account createAccount(Map<String, Object> map) {
		Account dto = null;
		try {
			map.put("status", 1);
			dto=dao.selectOne("account.createAccount", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	

}
