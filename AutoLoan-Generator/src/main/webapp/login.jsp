<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login - Auto Loan Generator</title>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <link rel="icon" type="image/png" href="img/logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
/*             background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); */
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            background-color: #00ced1;
   
        }
        .login-container {
/*           background: rgba(255, 255, 255, 0.1);  */
          background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 40px 50px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
            color: white;
            width: 100%;
            max-width: 400px;
            backdrop-filter: blur(8px);
        }
        .login-container h2 {
            font-weight: 700;
            margin-bottom: 30px;
            text-align: center;
            letter-spacing: 2px;
        }
        .form-control {
            background: rgba(255,255,255,0.15);
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
            background: #764ba2;
            border: none;
            font-weight: 600;
            font-size: 18px;
            height: 45px;
            transition: background 0.3s ease;
        }
        .btn-primary:hover {
            background: #667eea;
        }
        .register-link {
            text-align: center;
            margin-top: 20px;
            font-weight: 600;
        }
        .register-link a {
            color: #b9a2e9;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="post">
         <% 
            String err = (String) request.getAttribute("error");
            if (err != null) {
        %>
            <div class="text-danger"><%= err %></div>
        <% 
            } 
        %>
        <div class="mb-3">
            <label for="username" class="form-label">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username" required autofocus/>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Enter password" required/>
        </div>
        <button type="submit" class="btn btn-primary">Log In</button>
    </form>
    <div class="register-link">
        Don't have an account? <a href="register.jsp">Register here</a>
    </div>
</div>
</body>
</html>