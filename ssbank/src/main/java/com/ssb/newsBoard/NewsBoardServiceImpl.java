package com.ssb.newsBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

@Service("newsBoard.boardService")
public class NewsBoardServiceImpl implements NewsBoardService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBoard(NewsBoard dto, String pathname) {
		int result = 0;
		try {
			result = dao.insertData("newsBoard.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	@Override
	public List<NewsBoard> listBoard(Map<String, Object> map) {
		List<NewsBoard> list = null;
		try {
			list = dao.selectList("newsBoard.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("newsBoard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	// 게시물 가져오기
	@Override
	public NewsBoard readBoard(int boardIdx) {
		NewsBoard dto = null;
		try {
			dto = dao.selectOne("newsBoard.readBoard", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int boardIdx) {
		int result = 0;
		try {
			result = dao.updateData("newsBoard.updateHitCount", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public NewsBoard preReadBoard(Map<String, Object> map) {
		NewsBoard dto = null;
		try {
			dto = dao.selectOne("newsBoard.preReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public NewsBoard nextReadBoard(Map<String, Object> map) {
		NewsBoard dto = null;
		try {
			dto = dao.selectOne("newsBoard.nextReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(NewsBoard dto, String pathname) {
		int result = 0;
		try {
			dao.updateData("newsBoard.updateBoard", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteBoard(int boardIdx, String pathname, String userId) {
		int result = 0;
		try {
			NewsBoard dto = readBoard(boardIdx);
			if(dto == null || (!userId.equals("admin") && !userId.equals(dto.getUserId())))
				return result;
			
			dao.deleteData("newsBoard.deleteBoard", boardIdx);
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<NewsBoard> listCategory() {
		List<NewsBoard> list = null;
		try {
			list = dao.selectList("newsBoard.listCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
