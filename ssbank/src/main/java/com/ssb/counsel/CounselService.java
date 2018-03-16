package com.ssb.counsel;

import java.util.List;
import java.util.Map;

public interface CounselService {
	
	public List<Counsel> listCounsel(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public Counsel readBoard(int boardIdx);
	public int updateHitCount(int boardIdx);
	public int insertBoard(Counsel dto);
	
}
