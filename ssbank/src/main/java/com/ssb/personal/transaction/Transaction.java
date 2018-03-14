package com.ssb.personal.transaction;

public class Transaction {
	
	private int trIdx;
	private int trDetailIdx;
	
	private int tType;
	
	private String accountNo;
	
	private int amount;
	private int balance;
	public int getTrIdx() {
		return trIdx;
	}
	public void setTrIdx(int trIdx) {
		this.trIdx = trIdx;
	}
	public int getTrDetailIdx() {
		return trDetailIdx;
	}
	public void setTrDetailIdx(int trDetailIdx) {
		this.trDetailIdx = trDetailIdx;
	}
	public int gettType() {
		return tType;
	}
	public void settType(int tType) {
		this.tType = tType;
	}
	public String getAccountNo() {
		return accountNo;
	}
	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
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
	
	
}
