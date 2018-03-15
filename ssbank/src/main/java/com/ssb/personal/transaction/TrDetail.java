package com.ssb.personal.transaction;

public class TrDetail {
	
	private int trDetailIdx;
	
	private int atmIdx;
	
	private String accountNo;
	private String accountNo2;
	
	private String trDate;
	private String content;
	public int getTrDetailIdx() {
		return trDetailIdx;
	}
	public void setTrDetailIdx(int trDetailIdx) {
		this.trDetailIdx = trDetailIdx;
	}
	public int getAtmIdx() {
		return atmIdx;
	}
	public void setAtmIdx(int atmIdx) {
		this.atmIdx = atmIdx;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public String getAccountNo2() {
		return accountNo2;
	}
	public void setAccountNo2(String accountNo2) {
		this.accountNo2 = accountNo2;
	}
	public String getTrDate() {
		return trDate;
	}
	public void setTrDate(String trDate) {
		this.trDate = trDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
