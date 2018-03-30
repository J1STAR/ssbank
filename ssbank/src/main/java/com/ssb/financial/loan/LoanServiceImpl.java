package com.ssb.financial.loan;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssb.common.dao.CommonDAO;

@Service("loan.loanService")
public class LoanServiceImpl implements LoanService{
	@Autowired
	private CommonDAO dao;

	@Override
	public Loan newMember(int memberIdx) {
		Loan dto =null;
		try {
			dto=dao.selectOne("loan.newMember",memberIdx);
			dto.setName(dto.getLastName() + dto.getFirstName());
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public String productName(int productIdx) {
		String dto=null;
		try {
			dto=dao.selectOne("loan.productName",productIdx);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public int insertLoan(Loan dto) {
		int result=0;
		try {
			dao.callUpdateProcedure("loan.insertLoan", dto);
			result=1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}
	
	@Override
	public Loan createLoan(Map<String, Object> map) {
		Loan dto =null;
		try {
			dto=dao.selectOne("loan.createLoan",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public int totalLoan(Map<String, Object> map) {
		int result=0;
		try {
			result=dao.selectOne("loan.totalLoan", map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<Loan> loanList(Map<String, Object> map) {
		List<Loan> dto = null;
		try {
			dto=dao.selectList("loan.loanList",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}

	@Override
	public int repay(Loan dto) {
		int result=0;
		try {
			dao.callUpdateProcedure("loan.repayLoan", dto);
			result=1;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return result;
	}

	@Override
	public List<Loan> repayList(Map<String, Object> map) {
		List<Loan> list = null;
		try {
			list=dao.selectList("loan.repayList",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	@Override
	public Loan loanPayment(Map<String, Object> map) {
		Loan dto=null;
		try {
			dto=dao.selectOne("loan.loanPayment",map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return dto;
	}


}
