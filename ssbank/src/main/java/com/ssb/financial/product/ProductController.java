package com.ssb.financial.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("product.productController")
public class ProductController {
	/*@Autowired
	private ProductService service;*/
	
	//목돈만들기
	@RequestMapping(value ="/financial/product/chunkMoney")
	public String chunk() {
		return ".financial.fund.lsm";
	}
	//목돈굴리기
	@RequestMapping(value ="/financial/product/makeMoney")
	public String makeMoney() {
		return ".financial.fund.lsr";
	}
	//입출금 자유적금
	@RequestMapping(value ="/financial/product/freePro")
	public String freeProduct() {
		return ".financial.fund.dwf";
	}
	//주택청약
	@RequestMapping(value ="/financial/product/apartPro")
	public String apartPro() {
		return ".financial.fund.hsp";
	}
	//신탁상품
	@RequestMapping(value ="/financial/product/trustGoods")
	public String trustGoods() {
		return ".financial.fund.ssp";
	}
	
}
