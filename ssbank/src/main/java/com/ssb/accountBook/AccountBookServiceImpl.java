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
		int result=0;
		try {
			result = dao.insertData("accountBook.insertAccountBook", dto);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<AccountBook> listAllAccountBook(Map<String, Object> map) {
		List<AccountBook> list = null;
		try {
			list=dao.selectList("accountBook.listAllAccountBook", map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int deleteAccountBook(AccountBook dto) {
		int result = 0;
	try {
		dao.deleteData("accountBook.deleteAccountBook", dto);
		result=1;
	} catch (Exception e) {
	}
		
		return result;
	}

	@Override
	public int updateAccountBook(AccountBook dto) {
		int result=0;
		try {
			result = dao.updateData("accountBook.updateAccountBook", dto);
		} catch (Exception e) {
		}
		return result;
	}

}
