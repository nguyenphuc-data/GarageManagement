<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Service Catalog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f4f5f7; padding: 20px; }
        .wrap { max-width: 1000px; margin: auto; background: white; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,.1); padding: 32px; }
        h2 { text-align: center; color: #1a202c; font-size: 1.9rem; }
        .search { text-align: center; margin: 30px 0; }
        input[type=text] { padding: 14px 20px; width: 450px; border: 2px solid #e2e8f0; border-radius: 12px; font-size: 16px; }
        input[type=submit] { padding: 14px 32px; background: #4a5568; color: white; border: none; border-radius: 12px; margin-left: 10px; font-weight: 600; cursor: pointer; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background: #e2e8f0; padding: 16px; text-align: left; color: #4a5568; font-size: 0.9rem; text-transform: uppercase; }
        td { padding: 16px; border-bottom: 1px solid #e2e8f0; }
        .price { font-weight: 600; color: #2f855a; }
        .link { color: #4a5568; text-decoration: none; font-weight: 600; }
        .link:hover { text-decoration: underline; }
        .no { text-align: center; padding: 30px; background: #fff5f5; color: #e53e3e; border-radius: 12px; }
    </style>
</head>
<body>
<div class="wrap">
    <h2>Service Catalog</h2>
    <div class="search">
        <form action="${pageContext.request.contextPath}/service" method="get">
            <input type="text" name="keyword" placeholder="Search service..." value="${keyword}">
            <input type="submit" value="Search">
        </form>
    </div>
    <c:if test="${not empty serviceList}">
        <table>
            <tr><th>ID</th><th>Name</th><th>Price</th><th>Action</th></tr>
            <c:forEach var="s" items="${serviceList}">
                <tr>
                    <td>${s.id}</td>
                    <td>${s.name}</td>
                    <td class="price"><fmt:formatNumber value="${s.price}" pattern="#,##0"/> VND</td>
                    <td><a href="${pageContext.request.contextPath}/service?id=${s.id}&keyword=${keyword}" class="link">View Details</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty serviceList && not empty keyword}">
        <p class="no">No services found for "${keyword}"</p>
    </c:if>
    <p style="text-align:center; margin-top:40px;">
        <a href="${pageContext.request.contextPath}/Login/ifCustomerHome.jsp" style="color:#4a5568; font-weight:500;">Back to Home</a>
    </p>
</div>
</body>
</html>