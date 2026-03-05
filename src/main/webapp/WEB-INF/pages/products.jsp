<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>Products | Nova Mart Store</title>

<!-- Google Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">

<style>
body {
    margin: 0;
    font-family: 'Poppins', sans-serif;
    background-image: url("<%= request.getContextPath() %>/images/netWorkbg.png");
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-attachment: fixed;
}

.overlay {
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.15);
    z-index: -1;
}

/* Navbar */
.navbar {
    background: rgba(102, 126, 234, 0.95);
    padding: 15px 40px;
    color: white;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.navbar h3 { margin: 0; }

/* Products Grid */
.products {
    padding: 40px;
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 30px;
    max-width: 1200px;
    margin: auto;
}

/* Card */
.card {
    background: rgba(255,255,255,0.85);
    border-radius: 16px;
    padding: 25px 15px;
    text-align: center;
    box-shadow: 0 15px 40px rgba(0,0,0,0.15);
    transition: 0.3s;
}
.card:hover {
    transform: translateY(-8px);
}

.card img {
    width: 160px;
    height: 160px;
    object-fit: cover;
    border-radius: 12px;
}

.price {
    color: #16a34a;
    font-weight: 600;
}

/* Buy Button */
.buy {
    display: inline-block;
    margin-top: 10px;
    padding: 10px 25px;
    background: #667eea;
    color: white;
    border-radius: 10px;
    text-decoration: none;
}

/* Pagination */
.pagination {
    display: flex;
    justify-content: center;
    gap: 12px;
    margin: 30px 0 50px;
}

.pagination a,
.pagination span {
    padding: 8px 16px;
    border-radius: 8px;
    background: #667eea;
    color: white;
    text-decoration: none;
}

.pagination .disabled {
    background: #c7d2fe;
}
</style>
</head>

<body>

<div class="overlay"></div>

<!-- Navbar -->
<div class="navbar">
    <h3>Nova Mart Store 🛍️</h3>
    <a href="logout" style="color:white;">Logout</a>
</div>

<!-- Products -->
<div class="products">
    <c:forEach var="p" items="${pageData.content}">
        <div class="card">
            <img src="${pageContext.request.contextPath}/product/image/${p.id}" alt="${p.name}">
            <h4>${p.name}</h4>
            <div class="price">₹ ${p.price}</div>
            <a href="order" class="buy">Buy Now</a>
        </div>
    </c:forEach>
</div>

<!-- Pagination -->
<div class="pagination">

    <c:choose>
        <c:when test="${pageData.hasPrevious()}">
            <a href="${pageContext.request.contextPath}/products?page=${pageData.number - 1}">
                ⬅ Previous
            </a>
        </c:when>
        <c:otherwise>
            <span class="disabled">⬅ Previous</span>
        </c:otherwise>
    </c:choose>

    <span>
        Page ${pageData.number + 1} of ${pageData.totalPages}
    </span>

    <c:choose>
        <c:when test="${pageData.hasNext()}">
            <a href="${pageContext.request.contextPath}/products?page=${pageData.number + 1}">
                Next ➡
            </a>
        </c:when>
        <c:otherwise>
            <span class="disabled">Next ➡</span>
        </c:otherwise>
    </c:choose>

</div>

</body>
</html>