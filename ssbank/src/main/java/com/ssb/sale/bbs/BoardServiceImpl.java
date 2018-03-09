package com.ssb.sale.bbs;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.sale.bbs.Board;
import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

@Service("sale.bbs.boardService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private CommonDAO  dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertBoard(Board dto, String pathname) {
		int result=0;
		try{
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) {
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			result=dao.insertData("bbs.insertBoard", dto);
			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		List<Board> list=null;
		
		try{
			list=dao.selectList("bbs.listBoard", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result=0;
		
		try{
			result=dao.selectOne("bbs.dataCount", map);			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public Board readBoard(int num) {
		Board dto=null;
		
		try{
			// 게시물 가져오기
			dto=dao.selectOne("bbs.readBoard", num);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result=0;
		
		try{
			// 조회수 증가
			result=dao.updateData("bbs.updateHitCount", num);
			
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
	
	@Override
	public Board preReadBoard(Map<String, Object> map) {
		Board dto=null;
		
		try{
			dto=dao.selectOne("bbs.preReadBoard", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;

	}

	@Override
	public Board nextReadBoard(Map<String, Object> map) {
		Board dto=null;
		
		try{
			dto=dao.selectOne("bbs.nextReadBoard", map);
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}
	
	@Override
	public int updateBoard(Board dto, String pathname) {
		int result=0;

		try{
			String saveFilename = fileManager.doFileUpload(dto.getUpload(), pathname);
			if(saveFilename != null) { //업로드된파일이 존재
				if(dto.getSaveFilename() != null && dto.getSaveFilename().length() != 0)
				fileManager.doFileDelete(dto.getSaveFilename(), pathname); //save된 파일이 있으면 지워라
			
				dto.setSaveFilename(saveFilename);
				dto.setOriginalFilename(dto.getUpload().getOriginalFilename());
			}
			dao.updateData("bbs.updateBoard", dto);
			result=1;
		} catch(Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteBoard(int num, String pathname, String userId) {
		int result=0;

		try{
			Board dto = readBoard(num);
			if(dto == null || (!userId.equals("admin") && ! userId.equals(dto.getUserId())))
				return result;
			
			fileManager.doFileDelete(dto.getSaveFilename(), pathname);
			
			dao.deleteData("bbs.deleteBoard", num);
			result=1;
		} catch(Exception e) {
		}
		return result;
	}

	@Override
	public int insertReply(Reply dto) {
		int result = 0;
		try {
			result = dao.insertData("bbs.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		try {
			list = dao.selectList("bbs.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyDataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("bbs.replyDataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("bbs.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Reply> listReplyAnswer(int answer) {
		List<Reply> list = null;
		try {
			list = dao.selectList("bbs.listReplyAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyCountAnswer(int answer) {
		int result = 0;
		try {
			result = dao.selectOne("bbs.replyCountAnswer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReplyLike(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("bbs.insertReplyLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		try {
			countMap = dao.selectOne("sale.bbs.replyLikeCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return countMap;
	}

	@Override
	public int insertBoardLike(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("sale.bbs.insertBoardLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int likeBoardCount(int num) {
		int result = 0;
		try {
			result = dao.selectOne("sale.bbs.likeBoardCount", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertFile(Board dto) {
		int result=0;
		try {
			result=dao.insertData("sale.bbs.insertFile", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}	
	@Override
	public List<Board> listFile(int num) {
		List<Board> listFile=null;
		
		try {
			listFile=dao.selectList("sale.bbs.listFile", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return listFile;
	}

	@Override
	public Board readFile(int fileNum) {
		Board dto=null;
		
		try {
			dto=dao.selectOne("sale.bbs.readFile", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result=0;
		
		try {
			result=dao.deleteData("sale.bbs.deleteFile", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}
}
