package com.ssb.financial.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller("product.productController")
public class ProductController {
	@Autowired
	private ProductService service;

	// 상품 리스트
	@RequestMapping(value = "/financial/product")
	public String productList(Model model) {
		List<Product> list = service.productAll();
		model.addAttribute("list", list);
		return ".financial.product.lsm-0001";
	}

	// 상세보기
	@RequestMapping(value = "/financial/product/detail")
	public String depositDetail(@RequestParam int productIdx, Model model) {
		String root = "";
		Product dto = null;
		switch (productIdx) {
		case 1:// 예금 상세
			dto = service.depositDetail(productIdx);
			root = "lsm-0002";
			break;
		case 2:// 적금상세
			dto =service.savingsDetail(productIdx);
			root = "lsm-0003";
			break;
		case 3:// 대출 상세
			dto =service.loanDetail(productIdx);
			root = "lsm-0004";
			break;
		case 4:// 펀드 상세
			dto =service.fundDetail(productIdx);
			root = "lsm-0005";
			break;

		}
		model.addAttribute("dto", dto);
		return ".financial.product." + root;
	}

}
