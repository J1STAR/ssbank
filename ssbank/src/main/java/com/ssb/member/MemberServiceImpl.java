package com.ssb.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("member.MemberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Member readMember(String userId) {
		Member dto = null;
		try {
			dto = dao.selectOne("member.readMember", userId);
			
		} catch (Exception e) {
		}
		return dto;
	}
	
	@Override
	public Map<String, Object> readMemberInfo(String memberIdx) {
		Map<String, Object> result = null;
		
		System.out.println(memberIdx);
		try {
			result = dao.selectOne("member.readMemberInfo", memberIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
	
		return result;
	}
	

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			//이메일
			if(dto.getEmail1()!=null &&dto.getEmail1().length() !=0){
				if(dto.getEmail2() !=null && dto.getEmail2().length() !=0) {
					dto.setUserId(dto.getEmail1()+"@"+dto.getEmail2());
				}
			}
			
			//전화번호
			if(dto.getTel1() !=null &&dto.getTel1().length()!=0) {
				if(dto.getTel2() !=null &&dto.getTel2().length()!=0) {
					if(dto.getTel3() !=null &&dto.getTel3().length()!=0) {
						dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
					}
				}
			}
			dao.insertData("member.insertMember",dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {

			//전화번호 합치기
			if(dto.getTel1() !=null &&dto.getTel1().length()!=0) {
				if(dto.getTel2() !=null &&dto.getTel2().length()!=0) {
					if(dto.getTel3() !=null &&dto.getTel3().length()!=0) {
						dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel3());
					}
				}
			}
			dao.updateData("member.updateMember",dto);
		} catch (Exception e) {
			throw e;
		}

	}


	

	@Override
	public int dataCount(Map<String, Object> map) {
		int result =0;
		try {
			result = dao.selectOne("member.dataCount",map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listMember(Map<String, Object> map) {
		List<Member> list = null;
		try {
			list= dao.selectList("member.listMember",map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int updateAuthority(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.updateData("member.updateAuthority", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Member> listAuthority(String userId) {
		List<Member> list=null;
		try {
			list=dao.selectList("member.listAuthority", userId);
		} catch (Exception e) {
		}
		return list;
	}
	
	//최초 탈퇴 할때 
	@Override
	public int updateEnabled(String userId) {
		int result =0;
		try {
			Map<String , Object> map = new HashMap<>();
			map.put("userId", userId);
			map.put("enabled", 0);
			
			result =dao.updateData("member.updateEnabled",map);
		} catch (Exception e) {
		}
		return result;
	}
	
	//탈퇴 1년 후 정보 삭제
	@Override
	public int deleteMember(Map<String, Object> map) {
		int result =0;
		try {
			result = dao.deleteData("member.deleteMember",map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int updateLastLogin(String userId) {
		int result =0;
		try {
			result = dao.updateData("member.updateLastLogin",userId);
		} catch (Exception e) {
		}
		return result;
	}

}
