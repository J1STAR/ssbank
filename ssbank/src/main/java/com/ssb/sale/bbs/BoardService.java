package com.ssb.sale.bbs;

import java.util.List;
import java.util.Map;

import com.ssb.sale.bbs.Board;

public interface BoardService {
	public int insertBoard(Board dto, String pathname);
	public List<Board> listBoard(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Board readBoard(int num);
	public int updateHitCount(int num);
	public Board preReadBoard(Map<String, Object> map);
	public Board nextReadBoard(Map<String, Object> map);
	public int updateBoard(Board dto, String pathname);
	public int deleteBoard(int num, String pathname, String userId);
	
	public int insertBoardLike(Map<String, Object> map);
	public int likeBoardCount(int num);
	
	//----------- 댓글용 ---------------
	public int insertReply(Reply dto);
	public List<Reply> listReply(Map<String, Object> map);
	public int replyDataCount(Map<String, Object> map);
	public int deleteReply(Map<String, Object> map);
	
	//----------- 답글용 ---------------
	public List<Reply> listReplyAnswer(int answer);
	public int replyCountAnswer(int answer);
	
	//----------- 좋아요 싫어요 용 ---------------
	public int insertReplyLike(Map<String, Object> map);
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	//파일쪽
	public int insertFile(Board dto);
	public List<Board> listFile(int num);
	public Board readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
