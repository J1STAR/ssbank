package com.ssb.personal.account;

import java.util.List;
import java.util.Map;

public interface AccountService {
	
	public List<Map<String, Object>> lookupAccount(Map<String, Object> map);
	public List<Map<String, Object>> listAccount(Map<String, Object> map);
	
	public int pwdCheck(Map<String, Object> map);
}
