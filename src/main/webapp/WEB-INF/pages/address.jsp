<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Delivery Address</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            margin: 0;
            height: 100vh;

            /* Background Image + Gradient Overlay */
            background:
                linear-gradient(135deg, rgba(102,126,234,0.6), rgba(118,75,162,0.6)),
                url(<%= request.getContextPath() %>/images/productdeliverybg.png);

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
            background: rgba(255, 255, 255, 0.9);
        }

        .error {
            color: red;
            font-size: 0.9rem;
        }
    </style>
</head>

<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-lg p-4">
                <h3 class="text-center mb-4">🚚 Delivery Address</h3>

                <c:if test="${not empty errorMsg}">
                    <div class="alert alert-danger">
                        ${errorMsg}
                    </div>
                </c:if>

                <form:form action="${pageContext.request.contextPath}/order"
                           modelAttribute="address"
                           method="post">

                    <div class="mb-3">
                        <label class="form-label">House / Flat</label>
                        <form:input path="house" cssClass="form-control"/>
                        <form:errors path="house" cssClass="error"/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">City</label>
                        <form:input path="city" cssClass="form-control"/>
                        <form:errors path="city" cssClass="error"/>
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Pincode</label>
                        <form:input path="pincode" cssClass="form-control"/>
                        <form:errors path="pincode" cssClass="error"/>
                    </div>

                    <div class="d-grid">
                        <button type="submit" class="btn btn-primary">
                            Place Order
                        </button>
                    </div>

                </form:form>

            </div>

        </div>
    </div>
</div>

</body>
</html>