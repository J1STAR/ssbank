package com.ssb.sale;

import java.util.List;
import java.util.Map;

import com.ssb.sale.Sale;

public interface SaleService {
	public int insertSale(Sale dto);
	public List<Sale> listSale(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Sale readSale(int saleIdx);
	public int updateHitSale(int saleIdx);
	public int updateSale(Sale dto);
	public Sale preReadSale(Map<String, Object> map);
	public Sale nextReadSale(Map<String, Object> map);
	public int deleteSale(int saleIdx);
	public int insertSaleGain(Sale dto);
	public List<Sale> cityCount();
	public List<Sale> listSaleMode(Map<String, Object>map);
	public int totalDataCount(Map<String, Object> map);
	public int sellDataCount(Map<String, Object> map);
	public int buyDataCount(Map<String, Object> map);
}