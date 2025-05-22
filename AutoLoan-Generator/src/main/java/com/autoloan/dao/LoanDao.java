package com.autoloan.dao;

import java.util.List;

import com.autoloan.model.Loan;

public interface LoanDao {

	boolean saveLoan(Loan loan);
	Loan getLoansByUserId(int userId);
	List<Loan> getAllLoans();
	boolean updateLoan(Loan loan);
}
