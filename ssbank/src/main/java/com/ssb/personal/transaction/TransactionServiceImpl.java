package com.ssb.personal.transaction;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("transaction.transactionService")
public class TransactionServiceImpl implements TransactionService {
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public int transactionSubmit(Map<String, Object> map) {
		
		int result = 0;
		
		try {
			result = dao.insertData("transaction.transactionSubmit", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("이체결과 > "+result);
		return result;
	}
}
