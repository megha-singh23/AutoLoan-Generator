<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register - Auto Loan Generator</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" type="image/png" href="img/logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
        }
        .register-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.25);
            color: white;
            width: 100%;
            max-width: 450px;
            backdrop-filter: blur(6px);
        }
        .register-container h2 {
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            letter-spacing: 2px;
        }
        .form-control {
            background: rgba(255,255,255,0.12);
            border: none;
            color: white;
            height: 45px;
            border-radius: 8px;
        }
        .form-control:focus {
            background: rgba(255,255,255,0.3);
            color: white;
            box-shadow: none;
            border: none;
        }
        label {
            font-weight: 600;
            margin-bottom: 8px;
        }
        .btn-primary {
            width: 100%;
            background: #2a5298;
            border: none;
            font-weight: 600;
            font-size: 18px;
            height: 45px;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #1e3c72;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-weight: 600;
        }
        .login-link a {
            color: #a5b8d8;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Create Account</h2>
     <% 
            String err = (String) request.getAttribute("error");
            if (err != null) {
        %>
            <div class="text-danger"><%= err %></div>
        <% 
            } 
        %>
    <form action="RegisterServlet" method="post" autocomplete="off">
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" name="username" id="username" placeholder="Choose a username" required autofocus/>
        </div>
        <div class="mb-3">
            <label for="email" class="form-label">Email Address</label>
            <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email" required/>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" name="password" id="password" placeholder="Set a password" required/>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
    <div class="login-link">
        Already have an account? <a href="login.jsp">Log in</a>
    </div>
</div>
</body>
</html>