package com.ssb.noticeBoard;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.ssb.common.FileManager;
import com.ssb.common.dao.CommonDAO;

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
			int seq = dao.selectOne("notice.seq");
			dto.setBoardIdx(seq);
			result = dao.insertData("notice.insertNotice", dto);
			
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
			result = dao.updateData("notice.updateNotice", dto);
			
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
	public int deleteNotice(int boardIdx, String pathname, String userId) {
		int result = 0;
		try {
			List<Notice> listFile = listFile(boardIdx);
			if(listFile!=null) {
				Iterator<Notice> it = listFile.iterator();
				while(it.hasNext()) {
					Notice dto = it.next();
					fileManager.doFileDelete(dto.getSaveFileName(), pathname);
				}
			}
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "boardIdx");
			map.put("boardIdx", boardIdx);
			deleteFile(map);
			
			result = dao.deleteData("notice.deleteNotice", boardIdx);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Notice> listCategory() {
		List<Notice> list = null;
		try {
			list = dao.selectList("notice.listCategory");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int insertFile(Notice dto) {
		int result = 0;
		try {
			result = dao.insertData("notice.insertFile", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listFile(int boardIdx) {
		List<Notice> listFile = null;
		try {
			listFile = dao.selectList("notice.listFile", boardIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return listFile;
	}

	@Override
	public Notice readFile(int fileIdx) {
		Notice dto = null;
		try {
			dto = dao.selectOne("notice.readFile", fileIdx);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("notice.deleteFile", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}
	
	
}
