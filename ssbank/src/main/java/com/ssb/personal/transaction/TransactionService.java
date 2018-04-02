package com.ssb.personal.transaction;

import java.util.List;
import java.util.Map;

public interface TransactionService {

	public int transactionSubmit(Map<String, Object> map);
	public int transactionATMSubmit(Map<String, Object> map);
	public int transactionRepaySubmit(Map<String, Object> map);
	
	public int transactionCount(Map<String, Object> map);
	public List<Map<String, Object>> transactionList(Map<String, Object> map);
	
}
