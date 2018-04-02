package com.ssb.customerManageService;

import java.util.List;
import java.util.Map;

public interface BoardService {
	public int insertBoard(Board dto, String pathname);
	public List<Board> listBoard(Map<String, Object> map);
	public List<Board> listCategory();
	public int dataCount(Map<String, Object> map);
	public Board readBoard(int boardIdx);
	public int updateHitCount(int boardIdx);
	public Board preReadBoard(Map<String, Object> map);
	public Board nextReadBoard(Map<String, Object>map);
	public int updateBoard(Board dto, String pathname);
	public int deleteBoard(int boardIdx);
}
