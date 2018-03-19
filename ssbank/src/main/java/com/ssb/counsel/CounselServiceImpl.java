package com.ssb.counsel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("counsel.counselServiceImpl")
public class CounselServiceImpl implements CounselService{
	
	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<Counsel> listCounsel(Map<String, Object> map) {
		List<Counsel> list = null;
		try {
		
			list = dao.selectList("counsel.listCounsel",map);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("counsel.dataCount",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public Counsel readBoard(int boardIdx) {
		Counsel dto = null;
		try {
			dto=dao.selectOne("counsel.readBoard",boardIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public int updateHitCount(int boardIdx) {
		int result=0;
		try {
			result=dao.updateData("counsel.updateHitCount",boardIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int insertBoard(Counsel dto) {
		int result=0;
		try {
			result=dao.insertData("counsel.insertBoard", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("counsel.replyCount",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list=dao.selectList("counsel.listReply",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int insertReply(Reply dto) {
		int result=0;
		try {
			result=dao.insertData("counsel.insertReply", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}


	

}
