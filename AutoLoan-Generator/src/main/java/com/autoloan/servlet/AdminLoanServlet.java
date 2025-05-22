package com.autoloan.servlet;

import java.io.IOException;
import java.util.List;

import com.autoloan.dao.LoanDao;
import com.autoloan.dao.impl.LoanDaoImpl;
import com.autoloan.model.Loan;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminLoanServlet")
public class AdminLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private LoanDao loanDAO = new LoanDaoImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Loan> loans = loanDAO.getAllLoans();
        request.setAttribute("loans", loans);
        request.getRequestDispatcher("adminDashboard.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Handle loan approval/rejection action by admin
        String loanIdStr = request.getParameter("loanId");
        String action = request.getParameter("action"); // "approve" or "reject"

        if (loanIdStr == null || action == null || (!action.equals("approve") && !action.equals("reject"))) {
            response.sendRedirect("AdminLoanServlet?error=Invalid action");
            return;
        }

        try {
            int loanId = Integer.parseInt(loanIdStr);
            Loan loan = loanDAO.getLoansByUserId(loanId);
            if (loan == null) {
                response.sendRedirect("AdminLoanServlet?error=Loan not found");
                return;
            }

            if ("approve".equals(action)) {
                loan.setStatus("Approved");
            } else if ("reject".equals(action)) {
                loan.setStatus("Rejected");
            }

            loanDAO.updateLoan(loan);

            response.sendRedirect("AdminLoanServlet?success=Loan "+action+"d successfully");
        } catch (NumberFormatException e) {
            response.sendRedirect("AdminLoanServlet?error=Invalid loan ID");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminLoanServlet?error=An error occurred");
        }
    }
}
