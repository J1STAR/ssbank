package com.ssb.referenceRoom;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

@Service("referenceRoom.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBoard(Board dto, String pathname) {
		int result = 0;
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			result = dao.insertData("referenceRoom.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list = null;
		try {
			list = dao.selectList("referenceRoom.listBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("referenceRoom.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board readBoard(int num) {
		Board dto = null;
		try {
			dto = dao.selectOne("referenceRoom.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("referencaeRoom.updateHitCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("referenceRoom.preReadboard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto = null;
		try {
			dto = dao.selectOne("referenceRoom.nextReadBoard", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateBoard(Board dto, String pathname) {
		int result = 0;
		try {
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				if(dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0) 
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			
			dao.updateData("referenceRoom.updateBiard", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteBoard(int num, String pathname, String userId) {
		int result = 0;
		try {
			Board dto = readBoard(num);
			if(dto==null || (!userId.equals("admin") && !userId.equals(dto.getUserId()))) 
				return result;
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dao.deleteData("referenceRoom.deleteBoard", num);
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}

}
