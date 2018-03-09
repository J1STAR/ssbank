package com.ssb.newsBoard;

import java.util.List;
import java.util.Map;

public interface NewsBoardService {
	public int insertBoard(NewsBoard dto, String pathname);
	public List<NewsBoard> listBoard(Map<String, Object> map);
	public List<NewsBoard> listCategory();
	public int dataCount(Map<String, Object> map);
	public NewsBoard readBoard(int boardIdx);
	public int updateHitCount(int boardIdx);
	public NewsBoard preReadBoard(Map<String, Object> map);
	public NewsBoard nextReadBoard(Map<String, Object>map);
	public int updateBoard(NewsBoard dto, String pathname);
	public int deleteBoard(int boardIdx, String pathname, String userId);
}
