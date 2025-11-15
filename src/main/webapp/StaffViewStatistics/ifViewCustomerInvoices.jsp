<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice List</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body{font-family:'Inter',sans-serif;background:#f8f9fc;padding:20px;margin:0}
        .container{max-width:1000px;margin:40px auto;background:white;padding:40px;border-radius:16px;box-shadow:0 8px 32px rgba(0,0,0,.1)}
        h1{text-align:center;color:#1a202c;font-size:2.3rem;margin:20px 0 16px;font-weight:700;line-height:1.3}
        h2{text-align:center;color:#718096;font-size:1.8rem;font-weight:600;margin:0 0 32px}
        table{width:100%;border-collapse:collapse;margin-top:20px}
        th{background:#e2e8f0;padding:16px;text-align:left;color:#2d3748;font-weight:600}
        td{padding:14px;border-bottom:1px solid #e2e8f0}
        .link{color:#718096;font-weight:500;font-size:0.9rem;text-decoration:none}
        .link:hover{color:#4a5568;text-decoration:underline}
        .back{text-align:center;margin-top:40px}
        .back a{color:#4a5568;font-weight:600;text-decoration:none;font-size:16px}
        .back a:hover{text-decoration:underline}

        .text-right {
            text-align: right;
        }
        .text-center {
            text-align: center;
        }

        .col-id { width: 10%; }
        .col-date { width: 15%; }
        .col-amount { width: 20%; }

        .col-type {
            width: 35%;
            padding-left: 100px; /* Tăng đệm bên trái để tạo khoảng cách */
        }
        .col-action { width: 20%; }


        @media print{body{background:white;padding:10px}.back{display:none}}

        .info-left {
            text-align: left;
            color: #4a5568;
            font-size: 18px;
            margin: 32px 0 30px;
            line-height: 1.8;
        }
        .info-left strong {
            color: #2d3748;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Customer Revenue Statistics</h1>
    <h2>Invoice History</h2>

    <div class="info-left">
        <strong>Customer:</strong> ${customerName}<br>
        <strong>Revenue:</strong> <fmt:formatNumber value="${revenue}" pattern="#,##0"/> VND<br>
        <strong>Period:</strong>
        <fmt:parseDate value="${start}" pattern="yyyy-MM-dd" var="s" type="date"/>
        <fmt:formatDate value="${s}" pattern="dd/MM/yyyy"/>
        to
        <fmt:parseDate value="${end}" pattern="yyyy-MM-dd" var="e" type="date"/>
        <fmt:formatDate value="${e}" pattern="dd/MM/yyyy"/>
    </div>

    <c:if test="${not empty invoices}">
        <table>
            <tr>
                <th class="col-id">ID</th>
                <th class="col-date">Date</th>
                <th class="col-amount text-right">Total Amount (VND)</th>
                <th class="col-type">Type</th>
                <th class="col-action text-center">Action</th>
            </tr>
            <c:forEach var="inv" items="${invoices}">
                <tr>
                    <td class="col-id"><strong>${inv.id}</strong></td>
                    <td class="col-date">
                        <fmt:parseDate value="${inv.time}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both"/>
                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/>
                    </td>
                    <td class="col-amount text-right">
                        <fmt:formatNumber value="${inv.totalamount}" pattern="#,##0"/>
                    </td>
                    <td class="col-type">${inv.type}</td>
                    <td class="col-action text-center">
                        <a href="${pageContext.request.contextPath}/paymentinvoice?action=viewDetail&invoiceId=${inv.id}" class="link">
                            View
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty invoices}">
        <p style="text-align:center;color:#718096;font-size:18px;margin-top:50px;">
            No invoices found for this period.
        </p>
    </c:if>

    <div class="back">
        <a href="javascript:history.back()">Back to Statistics</a>
    </div>
</div>
</body>
</html>