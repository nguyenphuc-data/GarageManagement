<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Service Details</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body { font-family: 'Inter', sans-serif; background: #f4f5f7; padding: 40px 20px; }
        .card { max-width: 600px; margin: auto; background: white; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,.1); padding: 36px; }
        h2 { text-align: center; color: #1a202c; font-size: 2rem; margin-bottom: 32px; }
        .row { display: flex; padding: 18px 0; border-bottom: 1px solid #e2e8f0; }
        .label { font-weight: 600; color: #4a5568; width: 160px; }
        .value { flex: 1; color: #1a202c; font-weight: 500; }
        .price { font-size: 1.6rem; font-weight: 700; color: #2f855a; }
        .back a { color: #4a5568; text-decoration: none; font-weight: 600; margin: 0 15px; }
        .back a:hover { text-decoration: underline; }
        .notfound { text-align: center; padding: 20px; background: #fff5f5; color: #e53e3e; border-radius: 12px; }
    </style>
</head>
<body>
<div class="card">
    <h2>Service Details</h2>
    <c:choose>
        <c:when test="${not empty service}">
            <div class="row"><span class="label">ID:</span><span class="value">${service.id}</span></div>
            <div class="row"><span class="label">Name:</span><span class="value">${service.name}</span></div>
            <div class="row"><span class="label">Price:</span><span class="value price"><fmt:formatNumber value="${service.price}" pattern="#,##0"/> VND</span></div>
            <div class="row" style="border:none;"><span class="label">Desc:</span><span class="value">${service.desc}</span></div>
        </c:when>
        <c:otherwise><p class="notfound">Service not found!</p></c:otherwise>
    </c:choose>
    <p class="back" style="text-align:center; margin-top:40px;">
        <a href="${pageContext.request.contextPath}/service?keyword=${keyword}">Back to List</a> |
        <a href="${pageContext.request.contextPath}/Login/ifCustomerHome.jsp">Home</a>
    </p>
</div>
</body>
</html>