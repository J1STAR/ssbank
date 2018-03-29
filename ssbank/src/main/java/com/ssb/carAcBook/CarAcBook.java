package com.ssb.carAcBook;

public class CarAcBook {
	private int carAcBookIdx, memberIdx, myCarIdx, //차계부
				year, buyYear, //내 차 테이블
				fuelTankSize, displacement, fuelEfficiency, //차모델
				partNo, needDistance, status, // 부품 리스트
				oilingIdx, oilAmount, oilingAmount, //주유(주유금액)
				distanceIdx, totalDistance, //주행거리
				etcIdx, detailIdx, etcAmount, classIdx, // 기타(금액)
				mainIdx, mainAmount; //정비(정비 금액)
				
				
	private String modelNo, trans, fuelType, //내 차 테이블
	        modelName, modelDetail, partName, //차 모델, 부품 리스트
	        oilingPlace, oilingDate, //주유(주유 장소, 일자)
	        startPlace, endPlace, //주행거리
	        etcPlace, //기타장소
	        detailName, etcName, //분류상세, 분류명
	        maintenance, mainPlace, mainDate;//정비(정비명, 정비장소)


	public synchronized int getCarAcBookIdx() {
		return carAcBookIdx;
	}


	public synchronized void setCarAcBookIdx(int carAcBookIdx) {
		this.carAcBookIdx = carAcBookIdx;
	}


	public synchronized int getMemberIdx() {
		return memberIdx;
	}


	public synchronized void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}


	public synchronized int getMyCarIdx() {
		return myCarIdx;
	}


	public synchronized void setMyCarIdx(int myCarIdx) {
		this.myCarIdx = myCarIdx;
	}


	public synchronized int getYear() {
		return year;
	}


	public synchronized void setYear(int year) {
		this.year = year;
	}


	public synchronized int getBuyYear() {
		return buyYear;
	}


	public synchronized void setBuyYear(int buyYear) {
		this.buyYear = buyYear;
	}


	public synchronized int getFuelTankSize() {
		return fuelTankSize;
	}


	public synchronized void setFuelTankSize(int fuelTankSize) {
		this.fuelTankSize = fuelTankSize;
	}


	public synchronized int getDisplacement() {
		return displacement;
	}


	public synchronized void setDisplacement(int displacement) {
		this.displacement = displacement;
	}


	public synchronized int getFuelEfficiency() {
		return fuelEfficiency;
	}


	public synchronized void setFuelEfficiency(int fuelEfficiency) {
		this.fuelEfficiency = fuelEfficiency;
	}


	public synchronized int getPartNo() {
		return partNo;
	}


	public synchronized void setPartNo(int partNo) {
		this.partNo = partNo;
	}


	public synchronized int getNeedDistance() {
		return needDistance;
	}


	public synchronized void setNeedDistance(int needDistance) {
		this.needDistance = needDistance;
	}


	public synchronized int getStatus() {
		return status;
	}


	public synchronized void setStatus(int status) {
		this.status = status;
	}


	public synchronized int getOilingIdx() {
		return oilingIdx;
	}


	public synchronized void setOilingIdx(int oilingIdx) {
		this.oilingIdx = oilingIdx;
	}


	public synchronized int getOilAmount() {
		return oilAmount;
	}


	public synchronized void setOilAmount(int oilAmount) {
		this.oilAmount = oilAmount;
	}


	public synchronized int getOilingAmount() {
		return oilingAmount;
	}


	public synchronized void setOilingAmount(int oilingAmount) {
		this.oilingAmount = oilingAmount;
	}


	public synchronized int getDistanceIdx() {
		return distanceIdx;
	}


	public synchronized void setDistanceIdx(int distanceIdx) {
		this.distanceIdx = distanceIdx;
	}


	public synchronized int getTotalDistance() {
		return totalDistance;
	}


	public synchronized void setTotalDistance(int totalDistance) {
		this.totalDistance = totalDistance;
	}


	public synchronized int getEtcIdx() {
		return etcIdx;
	}


	public synchronized void setEtcIdx(int etcIdx) {
		this.etcIdx = etcIdx;
	}


	public synchronized int getDetailIdx() {
		return detailIdx;
	}


	public synchronized void setDetailIdx(int detailIdx) {
		this.detailIdx = detailIdx;
	}


	public synchronized int getEtcAmount() {
		return etcAmount;
	}


	public synchronized void setEtcAmount(int etcAmount) {
		this.etcAmount = etcAmount;
	}


	public synchronized int getClassIdx() {
		return classIdx;
	}


	public synchronized void setClassIdx(int classIdx) {
		this.classIdx = classIdx;
	}


	public synchronized int getMainIdx() {
		return mainIdx;
	}


	public synchronized void setMainIdx(int mainIdx) {
		this.mainIdx = mainIdx;
	}


	public synchronized int getMainAmount() {
		return mainAmount;
	}


	public synchronized void setMainAmount(int mainAmount) {
		this.mainAmount = mainAmount;
	}


	public synchronized String getModelNo() {
		return modelNo;
	}


	public synchronized void setModelNo(String modelNo) {
		this.modelNo = modelNo;
	}


	public synchronized String getTrans() {
		return trans;
	}


	public synchronized void setTrans(String trans) {
		this.trans = trans;
	}


	public synchronized String getFuelType() {
		return fuelType;
	}


	public synchronized void setFuelType(String fuelType) {
		this.fuelType = fuelType;
	}


	public synchronized String getModelName() {
		return modelName;
	}


	public synchronized void setModelName(String modelName) {
		this.modelName = modelName;
	}


	public synchronized String getModelDetail() {
		return modelDetail;
	}


	public synchronized void setModelDetail(String modelDetail) {
		this.modelDetail = modelDetail;
	}


	public synchronized String getPartName() {
		return partName;
	}


	public synchronized void setPartName(String partName) {
		this.partName = partName;
	}


	public synchronized String getOilingPlace() {
		return oilingPlace;
	}


	public synchronized void setOilingPlace(String oilingPlace) {
		this.oilingPlace = oilingPlace;
	}


	public synchronized String getOilingDate() {
		return oilingDate;
	}


	public synchronized void setOilingDate(String oilingDate) {
		this.oilingDate = oilingDate;
	}


	public synchronized String getStartPlace() {
		return startPlace;
	}


	public synchronized void setStartPlace(String startPlace) {
		this.startPlace = startPlace;
	}


	public synchronized String getEndPlace() {
		return endPlace;
	}


	public synchronized void setEndPlace(String endPlace) {
		this.endPlace = endPlace;
	}


	public synchronized String getEtcPlace() {
		return etcPlace;
	}


	public synchronized void setEtcPlace(String etcPlace) {
		this.etcPlace = etcPlace;
	}


	public synchronized String getDetailName() {
		return detailName;
	}


	public synchronized void setDetailName(String detailName) {
		this.detailName = detailName;
	}


	public synchronized String getEtcName() {
		return etcName;
	}


	public synchronized void setEtcName(String etcName) {
		this.etcName = etcName;
	}


	public synchronized String getMaintenance() {
		return maintenance;
	}


	public synchronized void setMaintenance(String maintenance) {
		this.maintenance = maintenance;
	}


	public synchronized String getMainPlace() {
		return mainPlace;
	}


	public synchronized void setMainPlace(String mainPlace) {
		this.mainPlace = mainPlace;
	}


	public synchronized String getMainDate() {
		return mainDate;
	}


	public synchronized void setMainDate(String mainDate) {
		this.mainDate = mainDate;
	}
	
	
	
}
