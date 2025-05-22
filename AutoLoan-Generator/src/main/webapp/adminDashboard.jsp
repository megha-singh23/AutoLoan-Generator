<%@ page import="com.autoloan.model.Loan" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Loan> loans = (List<Loan>) request.getAttribute("loans");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin Dashboard - Manage Loans</title>
        <link rel="icon" type="image/png" href="img/logo.png">
    
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: #222;
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
            color: white;
            padding: 30px 15px;
        }
        .dashboard-container {
            max-width: 900px;
            margin: auto;
            background: #121212;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.8);
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }
        table {
            color: white;
        }
        .btn-approve {
            background-color: #4caf50;
            border: none;
            color: white;
        }
        .btn-approve:hover {
            background-color: #45a049;
        }
        .btn-reject {
            background-color: #f44336;
            border: none;
            color: white;
        }
        .btn-reject:hover {
            background-color: #d32f2f;
        }
        a.logout-link {
            display: inline-block;
            margin-bottom: 20px;
            color: #bfbfbf;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.3s ease;
        }
        a.logout-link:hover {
            color: #fff;
        }
    </style>
</head>
<body>
<div class="dashboard-container">
    <a href="logout.jsp" class="logout-link">Logout</a>
    <h2>Admin Loan Management</h2>

    <% if (loans == null || loans.isEmpty()) { %>
        <p class="text-center">No loan applications found.</p>
    <% } else { %>
        <table class="table table-dark table-striped text-center align-middle">
            <thead>
            <tr>
                <th>#</th>
                <th>User</th>
                <th>Loan Amount</th>
                <th>Term (Months)</th>
                <th>Interest Rate (%)</th>
                <th>Status</th>
                <th>Monthly Payment</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                int count = 1;
                for (Loan loan : loans) {
                    String status = loan.getStatus();
            %>
            <tr>
                <td><%= count++ %></td>
                <td><%= loan.getUser().getUsername() %></td>
                <td>$<%= String.format("%.2f", loan.getLoanAmount()) %></td>
                <td><%= loan.getLoanTermMonths() %></td>
                <td><%= String.format("%.2f", loan.getInterestRate()) %></td>
                <td><%= status %></td>
                <td>$<%= String.format("%.2f", loan.calculateMonthlyPayment()) %></td>
                <td>
                    <% if ("Pending".equalsIgnoreCase(status)) { %>
                        <form action="AdminLoanServlet" method="post" style="display:inline;">
                            <input type="hidden" name="loanId" value="<%=loan.getId()%>"/>
                            <input type="hidden" name="action" value="approve"/>
                            <button type="submit" class="btn btn-approve btn-sm">Approve</button>
                        </form>
                        <form action="AdminLoanServlet" method="post" style="display:inline; margin-left: 5px;">
                            <input type="hidden" name="loanId" value="<%=loan.getId()%>"/>
                            <input type="hidden" name="action" value="reject"/>
                            <button type="submit" class="btn btn-reject btn-sm">Reject</button>
                        </form>
                    <% } else { %>
                        <span>-</span>
                    <% } %>
                </td>
            </tr>
            <% } %>
            </tbody>
        </table>
    <% } %>

</div>
</body>
</html>