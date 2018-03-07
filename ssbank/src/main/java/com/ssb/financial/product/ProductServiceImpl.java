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

	@Override
	public Product depositDetail(int productIdx) {
		Product dto= null;
		try {
			dto=dao.selectOne("product.depositDetail", productIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public Product savingsDetail(int productIdx) {
		Product dto= null;
		try {
			dto=dao.selectOne("product.savingsDetail", productIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public Product loanDetail(int productIdx) {
		Product dto= null;
		try {
			dto=dao.selectOne("product.loanDetail", productIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public Product fundDetail(int productIdx) {
		Product dto= null;
		try {
			dto=dao.selectOne("product.fundDetail", productIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

}
