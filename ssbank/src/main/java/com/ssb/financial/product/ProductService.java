package com.ssb.financial.product;

import java.util.List;

public interface ProductService {
	public List<Product> productAll();
	public Product depositDetail(int productIdx);
	public Product savingsDetail(int productIdx);
	public Product loanDetail(int productIdx);
	public Product fundDetail(int productIdx);

}
