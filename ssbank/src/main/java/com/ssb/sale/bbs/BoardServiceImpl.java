package com.ssb.sale.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

@Service("sale.bbs.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBoard(Board dto, String pathname) {
		int result = 0;
		try {
			result = dao.insertData("bbs.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;
		try {
			list = dao.selectList("bbs.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("bbs.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	// 게시물 가져오기
	@Override
	public Board readBoard(int boardIdx) {
		Board dto = null;
		try {
			dto = dao.selectOne("bbs.readBoard", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int boardIdx) {
		int result = 0;
		try {
			result = dao.updateData("bbs.updateHitCount", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("bbs.preReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("bbs.nextReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Board dto, String pathname) {
		int result = 0;
		try {
			dao.updateData("bbs.updateBoard", dto);
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
			Board dto = readBoard(boardIdx);
			if(dto == null || (!userId.equals("admin") && !userId.equals(dto.getUserId())))
				return result;
			
			dao.deleteData("bbs.deleteBoard", boardIdx);
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Board> listCategory() {
		List<Board> list = null;
		try {
			list = dao.selectList("bbs.listCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

}
