<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoice #${invoice.id}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body{font-family:'Inter',sans-serif;background:#f8f9fc;padding:20px;margin:0}
        .container{max-width:1000px;margin:40px auto;background:#fff;padding:40px;border-radius:16px;box-shadow:0 8px 32px rgba(0,0,0,.1)}

        h1{text-align:center;color:#1a202c;font-size:2.3rem;margin:20px 0 16px;font-weight:700;line-height:1.3}
        h2{text-align:center;color:#718096;font-size:1.8rem;font-weight:600;margin:0 0 32px}

        .grid{display:grid;grid-template-columns:1fr 1fr;gap:20px;margin:20px 0}
        .item{background:#f0fff4;padding:16px;border-radius:12px;font-size:15px}
        .item strong{color:#065f46}

        .section-title{font-size:1.5rem;font-weight:600;color:#1a202c;margin:30px 0 8px;text-align:left}

        table{width:100%;border-collapse:collapse;font-size:15px;table-layout:fixed;margin:0}
        th{background:#e2e8f0;padding:12px;text-align:left;color:#2d3748;font-weight:600}
        td{padding:10px 12px;border-bottom:1px solid #e2e8f0}

        .text-right{text-align:right}
        .text-center{text-align:center}
        .col-name{width:50%}
        .col-qty{width:20%}
        .col-total{width:30%}

        .total{
            font-size:2rem;font-weight:700;text-align:center;padding:25px;
            background:#ecfdf5;border-radius:12px;color:#065f46;margin:30px 0
        }

        .back{text-align:center;margin-top:40px}
        .back a{color:#4a5568;font-weight:600;text-decoration:none;font-size:16px}
        .back a:hover{text-decoration:underline}

        @media print{
            body{background:#fff;padding:10px}
            .back{display:none}
        }
    </style>
</head>
<body>
<div class="container">
    <!-- HEADER -->
    <h1>Customer Revenue Statistics</h1>
    <h2>Invoice History</h2>

    <!-- GRID THÔNG TIN -->
    <div class="grid">
        <div class="item"><strong>Invoice ID:</strong> #${invoice.id}</div>
        <div class="item"><strong>Customer:</strong> ${invoice.customerName}</div>
        <div class="item"><strong>Staff:</strong> ${invoice.staffName}</div>
        <div class="item"><strong>Vehicle:</strong> ${invoice.licensePlate}</div>
        <div class="item"><strong>Payment Method:</strong> ${invoice.type}</div>
        <div class="item">
            <strong>Date:</strong>
            <fmt:parseDate value="${invoice.time}" pattern="yyyy-MM-dd'T'HH:mm" var="invDate" type="both"/>
            <fmt:formatDate value="${invDate}" pattern="dd/MM/yyyy HH:mm"/>
        </div>
    </div>

    <!-- BẢNG DỊCH VỤ -->
    <c:if test="${not empty invoice.services}">
        <h2 class="section-title">Services</h2>
        <table>
            <thead>
                <tr>
                    <th class="col-name">Name</th>
                    <th class="col-qty text-center">Quantity</th>
                    <th class="col-total text-right">Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${invoice.services}">
                    <tr>
                        <td class="col-name">${s.name}</td>
                        <td class="col-qty text-center">${s.quantity}</td>
                        <td class="col-total text-right"><fmt:formatNumber value="${s.total}" pattern="#,##0"/> VND</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- BẢNG PHỤ TÙNG -->
    <c:if test="${not empty invoice.spareparts}">
        <h2 class="section-title">Spare Parts</h2>
        <table>
            <thead>
                <tr>
                    <th class="col-name">Name</th>
                    <th class="col-qty text-center">Quantity</th>
                    <th class="col-total text-right">Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${invoice.spareparts}">
                    <tr>
                        <td class="col-name">${p.name}</td>
                        <td class="col-qty text-center">${p.quantity}</td>
                        <td class="col-total text-right"><fmt:formatNumber value="${p.total}" pattern="#,##0"/> VND</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- TỔNG TIỀN -->
    <div class="total">
        TOTAL: <fmt:formatNumber value="${invoice.totalamount}" pattern="#,##0"/> VND
    </div>

    <!-- NÚT QUAY LẠI -->
    <div class="back">
        <a href="javascript:history.back()">Back to List</a> |
        <a href="${pageContext.request.contextPath}/Login/ifMainManagementStaff.jsp">Home</a>
    </div>
</div>
</body>
</html>