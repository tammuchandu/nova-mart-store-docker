<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Register | Nova Mart  Store</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        * { box-sizing: border-box; font-family: 'Poppins', sans-serif; }
       body {
    margin: 0;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;

    /* background image added */
    background:
        linear-gradient(135deg, rgba(102,126,234,0.65), rgba(118,75,162,0.65)),
        url("<%= request.getContextPath() %>/images/shoppingproductsbg.png");

    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
}


        .register-card {
            background: #ffffff;
            width: 420px;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 25px 55px rgba(0,0,0,0.25);
        }

        .register-card h2 { text-align: center; margin-bottom: 8px; font-weight: 600; color: #333; }
        .register-card p { text-align: center; font-size: 14px; color: #777; margin-bottom: 28px; }

        .form-group { margin-bottom: 18px; }
        .form-group label { font-size: 13px; color: #555; display: block; margin-bottom: 6px; }
        .form-group input { width: 100%; padding: 12px; border-radius: 8px; border: 1px solid #ccc; outline: none; transition: 0.3s; }
        .form-group input:focus { border-color: #667eea; box-shadow: 0 0 0 2px rgba(102,126,234,0.2); }

        .error { color: red; font-size: 13px; margin-top: 4px; }
        .error-msg { color: red; font-weight: bold; margin-bottom: 12px; text-align: center; }

        .btn-register {
            width: 100%;
            padding: 12px;
            background: #667eea;
            border: none;
            border-radius: 10px;
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: 0.3s ease;
            margin-top: 10px;
        }

        .btn-register:hover { background: #5a67d8; transform: translateY(-2px); }

        .footer-text { text-align: center; margin-top: 20px; font-size: 13px; color: #888; }
        .footer-text a { color: #667eea; text-decoration: none; font-weight: 500; }
    </style>
</head>

<body>

<div class="register-card">
    <h2>Create Account 🚀</h2>
    <p>Join Mini Store in just a few steps</p>

    <!-- Global error (e.g., duplicate username/email) -->
    <c:if test="${not empty errorMsg}">
        <div class="error-msg">${errorMsg}</div>
    </c:if>

    <form:form modelAttribute="user" method="post">

        <div class="form-group">
            <label>Username</label>
            <form:input path="username" placeholder="Enter username"/>
            <form:errors path="username" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Phone</label>
            <form:input path="phone" placeholder="Enter phone number"/>
            <form:errors path="phone" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Email</label>
            <form:input path="email" placeholder="Enter email address"/>
            <form:errors path="email" cssClass="error"/>
        </div>

        <div class="form-group">
            <label>Password</label>
            <form:password path="password" placeholder="Create password"/>
            <form:errors path="password" cssClass="error"/>
        </div>

        <button type="submit" class="btn-register">Register</button>
    </form:form>

    <div class="footer-text">
        Already have an account? 
        <a href="${pageContext.request.contextPath}/login">Login</a>
    </div>
</div>

</body>
</html>
