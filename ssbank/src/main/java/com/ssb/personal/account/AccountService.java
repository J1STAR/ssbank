package com.ssb.personal.account;

import java.util.List;
import java.util.Map;

public interface AccountService {
	
	public List<Map<String, Object>> lookupAccount(int memberIdx);
}
