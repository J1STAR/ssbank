package com.ssb.financial.account;

/*
 *  userId   		-- userId(Email)
	memberIdx       -- 회원번호
	userPwd        -- 비밀번호
	createDate      -- 계정생성일
	lastLogin       -- 마지막 로그인
	status          -- 계정상태
	--계좌
	accountNo  VARCHAR2(16)  NOT NULL, -- 계좌번호
	memberIdx  NUMBER        NULL,     -- 회원번호
	branchIdx  NUMBER        NULL,     -- 지점코드
	productIdx NUMBER        NULL,     -- 상품코드
	empIdx     VARCHAR2(32)  NULL,     -- 직원코드
	accountPwd VARCHAR2(100) NULL,     -- 계좌 비밀번호
	createDate DATE          NULL,     -- 계좌생성일
	status     NUMBER(1)     NULL      -- 계좌 상태
	--예금
	productIdx   NUMBER      NOT NULL, -- 상품코드
	interestRate NUMBER(5,2) NULL      -- 이율
	--적금
	productIdx   NUMBER       NOT NULL, -- 상품코드
	productType  VARCHAR2(16) NULL,     -- 상품타입
	entryDate    DATE         NULL,     -- 가입기간
	monthly      NUMBER       NULL,     -- 월 납입금액
	interest     NUMBER(4,2)  NULL,     -- 기본 이율
	vipInterest  NUMBER(4,2)  NULL,     -- 우대이율
	savingType   VARCHAR2(16) NULL,     -- 저축방법
	interestType VARCHAR2(16) NULL,     -- 이자지급방식
	tax          NUMBER(4,2)  NULL      -- 과세
 */
public class Account {
	// 예금/적금조회
	private String accountNo;
	private int balance;
	private int branchIdx, productIdx, status, defaultInterest, vipInterest, tax, monthlyAmount;
	private String productName, productDetail, productType;
	private String createDate, entryDate, userId, accountPwd, savingType, interestType;
	private String lastTrDate;
	// 신규
	private int memberIdx;
	private String name,lastName, firstName, birth;
	private String addr1, addr2,tel;
	private int zipCode;
	private double interestRate, interest;
	
	
	
	
	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public double getInterest() {
		return interest;
	}

	public void setInterest(double interest) {
		this.interest = interest;
	}

	public String getAccountNo() {
		return accountNo;
	}

	public void setAccountNo(String accountNo) {
		this.accountNo = accountNo;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public int getBranchIdx() {
		return branchIdx;
	}

	public void setBranchIdx(int branchIdx) {
		this.branchIdx = branchIdx;
	}

	public int getProductIdx() {
		return productIdx;
	}

	public void setProductIdx(int productIdx) {
		this.productIdx = productIdx;
	}

	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDetail() {
		return productDetail;
	}

	public void setProductDetail(String productDetail) {
		this.productDetail = productDetail;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAccountPwd() {
		return accountPwd;
	}

	public void setAccountPwd(String accountPwd) {
		this.accountPwd = accountPwd;
	}

	public int getDefaultInterest() {
		return defaultInterest;
	}

	public void setDefaultInterest(int defaultInterest) {
		this.defaultInterest = defaultInterest;
	}

	public int getVipInterest() {
		return vipInterest;
	}

	public void setVipInterest(int vipInterest) {
		this.vipInterest = vipInterest;
	}

	public int getTax() {
		return tax;
	}

	public void setTax(int tax) {
		this.tax = tax;
	}

	public int getMonthlyAmount() {
		return monthlyAmount;
	}

	public void setMonthlyAmount(int monthlyAmount) {
		this.monthlyAmount = monthlyAmount;
	}

	public String getProductType() {
		return productType;
	}

	public void setProductType(String productType) {
		this.productType = productType;
	}

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getSavingType() {
		return savingType;
	}

	public void setSavingType(String savingType) {
		this.savingType = savingType;
	}

	public String getInterestType() {
		return interestType;
	}

	public void setInterestType(String interestType) {
		this.interestType = interestType;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public int getZipCode() {
		return zipCode;
	}

	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}

	

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLastTrDate() {
		return lastTrDate;
	}

	public void setLastTrDate(String lastTrDate) {
		this.lastTrDate = lastTrDate;
	}

	@Override
	public String toString() {
		return "Account [accountNo=" + accountNo + ", balance=" + balance + ", branchIdx=" + branchIdx + ", productIdx="
				+ productIdx + ", status=" + status + ", defaultInterest=" + defaultInterest + ", vipInterest="
				+ vipInterest + ", tax=" + tax + ", monthlyAmount=" + monthlyAmount + ", productName=" + productName
				+ ", productDetail=" + productDetail + ", productType=" + productType + ", createDate=" + createDate
				+ ", entryDate=" + entryDate + ", userId=" + userId + ", accountPwd=" + accountPwd + ", savingType="
				+ savingType + ", interestType=" + interestType + ", lastTrDate=" + lastTrDate + ", memberIdx="
				+ memberIdx + ", name=" + name + ", lastName=" + lastName + ", firstName=" + firstName + ", birth="
				+ birth + ", addr1=" + addr1 + ", addr2=" + addr2 + ", tel=" + tel + ", zipCode=" + zipCode
				+ ", interestRate=" + interestRate + ", interest=" + interest + "]";
	}

	
}
