package com.ssb.referenceRoom;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;
import com.ssb.noticeBoard.Notice;

@Service("referenceRoom.referenceRoomService")
public class ReferenceRoomServiceImpl implements ReferenceRoomService{
	@Autowired
	private CommonDAO dao;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public int insertReferenceRoom(ReferenceRoom dto, String pathname) {
		int result = 0;
		try {
			int seq = dao.selectOne("referenceRoom.seq");
			dto.setBoardIdx(seq);
			result = dao.insertData("referenceRoom.insertReferenceRoom", dto);
			
			// 파일 업로드
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if(saveFileName!=null) {
						String originalFileName = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFileName(originalFileName);
						dto.setSaveFileName(saveFileName);
						dto.setFileSize(fileSize);
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
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
	public List<ReferenceRoom> listReferenceRoom(Map<String, Object> map) {
		List<ReferenceRoom> list = null;
		try {
			list = dao.selectList("referenceRoom.listReferenceRoom", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	@Override
	public int updateHitCount(int boardIdx) {
		int result = 0;
		try {
			result = dao.updateData("referenceRoom.updateHitCount", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<ReferenceRoom> listCategory() {
		List<ReferenceRoom> list = null;
		try {
			list = dao.selectList("referenceRoom.listCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}
	@Override
	public ReferenceRoom readReferenceRoom(int boardIdx) {
		ReferenceRoom dto = null;
		try {
			dto = dao.selectOne("referenceRoom.readReferenceRoom", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	@Override
	public ReferenceRoom preReadReferenceRoom(Map<String, Object> map) {
		ReferenceRoom dto = null;
		try {
			dto = dao.selectOne("referenceRoom.preReadReferenceRoom", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	@Override
	public ReferenceRoom nextReadReferenceRoom(Map<String, Object> map) {
		ReferenceRoom dto = null;
		try {
			dto = dao.selectOne("referenceRoom.nextReadReferenceRoom", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	@Override
	public int updateReferenceRoom(ReferenceRoom dto, String pathname) {
		int result = 0;
		try {
			result = dao.updateData("referenceRoom.updateNotice", dto);
			
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFileName = fileManager.doFileUpload(mf, pathname);
					if(saveFileName!=null) {
						String originalFileName = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFileName(originalFileName);
						dto.setSaveFileName(saveFileName);
						dto.setFileSize(fileSize);
						insertFile(dto);
					}
				}
			}
		} catch (Exception e) {
		}
		return result;
	}
	@Override
	public int deleteReferenceRoom(int boardIdx, String pathname, String userId) {
		int result = 0;
		try {
			List<ReferenceRoom> listFile = listFile(boardIdx);
			if(listFile!=null) {
				Iterator<ReferenceRoom> it = listFile.iterator();
				while(it.hasNext()) {
					ReferenceRoom dto = it.next();
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "boardIdx");
			map.put("boardIdx", boardIdx);
			deleteFile(map);
			
			result = dao.deleteData("referenceRoom.deleteReferenceRoom", boardIdx);
		} catch (Exception e) {
		}
		return result;
	}
	@Override
	public int insertFile(ReferenceRoom dto) {
		int result = 0;
		try {
			result = dao.insertData("referenceRoom.insertFile", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	@Override
	public List<ReferenceRoom> listFile(int boardIdx) {
		List<ReferenceRoom> listFile = null;
		try {
			listFile = dao.selectList("referenceRoom.listFile", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return listFile;
	}
	@Override
	public ReferenceRoom readFile(int fileIdx) {
		ReferenceRoom dto = null;
		try {
			dto = dao.selectOne("referenceRoom.readFile", fileIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}
	@Override
	public int deleteFile(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("referenceRoom.deleteFile", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
}
