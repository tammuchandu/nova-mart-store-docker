<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Mini Store | Home</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">

    <style>
        body {
    margin: 0;
    height: 100vh;
    background: 
        linear-gradient(rgba(0,0,0,0.45), rgba(0,0,0,0.45)),
        url(<%= request.getContextPath() %>/images/shoppingbg.png);

    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;

    font-family: 'Poppins', sans-serif;
}


        /* ===== Top Center Brand ===== */
        .brand {
            position: absolute;
            top: 30px;
            left: 50%;
            transform: translateX(-50%);
            text-align: center;
            color: white;
        }

        .brand h1 {
            margin: 0;
            font-size: 48px;
            font-weight: 800;
            letter-spacing: 3px;
            background: linear-gradient(90deg, #ffffff, #c7d2fe);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 4px 12px rgba(0,0,0,0.6);
        }

        .brand span {
            display: block;
            margin-top: 6px;
            font-size: 14px;
            letter-spacing: 4px;
            text-transform: uppercase;
            color: #e0e7ff;
        }

        /* ===== Left Card ===== */
        .container {
            background: rgba(255, 255, 255, 0.95);
            padding: 60px;
            border-radius: 16px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.4);
            position: absolute;
            left: 40px;
            top: 50%;
            transform: translateY(-50%);
            min-width: 320px;
        }

        .container h2 {
            margin-bottom: 30px;
            font-size: 26px;
            color: #2c3e50;
        }

        a {
            display: block;
            margin: 15px 0;
            padding: 16px 24px;
            border-radius: 10px;
            text-decoration: none;
            color: white;
            font-weight: 600;
            width: 200px;
            text-align: center;
            font-size: 18px;
            transition: all 0.2s ease;
        }

        a:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
        }

        .register { background: #22c55e; }
        .login { background: #3b82f6; }
    </style>
</head>

<body>

<!-- Top Center Brand -->
<div class="brand">
    <h1>Nova Mart Store</h1>
    <span>Smart Online Shopping</span>
</div>

<!-- Left Card -->
<div class="container">
    <h2>Welcome to Mini Store</h2>
    <a href="${pageContext.request.contextPath}/register" class="register">Register</a>
    <a href="${pageContext.request.contextPath}/login" class="login">Login</a>
</div>

</body>
</html>
