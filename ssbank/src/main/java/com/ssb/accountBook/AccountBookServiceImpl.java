package com.ssb.accountBook;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("accountBook.accountBookService")
public class AccountBookServiceImpl implements AccountBookService {

	@Autowired
	private CommonDAO dao;
	
	@Override
	public int insertAccountBook(AccountBook dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AccountBook> listAllAccountBook(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAccountBook(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

}
