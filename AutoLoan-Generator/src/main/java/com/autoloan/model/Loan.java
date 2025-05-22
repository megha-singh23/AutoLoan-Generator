package com.autoloan.model;

import java.io.Serializable;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "loans")
public class Loan implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private double loanAmount;
    private int loanTermMonths;
    private double interestRate;
    private String status;

    public Loan() {
		
	}




	public Loan(int id, User user, double loanAmount, int loanTermMonths, double interestRate, String status) {
		super();
		this.id = id;
		this.user = user;
		this.loanAmount = loanAmount;
		this.loanTermMonths = loanTermMonths;
		this.interestRate = interestRate;
		this.status = status;
	}




	public int getId() {
		return id;
	}




	public void setId(int id) {
		this.id = id;
	}




	public User getUser() {
		return user;
	}




	public void setUser(User user) {
		this.user = user;
	}




	public double getLoanAmount() {
		return loanAmount;
	}




	public void setLoanAmount(double loanAmount) {
		this.loanAmount = loanAmount;
	}




	public int getLoanTermMonths() {
		return loanTermMonths;
	}
	
	public void setLoanTermMonths(int loanTermMonths) {
		this.loanTermMonths = loanTermMonths;
	}




	public double getInterestRate() {
		return interestRate;
	}




	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Loan [id=" + id + ", " + (user != null ? "user=" + user + ", " : "") + "loanAmount=" + loanAmount
				+ ", loanTermMonths=" + loanTermMonths + ", interestRate=" + interestRate + ", "
				+ (status != null ? "status=" + status : "") + "]";
	}




	public double calculateMonthlyPayment() {
        double monthlyInterestRate = (interestRate / 100) / 12;
        if (monthlyInterestRate == 0) {
            return loanAmount / loanTermMonths;
        }
        double numerator = loanAmount * monthlyInterestRate * Math.pow(1 + monthlyInterestRate, loanTermMonths);
        double denominator = Math.pow(1 + monthlyInterestRate, loanTermMonths) - 1;
        return numerator / denominator;
    }
}
