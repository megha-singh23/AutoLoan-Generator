<%@ page import="com.autoloan.model.User" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Apply for Auto Loan</title>
    <meta charset="UTF-8"/>
        <link rel="icon" type="image/png" href="img/logo.png">
    
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: #fff;
        }
        .form-container {
            background: rgba(0,0,0,0.65);
            max-width: 450px;
            margin: 60px auto;
            padding: 30px 35px;
            border-radius: 16px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.5);
        }
        .btn-primary {
            background: #764ba2;
            border: none;
        }
        .btn-primary:hover {
            background: #667eea;
        }
        .header {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }
        .error-msg, .success-msg {
            text-align: center;
            margin-bottom: 15px;
            font-weight: 600;
        }
        .error-msg {
            color: #ff6b6b;
        }
        .success-msg {
            color: #90ee90;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h3 class="header">Apply for an Auto Loan</h3>

    <% if (request.getAttribute("error") != null) { %>
        <div class="error-msg"><%= request.getAttribute("error") %></div>
    <% } %>
    <% if (session.getAttribute("message") != null) { %>
        <div class="success-msg"><%= session.getAttribute("message") %></div>
        <% session.removeAttribute("message"); %>
    <% } %>

    <form action="ApplyLoanServlet" method="post" novalidate>
        <div class="mb-3">
            <label for="loanAmount" class="form-label">Loan Amount ($)</label>
            <input type="number" step="0.01" min="0" class="form-control" id="loanAmount" name="loanAmount"
                   placeholder="Enter loan amount" required/>
        </div>
        <div class="mb-3">
            <label for="loanTermMonths" class="form-label">Loan Term (Months)</label>
            <input type="number" min="1" class="form-control" id="loanTermMonths" name="loanTermMonths"
                   placeholder="Enter loan term in months" required/>
        </div>
        <div class="mb-3">
            <label for="interestRate" class="form-label">Interest Rate (%)</label>
            <input type="number" step="0.01" min="0" class="form-control" id="interestRate" name="interestRate"
                   placeholder="Enter interest rate" required/>
        </div>
        <button type="submit" class="btn btn-primary w-100">Submit Application</button>
    </form>
    <div class="mt-3 text-center">
        <a href="loanStatus.jsp" class="text-white">View My Loan Status</a> | 
        <a href="logout.jsp" class="text-white">Logout</a>
    </div>
</div>
</body>
</html>