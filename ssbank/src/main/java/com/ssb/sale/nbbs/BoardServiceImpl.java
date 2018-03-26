package com.ssb.sale.nbbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

@Service("nbbs.boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBoard(Board dto, String pathname) {
		int result=0;
		try{
			if(dto.getUpload()!=null && ! dto.getUpload().isEmpty()) {
				String saveFilename=fileManager.doFileUpload(dto.getUpload(), pathname);
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}			
			result=dao.insertData("nbbs.insertBoard", dto);
		} catch(Exception e) {
		}
			
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list=null;
		
		try{
			list=dao.selectList("nbbs.listBoard", map);
		} catch(Exception e) {
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("nbbs.dataCount", map);			
		} catch(Exception e) {
		}
		
		return result;
	}

	@Override
	public Board readBoard(int num) {
		Board dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.selectOne("nbbs.readBoard", num);
		} catch(Exception e) {
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;

		try{
			result=dao.updateData("nbbs.updateHitCount", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto=null;
		
		try{
			dto=dao.selectOne("nbbs.preReadBoard", map);
		} catch(Exception e) {
		}
		
		return dto;
	}
	
	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto=null;
		
		try{
			dto=dao.selectOne("nbbs.nextReadBoard", map);
		} catch(Exception e) {
		}
		
		return dto;
	}

	@Override
	public int updateBoard(Board dto, String pathname) {
		int result=0;

		try{
			if(dto.getUpload()!=null && !dto.getUpload().isEmpty()) {
				// 이전파일 지우기
				if(dto.getSaveFilename().length()!=0)
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				
				String newFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
				if (newFilename != null) {
					dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
					dto.setSaveFilename(newFilename);
				}
			}
			
			result=dao.updateData("nbbs.updateBoard", dto);
		} catch(Exception e) {
		}
		return result;
	}

	@Override
	public int deleteBoard(int num, String pathname, String saveFilename) {
		int result=0;

		try{
			if(saveFilename != null ) {
				  fileManager.doFileDelete(saveFilename, pathname);
			}
			
			result=dao.deleteData("nbbs.deleteBoard", num);
		} catch(Exception e) {
		}
		return result;
	}
}
