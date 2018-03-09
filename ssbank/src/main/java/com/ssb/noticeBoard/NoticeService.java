package com.ssb.noticeBoard;

import java.util.List;
import java.util.Map;

import com.ssb.newsBoard.NewsBoard;

public interface NoticeService {
	public int insertNotice(Notice dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<Notice> listNotice(Map<String, Object> map);
	public int updateHitCount(int boardIdx);
	public List<Notice> listCategory();
	public Notice readNotice(int boardIdx);
	public Notice preReadNotice(Map<String, Object> map);
	public Notice nextReadNotice(Map<String, Object> map);
	public int updateNotice(Notice dto, String pathname);
	public int deleteNotice(int boardIdx, String pathname);
	
	public int insertFile(Notice dto);
	public List<Notice> listFile(int boardIdx);
	public Notice readFile(int fileNum);
	public int deleteFile(Map<String, Object> map);
}
