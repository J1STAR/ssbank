package com.ssb.accountBook;

public class AccountBook {
	//네이버 계산기를 기준으로 줄일 것 늘릴 것 적어두기
	private int acBookIdx, memberIdx, classIdx, categoryIdx, amount;
	private String content, name, categoryName, accountBookDate;
	
	public synchronized int getAcBookIdx() {
		return acBookIdx;
	}
	public synchronized void setAcBookIdx(int acBookIdx) {
		this.acBookIdx = acBookIdx;
	}
	public synchronized int getMemberIdx() {
		return memberIdx;
	}
	public synchronized void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
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
	public synchronized String getContent() {
		return content;
	}
	public synchronized void setContent(String content) {
		this.content = content;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccountBookDate() {
		return accountBookDate;
	}
	public void setAccountBookDate(String accountBookDate) {
		this.accountBookDate = accountBookDate;
	}
	
}
