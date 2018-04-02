package com.ssb.customerVoice;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;
import com.ssb.counsel.Counsel;
import com.ssb.counsel.Reply;

@Service("customerVoice.counselVoiceService")
public class CounselVoiceServiceImpl implements CounselVoiceService{
	@Autowired
	private CommonDAO dao;

	@Override
	public int insertBoard(CounselVoice dto) {
		int result = 0;
		try {
			int seq = dao.selectOne("customerVoice.insertBoard", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<CounselVoice> listBoard(Map<String, Object> map) {
		List<CounselVoice> list = null;
		try {
			list = dao.selectList("customerVoice.listBoard", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public List<CounselVoice> listCategory() {
		List<CounselVoice> list = null;
		try {
			list = dao.selectList("customerVoice.listCategory");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("customerVoice.dataCount", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public CounselVoice readBoard(int boardIdx) {
		CounselVoice dto = null;
		try {
			dto = dao.selectOne("customerVoice.readBoard", boardIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public int updateHitCount(int boardIdx) {
		int result = 0;
		try {
			result = dao.updateData("customerVoice.updateHitCount", boardIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int deleteBoard(int boardIdx) {
		int result = 0;
		try {
			result = dao.deleteData("customerVoice.deleteBoard", boardIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("customerVoice.replyCount", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<ReplyVoice> listReply(Map<String, Object> map) {
		List<ReplyVoice> list = null;
		try {
			list = dao.selectList("customerVoice.listReply", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public int insertReply(ReplyVoice dto) {
		int result = 0;
		try {
			result = dao.insertData("customerVoice.insertReply", dto);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("customerVoice.deleteReply", map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
}
