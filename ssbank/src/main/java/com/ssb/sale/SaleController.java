package com.ssb.sale;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.RequestMapping;

import com.ssb.sale.Sale;

@Controller("sale.saleController")
public class SaleController {

	@ModelAttribute("saleDto")
	public Sale command() {
		return new Sale();
	}

	@RequestMapping(value = "/sale/raa-0001")
	public String saleList() {

		return ".sale.raa-0001";

	}

	@RequestMapping(value = "/sale/raa-0002")
	public String saleUploadMain() {
		return ".sale.raa-0002";
	}

	@RequestMapping(value = "/sale/raa-0003")
	public String cheongYak() {
		return ".sale.raa-0003";
	}

	@RequestMapping(value = "/sale/raa-0005")
	public String saleForm() {

		return ".sale.raa-0005";
	}

	@RequestMapping(value = "/sale/raa-0006")
	public String saleSuccess() {
		return ".sale.raa-0006";
	}

}
