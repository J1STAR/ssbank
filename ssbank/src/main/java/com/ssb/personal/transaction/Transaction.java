package com.ssb.personal.transaction;

public class Transaction {
	private int trIdx;
	private int tType;
	private int amount;
	private int balance;
	private String trDate;
	private String content;
	private String accountNo;
	private int trDetailIdx;
	public int getTrIdx() {
		return trIdx;
	}
	public void setTrIdx(int trIdx) {
		this.trIdx = trIdx;
	}
	public int gettType() {
		return tType;
	}
	public void settType(int tType) {
		this.tType = tType;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
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
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}
	public int getTrDetailIdx() {
		return trDetailIdx;
	}
	public void setTrDetailIdx(int trDetailIdx) {
		this.trDetailIdx = trDetailIdx;
	}
	
	
}
