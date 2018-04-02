package com.ssb.personal.transaction;

import java.util.List;
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
			dao.insertData("transaction.transactionSubmit", map);
			result = (int) map.get("result");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	@Override
	public int transactionATMSubmit(Map<String, Object> map) {
		int result = 0;
		
		try {
			dao.insertData("transaction.transactionATMSubmit", map);
			result = (int) map.get("result");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return result;
	}
	
	@Override
	public int transactionRepaySubmit(Map<String, Object> map) {
		int result = 0;
		
		try {
			dao.insertData("transaction.transactionRepaySubmit", map);
			result = (int) map.get("result");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	@Override
	public int transactionCount(Map<String, Object> map) {
		
		int result = 0;
		
		try {
			result = dao.selectOne("transaction.transactionCount", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	@Override
	public List<Map<String, Object>> transactionList(Map<String, Object> map) {
		
		List<Map<String, Object>> resultList = null;
		try {
			resultList = dao.selectList("transaction.transactionList", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return resultList;
	}
}
