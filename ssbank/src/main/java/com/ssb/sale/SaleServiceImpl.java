package com.ssb.sale;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;
import com.ssb.sale.bbs.Board;

@Service("sale.saleService")
public class SaleServiceImpl implements SaleService {
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertSale(Sale dto) {
		int result = 0;
		try {
			result = dao.insertData("sale.insertSale", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Sale> listSale(Map<String, Object> map) {
		List<Sale> list = null;

		try {
			list = dao.selectList("sale.listSale", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {

		int result = 0;
		try {
			result = dao.selectOne("sale.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Sale readSale(int num) {
		Sale dto = null;

		try {
			dto = dao.selectOne("sale.readSale", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitSale(int num) {
		int result = 0;

		try {
			result = dao.updateData("sale.updateHitCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int updateSale(Sale dto) {
		int result = 0;

		try {
			dao.updateData("sale.updateSale", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Sale preReadSale(Map<String, Object> map) {

		return null;
	}

	@Override
	public Sale nextReadSale(Map<String, Object> map) {

		return null;
	}

	@Override
	public int deleteSale(int num) {
		int result = 0;

		try {
			Sale dto = readSale(num);
			dao.deleteData("sale.deleteSale", num);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertSaleGain(Sale dto) {
		int result = 0;
		try {
			result = dao.insertData("sale.insertSale", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}

		return result;
	}
}
