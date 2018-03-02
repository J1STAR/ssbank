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
			int seq = dao.selectOne("noticeBoard.seq");
			dto.setNum(seq);
			
			result = dao.insertData("noticeBoard.insertNotice", dto);
			
			// 파일 업로드
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename!=null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
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
			result = dao.selectOne("noticeBoard.dataCount", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<Notice> listNotice(Map<String, Object> map) {
		List<Notice> list = null;
		try {
			list =  dao.selectList("noticeBoard.listNotice", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return list;
	}

	@Override
	public List<Notice> listNoticeTop() {
		List<Notice> list = null;
		try {
			list = dao.selectList("noticeBoard.listNoticeTop");
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public int updateHitCount(int num) {
		int result = 0;
		try {
			result = dao.updateData("noticeBoard.updateHitCount", num);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public Notice readNotice(int num) {
		Notice dto = null;
		try {
			dto = dao.selectOne("noticeBoard.readNotice", num);
		} catch (Exception e) {
		}
		return dto;
	}

	@Override
	public Notice preReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto = dao.selectOne("noticeBoard.preReadNotice", map);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public Notice nextReadNotice(Map<String, Object> map) {
		Notice dto = null;
		try {
			dto = dao.selectOne("noticeBoard.nextReadNotice", map);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public int updateNotice(Notice dto, String pathname) {
		int result = 0;
		try {
			result = dao.updateData("noticeBoard.updateNotice", dto);
			
			if(!dto.getUpload().isEmpty()) {
				for(MultipartFile mf:dto.getUpload()) {
					if(mf.isEmpty())
						continue;
					
					String saveFilename = fileManager.doFileUpload(mf, pathname);
					if(saveFilename != null) {
						String originalFilename = mf.getOriginalFilename();
						long fileSize = mf.getSize();
						
						dto.setOriginalFilename(originalFilename);
						dto.setSaveFilename(saveFilename);
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
	public int deleteNotice(int num, String pathname) {
		int result = 0;
		try {
			// 파일 지움
			List<Notice> listFile = listFile(num);
			if(listFile != null) {
				Iterator<Notice> it = listFile.iterator();
				while(it.hasNext()) {
					Notice dto = it.next();
					fileManager.doFileDelete(dto.getSaveFilename(), pathname);
				}
			}
			
			// 파일 테이블 내용 지움
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("field", "num");
			map.put("num", num);
			deleteFile(map);
			
			result = dao.deleteData("noticeBoard.deleteNotice", num);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public int insertFile(Notice dto) {
		int result = 0;
		try {
			result = dao.insertData("noticeBoard.insertFile", dto);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

	@Override
	public List<Notice> listFile(int num) {
		List<Notice> listFile	= null;
		try {
			listFile = dao.selectOne("noticeBoard.listFile", num);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return listFile;
	}

	@Override
	public Notice readFile(int fileNum) {
		Notice dto = null;
		try {
			dto = dao.selectOne("noticeBoard.readFile", fileNum);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return dto;
	}

	@Override
	public int deleteFile(Map<String, Object> map) {
		int result = 0;
		try {
			result = dao.deleteData("noticeBoard.deleteFile", map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return result;
	}

}
