<%@ page import="com.autoloan.model.Loan" %>
<%@ page import="com.autoloan.model.User" %>
<%@ page import="com.autoloan.dao.LoanDao" %>
<%@ page import="com.autoloan.dao.impl.LoanDaoImpl" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>My Loan Status</title>
        <link rel="icon" type="image/png" href="img/logo.png">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: #1a1a1a;
            font-family: 'Poppins', sans-serif;
            color: white;
            min-height: 100vh;
            padding: 40px 15px;
        }
        .table-wrapper {
            max-width: 900px;
            margin: auto;
            background: #121212;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6);
            padding: 25px 30px;
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }
        table {
            color: white;
        }
        .btn-back {
            margin-top: 20px;
            text-align: center;
        }
        a {
            color: #7abaff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .status-pending { color: orange; font-weight: 600; }
        .status-approved { color: #4caf50; font-weight: 600; }
        .status-rejected { color: #f44336; font-weight: 600; }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
	System.out.println("----"+user);
    if (user == null) {
        response.sendRedirect("login.jsp?error=Please login first");
        return;
    }
    LoanDao loanDAO = new LoanDaoImpl();
    Loan loan = loanDAO.getLoansByUserId(user.getId());
%>
<div class="table-wrapper">
    <h2>My Loan Application</h2>
    <%
        if (loan == null) {
    %>
        <p class="text-center">You have no loan applications.</p>
    <%  } else { %>
        <table class="table table-dark table-striped">
            <thead>
            <tr>
            <th>Name</th>
                <th>Amount ($)</th>
                <th>Term (Months)</th>
                <th>Interest Rate (%)</th>
                <th>Status</th>
                <th>Monthly Payment ($)</th>
            </tr>
            </thead>
            <tbody>
                <tr>
                <td><%=user.getUsername()%></td>
                    <td><%= String.format("%.2f", loan.getLoanAmount())%></td>
                    <td><%= loan.getLoanTermMonths() %></td>
                    <td><%= String.format("%.2f", loan.getInterestRate()) %></td>
   
                    <%
    String cssClass;
    switch (loan.getStatus().toLowerCase()) {
        case "approved":
            cssClass = "status-approved";
            break;
        case "rejected":
            cssClass = "status-rejected";
            break;
        default:
            cssClass = "status-pending";
            break;
    }
%>

<td class="<%= cssClass %>"><%= loan.getStatus() %></td>

                    <td><%= String.format("%.2f", loan.calculateMonthlyPayment()) %></td>
                </tr>
            </tbody>
        </table>
    <% } %>
    <div class="btn-back text-center">
        <a href="applyLoan.jsp">Apply New Loan</a> | <a href="logout.jsp">Logout</a>
    </div>
</div>
</body>
</html>