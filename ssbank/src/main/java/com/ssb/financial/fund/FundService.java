package com.ssb.financial.fund;

import java.util.List;
import java.util.Map;

public interface FundService {
	
	public List<Fund> listFund(Map<String, Object> map);
	public Fund detailFund(int accountNo);
	
}
