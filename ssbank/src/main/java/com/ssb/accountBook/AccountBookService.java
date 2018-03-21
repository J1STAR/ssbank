package com.ssb.accountBook;

import java.util.List;
import java.util.Map;

public interface AccountBookService {
	
	public int insertAccountBook(AccountBook dto);
	public int deleteAccountBook(AccountBook dto);
	public int updateAccountBook(AccountBook dto);
	
	//수입, 지출 합계
	public int expenseTot(Map<String, Object> map);
	public int incomeTot(Map<String, Object> map);
	
	//각종 리스트 뽑기
	public List<AccountBook> expenseList(Map<String, Object> map);
	public List<AccountBook> incomeList(Map<String, Object> map);
	public List<AccountBook> calendarList(Map<String, Object> map);

}
