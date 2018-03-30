package com.ssb.carAcBook;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("carAcBook.carAcBookService")
public class CarAcBookServiceImpl implements CarAcBookService {

	@Autowired
	private CommonDAO dao;
	
	//각종 리스트
	@Override
	public List<CarAcBook> myCarList(Map<String, Object> map) {
		List<CarAcBook> list = null;
		try {
			list=dao.selectList("carAcBook.MyCarList", map);
		} catch (Exception e) {
		}
		return list;
	}
	
	@Override
	public List<CarAcBook> carModelList(Map<String, Object> map) {
		List<CarAcBook> list = null;
		try {
			list=dao.selectList("carAcBook.carModelList", map);
		} catch (Exception e) {
		}
		return list;
	}
	
	@Override
	public List<CarAcBook> myRecordList(Map<String, Object> map) {
		List<CarAcBook> list = null;
		try {
			list=dao.selectList("carAcBook.MyRecordList", map);
		} catch (Exception e) {
		}
		return list;
	}
	
	//각종 입력	
	@Override
	public int insertCarAcBook(CarAcBook dto) {
		int result=0;
		try {
			result = dao.insertData("carAcBook.insertRecord", dto);
		} catch (Exception e) {
		}
		return result;
	}
	
	//각종 수정
	@Override
	public int updateMyCar(CarAcBook dto) {
		int result=0;
	try {
		result = dao.updateData("carAcBook.updateMyCar", dto);
	} catch (Exception e) {
	}
		return result;
	}
	
	//각종 삭제
	@Override
	public int deleteMyCar(CarAcBook dto) {
		int result = 0;
	try {
		dao.deleteData("carAcBook.deleteMyCar", dto);
		result=1;
	} catch (Exception e) {
	}
		
		return result;
	}
	
	
/*
	@Override
	public int updateAccountBook(CarAcBook dto) {
		int result=0;
	try {
		result = dao.updateData("accountBook.updateAccountBook", dto);
	} catch (Exception e) {
	}
		return result;
	}

	@Override
	public int expenseTot(Map<String, Object> map) {
		int result=0;
		try {
			result = dao.selectOne("accountBook.expenseTot", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int incomeTot(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("accountBook.incomeTot", map);
		} catch (Exception e) {
		}
		return result;
	}
*/
}
