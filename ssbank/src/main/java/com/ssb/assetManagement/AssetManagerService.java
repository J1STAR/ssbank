package com.ssb.assetManagement;

import java.util.List;
import java.util.Map;


public interface AssetManagerService {

	public List<AssetManage> assetList(Map<String, Object> map);
	public List<AssetManage> assetDateList(Map<String, Object> map);
	public List<AssetManage> carBookDateList(Map<String, Object> map);
	public List<AssetManage> carOiling(Map<String, Object> map);
	public List<AssetManage> myAsset(Map<String, Object> map);
	public List<AssetManage> myAssetList(Map<String, Object> map);
}
