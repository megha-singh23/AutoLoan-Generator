<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Auto Loan Generator</title>
    <link rel="icon" type="image/png" href="img/logo.png">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;

			
        }
        .hero {
/*              background-image: linear-gradient(to bottom, #4CAF50, #3e8e41);   */
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
/*             color: #fff; */
            text-align: center;
        }
        .hero-content {
            max-width: 800px;
            padding: 2rem;
        }
        .cta-button {
           background-color: #333; 
            color: #fff;
            padding: 12px 30px;
            font-size: 18px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            text-decoration: none;
            display: inline-block;
        }
        .cta-button:hover {
            background-color: #444;
        }
    </style>
</head>
<body>
    <!-- Public Landing Page -->
    <div class="hero">
        <div class="hero-content">
        <img src="img/logo.png">
            <h1 class="display-4">Welcome to Auto Loan Generator</h1>
            <p class="lead">Get the best loan deals for your dream car with competitive rates</p>
            <a href="login.jsp" class="cta-button">Login to Get Started</a>
            <p style="margin-top: 20px;">Don't have an account? <a href="register.jsp" style="color:blue; text-decoration: underline;">Register here</a></p>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>