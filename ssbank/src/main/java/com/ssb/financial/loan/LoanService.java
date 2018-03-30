package com.ssb.financial.loan;

import java.util.List;
import java.util.Map;

public interface LoanService {
	
	//대출 신규
	public Loan newMember(int memberIdx);
	public String productName(int productIdx);
	public int insertLoan(Loan dto);
	public Loan createLoan(Map<String, Object>map);
	// 리스트
	public int totalLoan(Map <String, Object> map);
	public List<Loan> loanList(Map <String, Object> map);
	
	//대출 상환
	public int repay(Loan dto);
	public List<Loan> repayList(Map <String, Object> map);
	public int loanPayment(Map <String, Object> map);
}
