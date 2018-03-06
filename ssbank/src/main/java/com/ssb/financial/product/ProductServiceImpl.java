package com.ssb.financial.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("product.productService")
public class ProductServiceImpl implements ProductService {
	@Autowired
	private CommonDAO dao;

	@Override
	public List<Product> productAll() {
		List<Product> list = null;
		try {
			list = dao.selectList("product.productAll");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

}
