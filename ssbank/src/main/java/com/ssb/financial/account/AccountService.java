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
	
	public List<Account> listAllAccount(Map<String, Object> map); 
	public List<Account> listOneAccount(Map<String , Object> map);
	public Account detailAccount(int accountNo);
	public List<Account>  listAllSavingsProduct(Map<String, Object> map);
	public List<Account>  listOneSavingsProduct(Map<String, Object> map);
	public Account detailSavingProduct(int accountNo);
	public int insertSaveAccount(Account dto);
	public int deleteSaveAccount(Map<String, Object> map);
	public int deleteCheckSaveAccount(Map<String, Object> map);

}
