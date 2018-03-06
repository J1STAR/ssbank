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
	
	//상품 리스트
	@RequestMapping(value ="/financial/product")
	public String productList(Model model) {
		List<Product> list = service.productAll();
		model.addAttribute("list",list);
		return ".financial.product.lsm-0001";
	}
	
	//예금 상세보기
	@RequestMapping(value="/financial/product/deposit")
	public String depositDetail(@RequestParam int productIdx){
		return ".financial.product.lsm-0002";
	}
	
	//적금 상세보기
	@RequestMapping(value="/financial/product/savings")
	public String savingsDetail(@RequestParam int productIdx){
		return ".financial.product.lsm-0003";
	}
	//대출 상세보기
	@RequestMapping(value="/financial/product/loan")
	public String loanDetail(@RequestParam int productIdx){
		return ".financial.product.lsm-0004";
	}
	
	//펀드 상세보기
	@RequestMapping(value="/financial/product/fund")
	public String fundDetail(@RequestParam int productIdx){
		return ".financial.product.lsm-0005";
	}
}
