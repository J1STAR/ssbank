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
			result = dao.insertData("newsBoard.inserBoard", dto);
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
	public NewsBoard readBoard(int num) {
		NewsBoard dto = null;
		try {
			dto = dao.selectOne("newsBoard.readBoard", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("newsBoard.updateHitCount", num);
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
	public int deleteBoard(int num, String pathname, String userId) {
		int result = 0;
		try {
			NewsBoard dto = readBoard(num);
			if(dto == null || (!userId.equals("admin") && !userId.equals(dto.getUserId())))
				return result;
			
			dao.deleteData("newsBoard.deleteBoard", num);
			result = 1;
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int insertReply(NewsReply dto) {
		int result = 0;
		try {
			result = dao.insertData("newsBoard.insertReply", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<NewsReply> listReply(Map<String, Object> map) {
		List<NewsReply> list = null;
		try {
			list = dao.selectList("newsBoard.listReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("newsBoard.replyCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteReply(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("newsBoard.deleteReply", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<NewsReply> listReplyAnswer(int answer) {
		List<NewsReply> list = null;
		try {
			list = dao.selectList("newsBoard.listReplyAsnwer", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int replyAnswerCount(int answer) {
		int result = 0;
		try {
			result = dao.selectOne("newsBoard.replyAnswerCount", answer);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int insertReplyLike(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.insertData("newsBoard.insertReplyLike", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		try {
			countMap = dao.selectOne("newsBoard.replyLikeCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return countMap;
	}

}
