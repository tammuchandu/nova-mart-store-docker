<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            height: 100vh;

            /* Background Image + Green/Blue Gradient */
            background:
                linear-gradient(135deg, rgba(67,206,162,0.65), rgba(24,90,157,0.65)),
                url("<%= request.getContextPath() %>/images/productdeliverybg.png");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .card {
            border-radius: 15px;
            backdrop-filter: blur(8px);
            background: rgba(255, 255, 255, 0.92);
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg p-4 text-center">

                <h3 class="text-success mb-3">
                    ✅ ${msg}
                </h3>

                <p class="lead">Your order has been placed successfully!</p>

                <hr>

                <h5 class="mb-3">📦 Delivery Address</h5>

                <div class="text-start">
                    <p><strong>House:</strong> ${address.house}</p>
                    <p><strong>City:</strong> ${address.city}</p>
                    <p><strong>Pincode:</strong> ${address.pincode}</p>
                </div>

                <div class="d-grid mt-4">
                    <a href="${pageContext.request.contextPath}/products"
                       class="btn btn-success">
                        Continue Shopping
                    </a>
                </div>

            </div>

        </div>
    </div>
</div>

</body>
</html>