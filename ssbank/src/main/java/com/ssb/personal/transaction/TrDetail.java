package com.ssb.personal.transaction;

public class TrDetail {
	private int tDetailIdx;
	private String sender;
	private int trIdx;
	
	// Receiver
	private String accountNo;
	
	// Sender
	private String accountNo2;
	
	private String relativeBank;

	public int gettDetailIdx() {
		return tDetailIdx;
	}

	public void settDetailIdx(int tDetailIdx) {
		this.tDetailIdx = tDetailIdx;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public int getTrIdx() {
		return trIdx;
	}

	public void setTrIdx(int trIdx) {
		this.trIdx = trIdx;
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

	public String getRelativeBank() {
		return relativeBank;
	}

	public void setRelativeBank(String relativeBank) {
		this.relativeBank = relativeBank;
	}
	
	
}
