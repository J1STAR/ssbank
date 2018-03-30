package com.ssb.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("bbs.BoardService")
public class BoardServiceImpl implements BoardService {

	@Autowired
	public CommonDAO dao;
	
	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		
		
		
		return null;
	}

}
