package com.ssb.accountBook;

import java.sql.Date;

public class AccountBook {
	//네이버 계산기를 기준으로 줄일 것 늘릴 것 적어두기
	
	private int acBookIdx, memberidx, classIdx, categoryIdx, amount;
	private Date accountBookDate;
	private String content;
	
	public synchronized int getAcBookIdx() {
		return acBookIdx;
	}
	public synchronized void setAcBookIdx(int acBookIdx) {
		this.acBookIdx = acBookIdx;
	}
	public synchronized int getMemberidx() {
		return memberidx;
	}
	public synchronized void setMemberidx(int memberidx) {
		this.memberidx = memberidx;
	}
	public synchronized int getClassIdx() {
		return classIdx;
	}
	public synchronized void setClassIdx(int classIdx) {
		this.classIdx = classIdx;
	}
	public synchronized int getCategoryIdx() {
		return categoryIdx;
	}
	public synchronized void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public synchronized int getAmount() {
		return amount;
	}
	public synchronized void setAmount(int amount) {
		this.amount = amount;
	}
	public synchronized Date getAccountBookDate() {
		return accountBookDate;
	}
	public synchronized void setAccountBookDate(Date accountBookDate) {
		this.accountBookDate = accountBookDate;
	}
	public synchronized String getContent() {
		return content;
	}
	public synchronized void setContent(String content) {
		this.content = content;
	}
	
}
