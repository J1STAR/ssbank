package com.ssb.noticeBoard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;
import com.ssb.newsBoard.NewsBoard;

import ch.qos.logback.core.net.SyslogOutputStream;

@Service("noticeBoard.noticeService")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public int insertNotice(Notice dto, String pathname) {
		int result = 0;
		try {
			result = dao.insertData("notice.insertBoard", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.selectOne("notice.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateHitCount(int boardIdx) {
		int result = 0;
		try {
			result = dao.updateData("notice.updateHitCount", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public Notice readNotice(int boardIdx) {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.readNotice", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.preReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.nextReadNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result = 0;
		try {
			dao.updateData("notice.updateNotice", dto);
			result = 1;
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public int deleteNotice(int boardIdx, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertFile(Notice dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listFile(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notice readFile(int fileNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Notice> listCategory() {
		List<Notice> list = null;
		try {
			list = dao.selectList("newsBoard.listCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	
	
}
