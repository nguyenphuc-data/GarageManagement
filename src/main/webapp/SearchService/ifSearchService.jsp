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
        body{font-family:'Inter',sans-serif;background:#f4f5f7;padding:20px}
        .wrap{max-width:1000px;margin:auto;background:#fff;border-radius:16px;box-shadow:0 8px 32px rgba(0,0,0,.1);padding:32px}
        h1{text-align:center;font-size:2.3rem;margin:20px 0 16px;font-weight:700;color:#1a202c;line-height:1.3}
        h2{text-align:center;font-size:1.8rem;font-weight:600;color:#718096;margin:0}
        .search{text-align:center;margin:30px 0}
        input[type=text]{padding:14px 20px;width:450px;border:2px solid #e2e8f0;border-radius:12px;font-size:16px}
        input[type=submit]{padding:14px 32px;background:#4a5568;color:#fff;border:none;border-radius:12px;margin-left:10px;font-weight:600;cursor:pointer}
        .btn-spare{
            display:inline-block;padding:14px 32px;
            background:linear-gradient(90deg,#2f855a,#48bb78);color:#fff;
            border:none;border-radius:12px;margin-left:15px;font-weight:600;font-size:16px;
            text-decoration:none;cursor:pointer;transition:.3s;box-shadow:0 4px 12px rgba(72,187,120,.2)
        }
        .btn-spare:hover{
            transform:translateY(-2px);
            box-shadow:0 6px 18px rgba(72,187,120,.3);
            background:linear-gradient(90deg,#276749,#38a169)
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 15px;
            table-layout: fixed; /* Ép cột tuân thủ độ rộng */
        }
        th {
            background: #e2e8f0;
            padding: 16px;
            text-align: left;
            color: #4a5568;
            font-size: .9rem;
            text-transform: uppercase;
            font-weight: 600;
        }
        td {
            padding: 16px;
            border-bottom: 1px solid #e2e8f0;
        }

        .text-right { text-align: right; }
        .text-center { text-align: center; }

        .col-id { width: 10%; }
        .col-name { width: 50%; }
        .col-price { width: 20%; }
        .col-action { width: 30%; }

        .col-id { width: 10%; }
                .col-name { width: 40%; }
                .col-price { width: 20%; }
                .col-action { width: 30%; }
        .price {
            font-weight: 600;
            color: #2f855a;
        }
        .link {
            color: #718096;
            font-weight: 500;
            font-size: 0.9rem;
            text-decoration: none;
        }
        .link:hover {
            color: #4a5568;
            text-decoration: underline;
        }
        .no {
            text-align: center;
            padding: 30px;
            background: #fff5f5;
            color: #e53e3e;
            border-radius: 12px;
        }
    </style>
</head>
<body>
<div class="wrap">
    <h1>Find Service Information</h1>
    <h2>Service Catalog</h2>

    <!-- TÌM KIẾM + NÚT CHUYỂN SANG SPARE PART -->
    <div class="search">
        <form action="${pageContext.request.contextPath}/service" method="get" style="display:inline;">
            <input type="text" name="keyword" placeholder="Search service..." value="${keyword}">
            <input type="submit" value="Search">
        </form>
        <a href="${pageContext.request.contextPath}/sparepart" class="btn-spare">
            Search Spare Parts
        </a>
    </div>

    <c:if test="${not empty serviceList}">
        <table>
            <tr>
                <th class="col-id">ID</th>
                <th class="col-name">Name</th>
                <th class="col-price text-right">Price (VND)</th>
                <th class="col-action text-center">Action</th>
            </tr>
            <c:forEach var="s" items="${serviceList}">
                <tr>
                    <td class="col-id">${s.id}</td>
                    <td class="col-name">${s.name}</td>
                    <td class="col-price text-right price">
                        <fmt:formatNumber value="${s.price}" pattern="#,##0"/>
                    </td>
                    <td class="col-action text-center">
                        <a href="${pageContext.request.contextPath}/service?id=${s.id}&keyword=${keyword}" class="link">
                            View Details
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty serviceList && not empty keyword}">
        <p class="no">No services found for "${keyword}"</p>
    </c:if>

    <p style="text-align:center;margin-top:40px;">
        <a href="${pageContext.request.contextPath}/Login/ifMainCustomer.jsp" style="color:#4a5568;font-weight:500;">
            Back to Home
        </a>
    </p>
</div>
</body>
</html>