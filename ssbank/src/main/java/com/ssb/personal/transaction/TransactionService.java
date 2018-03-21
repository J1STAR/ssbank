package com.ssb.personal.transaction;

import java.util.List;
import java.util.Map;

public interface TransactionService {

	public int transactionSubmit(Map<String, Object> map);
	
	public int transactionCount(String accountNo);
	public List<Map<String, Object>> transactionList(Map<String, Object> map);
	
}
