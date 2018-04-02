package com.ssb.customerManageService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

@Service("customerManageService.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertBoard(Board dto, String pathname) {
		int result = 0;
		try {
			int seq = dao.selectOne("customerManageService.seq");
			dto.setBoardIdx(seq);
			result = dao.insertData("customerManageService.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;
		try {
			list = dao.selectList("customerManageService.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<Board> listCategory() {
		List<Board> list = null;
		try {
			list = dao.selectList("customerManageService.listCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("customerManageService.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board readBoard(int boardIdx) {
		Board dto = null;
		try {
			dto = dao.selectOne("customerManageService.readBoard", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int boardIdx) {
		int result = 0;
		try {
			result = dao.updateData("customerManageService.updateHitCount", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("customerManageService.preReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("customerManageService.nextReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Board dto, String pathname) {
		int result = 0;
		try {
			dao.updateData("customerManageService.updateBoard", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteBoard(int boardIdx) {
		int result = 0;
		try {
			result=dao.deleteData("customerManageService.deleteBoard", boardIdx);
		} catch (Exception e) {
		}
		return result;
	}
}
