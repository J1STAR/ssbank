package com.ssb.accountBook;

import java.util.List;
import java.util.Map;

public interface AccountBookService {
	
	public int insertAccountBook(AccountBook dto);
	public int deleteAccountBook(AccountBook dto);
	public int updateAccountBook(AccountBook dto);
	public List<AccountBook> listAllAccountBook(Map<String, Object> map);

}
