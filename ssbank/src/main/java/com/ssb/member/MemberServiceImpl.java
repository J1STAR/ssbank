package com.ssb.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("member.MmmberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;

	@Override
	public Member readMember(String userId) {
		Member dto = null;
		try {
			dto = dao.selectOne("member.readMember", userId);
			
			//이메일,전화번호 나누는 작업
			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}
				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[1]);
				}
			}
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			//이메일 합치기
			if(dto.getEmail()!=null &&dto.getEmail1().length() !=0){
				if(dto.getEmail2() !=null && dto.getEmail2().length() !=0) {
					dto.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
				}
			}
			//전화번호 합치기
			if(dto.getTel1() !=null &&dto.getTel1().length()!=0) {
				if(dto.getTel2() !=null &&dto.getTel2().length()!=0) {
					if(dto.getTel3() !=null &&dto.getTel3().length()!=0) {
						dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel2());
					}
				}
			}
			dao.insertData("member.insertMember",dto);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void updateMamber(Member dto) throws Exception {
		try {
			//이메일 합치기
			if(dto.getEmail()!=null &&dto.getEmail1().length() !=0){
				if(dto.getEmail2() !=null && dto.getEmail2().length() !=0) {
					dto.setEmail(dto.getEmail1()+"@"+dto.getEmail2());
				}
			}
			//전화번호 합치기
			if(dto.getTel1() !=null &&dto.getTel1().length()!=0) {
				if(dto.getTel2() !=null &&dto.getTel2().length()!=0) {
					if(dto.getTel3() !=null &&dto.getTel3().length()!=0) {
						dto.setTel(dto.getTel1()+"-"+dto.getTel2()+"-"+dto.getTel2());
					}
				}
			}
			dao.updateData("member.updateMamber",dto);
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
			result = dao.updateData("member.updateLatLogin",userId);
		} catch (Exception e) {
		}
		return result;
	}

}
