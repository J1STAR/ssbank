package com.ssb.bbs;

import java.util.List;
import java.util.Map;

import com.ssb.bbs.Board;

public interface BoardService {
	public List<Board> listBoard(Map<String, Object> map);
}
