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
	
	public List<Account> depositlistAllAccount(Map<String , Object> map); 
	public List<Account> savinglistAllAccount(Map<String , Object> map); 
	public List<Account> listOneAccount(Map<String , Object> map);
	public Account newAccountMember(int memberIdx);
	public Account detailAccount(int accountNo);
	public int insertAccount(Account dto);
	public int deleteAccount(Map<String , Object> map);
	
	public List<Account>  listAllSavingsProduct(Map<String, Object> map);
	public List<Account>  listOneSavingsProduct(Map<String, Object> map);
	public Account detailSavingProduct(int accountNo);
	public int insertSavingAccount(Account dto);
	public int deleteSavingAccount(Map<String, Object> map);
	public int deleteCheckSavingAccount(Map<String, Object> map);

}
