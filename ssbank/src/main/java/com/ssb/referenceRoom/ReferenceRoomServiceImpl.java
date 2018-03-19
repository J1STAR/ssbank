package com.ssb.referenceRoom;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;
import com.ssb.noticeBoard.Notice;

@Service("referenceRoom.boardService")
public class ReferenceRoomServiceImpl implements ReferenceRoomService{
	@Autowired
	private CommonDAO dao;
	@Autowired
	private FileManager fileManager;
	@Override
	public int insertReferenceBoom(ReferenceRoom dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<ReferenceRoom> listReferenceRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateHitCount(int boardIdx) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<ReferenceRoom> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Notice readNotice(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Notice preReadReferenceRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Notice nextReadReferenceRoom(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int updateReferenceRoom(ReferenceRoom dto, String pathname) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int deleteReferenceRoom(int boardIdx, String pathname, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int insertFile(ReferenceRoom dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<ReferenceRoom> listFile(int boardIdx) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public ReferenceRoom readFile(int fileIdx) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int deleteFile(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
