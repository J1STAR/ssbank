package com.ssb.accountBook;

public class AccountBook {
	//신한은행 계산기를 기준으로 줄일 것 늘릴 것 적어두기
	private int acBookIdx, memberIdx, classIdx, categoryIdx, amount;
	private String content, name, categoryName, accountBookDate;
	
	//공통단 수입과 지출 누계
	private int expenseTot, incomeTot, total;
	
	public int getAcBookIdx() {
		return acBookIdx;
	}
	public void setAcBookIdx(int acBookIdx) {
		this.acBookIdx = acBookIdx;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getClassIdx() {
		return classIdx;
	}
	public void setClassIdx(int classIdx) {
		this.classIdx = classIdx;
	}
	public int getCategoryIdx() {
		return categoryIdx;
	}
	public void setCategoryIdx(int categoryIdx) {
		this.categoryIdx = categoryIdx;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
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
	public int getExpenseTot() {
		return expenseTot;
	}
	public void setExpenseTot(int expenseTot) {
		this.expenseTot = expenseTot;
	}
	public int getIncomeTot() {
		return incomeTot;
	}
	public void setIncomeTot(int incomeTot) {
		this.incomeTot = incomeTot;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
