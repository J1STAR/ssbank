package com.ssb.financial.account;

import java.util.List;
import java.util.Map;

/*
  listAccount - 계좌전체리스트
  insertSaveAccount - 신규
  deleteSaveAccount - 해지
  deleteCheckSaveAccount - 해지예상
 */

public interface AccountService {
	
	//계좌리스트
	public List<Account> depositlistAllAccount(Map<String , Object> map); 
	public List<Account> savinglistAllAccount(Map<String , Object> map); 
	public Account detailDepositAccount(String accountNo);
	public Account detailSavingAccount(String accountNo);
	public Account deTotalBalance(Map<String, Object>map);
	public Account saTotalBalance(Map<String, Object>map);
	
	
	//신규
	public Account newAccountMember(int memberIdx);
	public int insertAccount(Account dto);
	public String productName(int productIdx);
	
	
	//해지
	public int deleteAccount(Map<String , Object> map);
	public List<Account> myAccount(Map<String, Object>map);
	public int accountBalance(Map<String, Object>map);
	public int accountCancleCheck(Map<String, Object> map);
	

}
