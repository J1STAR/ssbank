package com.ssb.newsBoard;

import java.util.List;
import java.util.Map;

public interface NewsBoardService {
	public int insertBoard(NewsBoard dto, String pathname);
	public List<NewsBoard> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public NewsBoard readBoard(int num);
	public int updateHitCount(int num);
	public NewsBoard preReadBoard(Map<String, Object> map);
	public NewsBoard nextReadBoard(Map<String, Object>map);
	public int updateBoard(NewsBoard dto, String pathname);
	public int deleteBoard(int num, String pathname, String userId);
	
	public int insertReply(NewsReply dto);
	public List<NewsReply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	public List<NewsReply> listReplyAnswer(int answer);
	public int replyAnswerCount(int answer);
	
	public int insertReplyLike(Map<String, Object> map);
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}
