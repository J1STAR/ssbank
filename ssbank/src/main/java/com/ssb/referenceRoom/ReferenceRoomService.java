package com.ssb.referenceRoom;

import java.util.List;
import java.util.Map;

import com.ssb.noticeBoard.Notice;

public interface ReferenceRoomService {
	public int insertReferenceBoom(ReferenceRoom dto, String pathname);
	public int dataCount(Map<String, Object> map);
	public List<ReferenceRoom> listReferenceRoom(Map<String, Object> map);
	public int updateHitCount(int boardIdx);
	public List<ReferenceRoom> listCategory();
	public Notice readNotice(int boardIdx);
	public Notice preReadReferenceRoom(Map<String, Object> map);
	public Notice nextReadReferenceRoom(Map<String, Object> map);
	public int updateReferenceRoom(ReferenceRoom dto, String pathname);
	public int deleteReferenceRoom(int boardIdx, String pathname, String userId);
	
	public int insertFile(ReferenceRoom dto);
	public List<ReferenceRoom> listFile(int boardIdx);
	public ReferenceRoom readFile(int fileIdx);
	public int deleteFile(Map<String, Object> map);
}
