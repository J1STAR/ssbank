package com.ssb.customerVoice;

import java.util.List;
import java.util.Map;

import com.ssb.counsel.Counsel;
import com.ssb.counsel.Reply;

public interface CounselVoiceService {
	public int insertBoard(CounselVoice dto);
	public List<CounselVoice> listBoard	(Map<String, Object> map);
	public List<CounselVoice> listCategory();
	public int dataCount(Map<String, Object> map);
	public CounselVoice readBoard(int boardIdx);
	public int updateHitCount(int boardIdx);
	public int deleteBoard(int boardIdx);
	
	public int replyCount(Map<String, Object> map);
	public List<ReplyVoice> listReply(Map<String, Object> map);
	public int insertReply(ReplyVoice dto);
	public int deleteReply(Map<String, Object> map);
}
