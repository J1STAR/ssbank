package com.ssb.member;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	public Member readMember(String userId);
	public Map<String, Object> readMemberInfo(String memberIdx);
	
	public void insertMember(Member dto) throws Exception;
	
	public void updateMember(Member dto) throws Exception;
	public int updateLastLogin(String userId);
	
	public int updateEnabled(String userId);
	public int deleteMember(Map<String , Object> map);
	
	public int dataCount(Map<String , Object> map);
	public List<Member> listMember(Map<String, Object> map);
	
	public int updateAuthority(Map<String, Object> map);
	public List<Member> listAuthority(String userId);
	
	
}
