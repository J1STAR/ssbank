package com.ssb.assetManagement;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;


@Service("assetManagement")
public class AssetManageServiceImpl implements AssetManagerService{

	@Autowired
	private CommonDAO dao;
	
	@Override
	public List<AssetManage> assetList(Map<String, Object> map) {
	List<AssetManage> list=null;	
		try {
			list =dao.selectList("assetMapper.assetList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<AssetManage> assetDateList(Map<String, Object> map) {
		List<AssetManage> list=null;	
		try {
			list =dao.selectList("assetMapper.assetDateList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<AssetManage> carBookDateList(Map<String, Object> map) {
		
		List<AssetManage>list=null;
		try {
			list=dao.selectList("assetMapper.carBookDateList",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}

	@Override
	public List<AssetManage> carOiling(Map<String, Object> map) {
		List<AssetManage>list=null;
		try {
			list=dao.selectList("assetMapper.carOiling",map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return list;
	}



}
