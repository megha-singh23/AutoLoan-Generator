package com.autoloan.servlet;

import java.io.IOException;

import com.autoloan.dao.LoanDao;
import com.autoloan.dao.impl.LoanDaoImpl;
import com.autoloan.model.Loan;
import com.autoloan.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ApplyLoanServlet")
public class ApplyLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoanDao loanDAO = new LoanDaoImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect("login.jsp?error=Please login to apply for a loan");
            return;
        }

        User user = (User) session.getAttribute("user");

        try {
            double loanAmount = Double.parseDouble(request.getParameter("loanAmount"));
            int loanTermMonths = Integer.parseInt(request.getParameter("loanTermMonths"));
            double interestRate = Double.parseDouble(request.getParameter("interestRate"));

            if (loanAmount <= 0 || loanTermMonths <= 0 || interestRate < 0) {
                request.setAttribute("error", "Invalid loan parameters.");
                request.getRequestDispatcher("applyLoan.jsp").forward(request, response);
                return;
            }

            Loan loan = new Loan();
            loan.setUser(user);
            loan.setLoanAmount(loanAmount);
            loan.setLoanTermMonths(loanTermMonths);
            loan.setInterestRate(interestRate);
            loan.setStatus("Pending");

            loanDAO.saveLoan(loan);

            session.setAttribute("message", "Loan application submitted successfully!");
            response.sendRedirect("loanStatus.jsp");
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Please enter valid numbers for loan fields.");
            request.getRequestDispatcher("applyLoan.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An internal error occurred. Please try again later.");
            request.getRequestDispatcher("applyLoan.jsp").forward(request, response);
        }
    }
}
