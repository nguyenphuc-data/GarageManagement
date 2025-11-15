<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Spare Parts Catalog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body{font-family:'Inter',sans-serif;background:#f4f5f7;padding:20px}
        .wrap{max-width:1100px;margin:auto;background:white;border-radius:16px;box-shadow:0 8px 32px rgba(0,0,0,.1);padding:32px}
        .search{text-align:center;margin:30px 0}
        input[type=text]{padding:14px 20px;width:500px;border:2px solid #e2e8f0;border-radius:12px;font-size:16px}
        input[type=submit]{padding:14px 32px;background:#4a5568;color:white;border:none;border-radius:12px;margin-left:10px;font-weight:600;cursor:pointer}
        .btn-service{display:inline-block;padding:14px 32px;background:linear-gradient(90deg,#3182ce,#4299e1);color:white;border:none;border-radius:12px;margin-left:15px;font-weight:600;font-size:16px;text-decoration:none;cursor:pointer;transition:all .3s ease;box-shadow:0 4px 12px rgba(66,153,225,.2)}
        .btn-service:hover{transform:translateY(-2px);box-shadow:0 6px 18px rgba(66,153,225,.3);background:linear-gradient(90deg,#2c5282,#3182ce)}

        table{
            width:100%;
            border-collapse:collapse;
            margin-top:20px;
            font-size: 15px; /* Thêm font-size */
            table-layout: fixed; /* Thêm layout fixed */
        }
        th{
            background:#e2e8f0;
            padding:16px;
            text-align:left;
            color:#4a5568;
            font-size:.9rem;
            text-transform:uppercase;
            font-weight: 600; /* Thêm font-weight */
        }
        td{padding:16px;border-bottom:1px solid #e2e8f0}

        .text-right { text-align: right; }
        .text-center { text-align: center; }

        .col-id { width: 10%; }
        .col-name { width: 15%; }
        .col-price { width: 15%; }
        .col-stock { width: 15%; }
        .col-action { width: 20%; }

        .price{font-weight:600;color:#2f855a}
        .qty{color:#3182ce;font-weight:500}
        .link{color:#718096;font-weight:500;font-size:0.9rem;text-decoration:none}
        .link:hover{color:#4a5568;text-decoration:underline}
        .no{text-align:center;padding:30px;background:#fff5f5;color:#e53e3e;border-radius:12px}
    </style>
</head>
<body>
<div class="wrap">
    <h1 style="text-align:center; font-size:2.3rem; margin:20px 0 16px; font-weight:700; color:#1a202c; line-height:1.3;">
        Find Spare Part Information
    </h1>
    <h2 style="text-align:center; font-size:1.8rem; font-weight:600; color:#718096; margin:0;">
            Spare Part Catalog
        </h2>

    <div class="search">
        <form action="${pageContext.request.contextPath}/sparepart" method="get" style="display:inline;">
            <input type="text" name="keyword" placeholder="Search spare part..." value="${keyword}">
            <input type="submit" value="Search">
        </form>
        <a href="${pageContext.request.contextPath}/service" class="btn-service">
            Search Services
        </a>
    </div>

    <c:if test="${not empty sparePartList}">
        <table>
            <tr>
                <th class="col-id">ID</th>
                <th class="col-name">Name</th>
                <th class="col-price text-right">Price (VND)</th>
                <th class="col-stock text-right">Stock</th>
                <th class="col-action text-center">Action</th>
            </tr>
            <c:forEach var="p" items="${sparePartList}">
                <tr>
                    <td class="col-id">${p.id}</td>
                    <td class="col-name">${p.name}</td>
                    <td class="col-price text-right price">
                        <fmt:formatNumber value="${p.price}" pattern="#,##0"/>
                    </td>
                    <td class="col-stock text-right qty">${p.quantity} pcs</td>
                    <td class="col-action text-center">
                        <a href="${pageContext.request.contextPath}/sparepart?id=${p.id}&keyword=${keyword}" class="link">
                            View Details
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty sparePartList && not empty keyword}">
        <p class="no">No spare parts found for "${keyword}"</p>
    </c:if>

    <p style="text-align:center; margin-top:40px;">
        <a href="${pageContext.request.contextPath}/Login/ifMainCustomer.jsp" style="color:#4a5568; font-weight:500;">
            Back to Home
        </a>
    </p>
</div>
</body>
</html>