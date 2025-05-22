<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Logout</title>
        <link rel="icon" type="image/png" href="img/logo.png">
    
    <meta charset="UTF-8"/>
    <link rel="icon" type="image/png" href="img/logo.png">
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
        .logout-container {
            max-width: 400px;
            margin: auto;
            background: #121212;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.6);
            padding: 25px 30px;
            text-align: center;
        }
        h2 {
            margin-bottom: 20px;
            font-weight: 700;
            letter-spacing: 1.5px;
        }
        .btn-logout {
            margin-top: 20px;
            background-color: #4caf50;
            border: none;
            color: white;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 8px;
            cursor: pointer;
        }
        .btn-logout:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="logout-container">
    <h2>Logout Confirmation</h2>
    <p>Are you sure you want to logout?</p>
    <form action="LogoutServlet" method="post">
        <button type="submit" class="btn-logout">Yes, Logout</button>
    </form>
    <p class="mt-3">If you're not redirected, <a href="login.jsp">click here</a> to go back to the login page.</p>
</div>
</body>
</html>