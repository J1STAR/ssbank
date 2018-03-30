package com.ssb.carAcBook;

import java.util.List;
import java.util.Map;

public interface CarAcBookService {
	
	// 각종 리스트 뽑기
	public List<CarAcBook> myCarList(Map<String, Object> map); //내 차 목록
	public List<CarAcBook> carModelList(Map<String, Object> map); //모든 차 목록(셀렉트 박스를 위함.)	
	public List<CarAcBook> myRecordList(Map<String, Object> map); // 기록 목록
	
	public int insertCarAcBook(CarAcBook dto); //입력
	
	//각종 수정
	public int updateMyCar(CarAcBook dto); //내 차 수정
	
	//각종 삭제
	public int deleteMyCar(CarAcBook dto); //내 차 삭제
	
/*	
	public int insertAccountBook(CarAcBook dto);
	public int deleteAccountBook(CarAcBook dto);
	public int updateAccountBook(CarAcBook dto);
	
	//수입, 지출 합계
	public int expenseTot(Map<String, Object> map);
	public int incomeTot(Map<String, Object> map);
	
	//각종 리스트 뽑기
	public List<CarAcBook> expenseList(Map<String, Object> map);
	public List<CarAcBook> incomeList(Map<String, Object> map);
	public List<CarAcBook> calendarList(Map<String, Object> map);
*/
}
