package com.ssb.assetManagement;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssb.member.SessionInfo;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


@Controller("assetManagement.AssetManageController")
public class AssetManageController {
	
	@Autowired
	AssetManagerService service;
	
	@RequestMapping(value="/assetManage/main")
	public String main() throws Exception {
		return ".assetManage.main";
	}
	
	@RequestMapping(value="/assetManage/accountbook")
	public String accountBook() throws Exception{
		
		return ".assetManage.accountbook";
	}
	
	@RequestMapping(value="/assetManage/carbook")
	public String carBook() throws Exception{
		
		return ".assetManage.carbook";
	}
	@RequestMapping(value="/assetManage/myAsset")
	public String myAsset() throws Exception{
		
		return ".assetManage.myAsset";
	}
	
	
	@RequestMapping(value="/assetManage/pie3d", produces="application/json; charset=utf-8")
	@ResponseBody
	public String pie3d(HttpSession session) throws Exception {
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx",info.getMemberIdx());
		
		List<AssetManage> list = service.assetList(map);
		
		
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "지출");
		
		JSONArray ja=new JSONArray();
		
		for(AssetManage dto:list) {
			ja.add("['"+dto.getCategoryName()+"', "+dto.getPercent()+"]");
		}
		ob.put("data", ja);
		arr.add(ob);
		
		return arr.toString();

	}
	@RequestMapping(value="/assetManage/chart2", produces="application/json; charset=utf-8")
	@ResponseBody
	public String chartRotation(HttpSession session) throws Exception {	
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx",info.getMemberIdx());
		
		List<AssetManage> list = service.assetDateList(map);
		
		
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "지출");
		
		JSONArray ja=new JSONArray();
		
		for(AssetManage dto:list) {
			ja.add("['"+dto.getAccountBookDate()+"', "+dto.getAmount()+"]");
		}
		ob.put("data", ja);
		arr.add(ob);
		
		return arr.toString();
	}
	@RequestMapping(value="/assetManage/carbookChart", produces="application/json; charset=utf-8")
	@ResponseBody
	public String carbook(HttpSession session) throws Exception {	
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx",info.getMemberIdx());
		
		List<AssetManage> list = service.carBookDateList(map);
		
		
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "날짜");
		
		JSONArray ja=new JSONArray();
		
		for(AssetManage dto:list) {
			ja.add("['"+dto.getDriveDate()+"', "+dto.getTotalDistance()+"]");
		}
		ob.put("data", ja);
		arr.add(ob);
		
		return arr.toString();
	}
	@RequestMapping(value="/assetManage/carOiling", produces="application/json; charset=utf-8")
	@ResponseBody
	public String carOiling(HttpSession session) throws Exception {	
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx",info.getMemberIdx());
		
		List<AssetManage> list = service.carOiling(map);
		
		
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "날짜");
		
		JSONArray ja=new JSONArray();
		JSONArray ja2= new JSONArray();
		for(AssetManage dto:list) {
			ja.add("['"+dto.getOilingDate()+"',"+dto.getOilAmount()+"]");
			ja2.add("['"+dto.getOilingDate()+"',"+dto.getAmount()+"]");
		}
		ob.put("data1", ja);
		ob.put("data2", ja2);
		arr.add(ob);
		
		return arr.toString();
	}
	@RequestMapping(value="/assetManage/myAsset", produces="application/json; charset=utf-8")
	@ResponseBody
	public String myAsset(HttpSession session) throws Exception {	
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx",info.getMemberIdx());
		
		List<AssetManage> list = service.myAsset(map);
		
		
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
		ob.put("name", "날짜");
		
		JSONArray ja=new JSONArray();
		for(AssetManage dto:list) {
			ja.add("['"+dto.getProductName()+"',"+dto.getBalance()+"]");

		}
		ob.put("data", ja);
		arr.add(ob);
		
		return arr.toString();
	}
	@RequestMapping(value="/assetManage/myAssetList", produces="application/json; charset=utf-8")
	@ResponseBody
	public String myAssetList(HttpSession session) throws Exception {	
		
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx",info.getMemberIdx());
		
		List<AssetManage> list = service.myAssetList(map);
		
		JSONArray arr=new JSONArray();
		
		JSONObject ob=new JSONObject();
	
		ob.put("name", "비율");
		
		
		JSONArray ja=new JSONArray();
		for(AssetManage dto:list) {
			ja.add("['"+dto.getCategoryName()+"',"+dto.getPercent()+"]");

		}
		ob.put("data", ja);

		arr.add(ob);
		
		return arr.toString();
	}
}
