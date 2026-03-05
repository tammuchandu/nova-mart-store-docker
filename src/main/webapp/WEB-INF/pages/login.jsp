<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Login | Nova Mart  Store</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * {
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

      body {
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;

    /* background image fixed */
    background:
        linear-gradient(135deg, rgba(102,126,234,0.65), rgba(118,75,162,0.65)),
        url("<%= request.getContextPath() %>/images/shoppingloginbg.png");

    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}



        .login-card {
            background: #fff;
            width: 380px;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 20px 45px rgba(0,0,0,0.25);
        }

        .login-card h2 {
            text-align: center;
            margin-bottom: 10px;
            font-weight: 600;
            color: #333;
        }

        .login-card p {
            text-align: center;
            font-size: 14px;
            color: #777;
            margin-bottom: 25px;
        }

        .alert-success {
            background: #e6fffa;
            color: #047857;
            padding: 10px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }

        .alert-error {
            background: #fee2e2;
            color: #b91c1c;
            padding: 10px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 15px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            font-size: 13px;
            color: #555;
            margin-bottom: 5px;
            display: block;
        }

        .form-group input {
            width: 100%;
            padding: 11px;
            border-radius: 8px;
            border: 1px solid #ccc;
            outline: none;
            transition: 0.3s;
        }

        .form-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 2px rgba(102,126,234,0.2);
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #667eea;
            border: none;
            border-radius: 8px;
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #5a67d8;
            transform: translateY(-2px);
        }

        .footer-text {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #888;
        }

        .footer-text a {
            color: #667eea;
            text-decoration: none;
            font-weight: 500;
        }
    </style>
</head>

<body>

<div class="login-card">
    <h2>Welcome Back 👋</h2>
    <p>Please login to your account</p>

    <!-- Success message (after registration) -->
    <c:if test="${not empty msg}">
        <div class="alert-success">${msg}</div>
    </c:if>

    <!-- Error message (login failure / empty fields) -->
    <c:if test="${not empty errorMsg}">
        <div class="alert-error">${errorMsg}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/login" method="post">

    <div class="form-group">
        <label>Username</label>
        <input type="text"
               name="username"
               placeholder="Enter username"
               value="${user.username}">
    </div>

    <div class="form-group">
        <label>Password</label>
        <input type="password"
               name="password"
               placeholder="Enter password">
    </div>

    <button type="submit" class="btn-login">Login</button>
</form>


    <div class="footer-text">
        Don’t have an account?
        <a href="register">Register</a>
    </div>
</div>

</body>
</html>
