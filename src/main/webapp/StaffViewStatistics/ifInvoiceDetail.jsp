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
        body {
            font-family: 'Inter', sans-serif;
            background: #f8f9fc;
            padding: 20px;
            margin: 0;
        }
        .box {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 40px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,.1);
        }

        /* TIÊU ĐỀ CHÍNH */
        .main-title {
            text-align: center;
            color: #1a202c;
            margin: 0 0 8px;
            font-size: 28px;
            font-weight: 700;
        }
        .invoice-id {
            text-align: center;
            color: #4a5568;
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 30px;
        }

        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin: 20px 0;
        }
        .item {
            background: #f0fff4;
            padding: 16px;
            border-radius: 12px;
            font-size: 15px;
        }
        .item strong {
            color: #065f46;
        }

        h2 {
            color: #1a202c;
            margin-top: 30px;
            font-size: 20px;
        }

        /* BẢNG DỊCH VỤ & PHỤ TÙNG */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            font-size: 15px;
        }
        th {
            background: #e2e8f0;
            padding: 12px;
            text-align: left;
            color: #2d3748;
            font-weight: 600;
        }
        td {
            padding: 10px 12px;
            border-bottom: 1px solid #e2e8f0;
        }

        .total {
            font-size: 2rem;
            font-weight: 700;
            text-align: center;
            padding: 25px;
            background: #ecfdf5;
            border-radius: 12px;
            color: #065f46;
            margin: 30px 0;
        }

        .btn {
            display: block;
            width: 200px;
            margin: 30px auto 20px;
            padding: 14px 32px;
            background: #4a5568;
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            text-align: center;
            text-decoration: none;
        }
        .btn:hover {
            background: #2d3748;
        }

        .back {
            text-align: center;
            margin-top: 20px;
        }
        .back a {
            color: #4a5568;
            font-weight: 600;
            text-decoration: none;
            font-size: 15px;
        }
        .back a:hover {
            text-decoration: underline;
        }

        .btn-back:hover {
            background: #4a5568;
        }

        @media print {
            body { background: white; padding: 0; }
            .btn, .back { display: none; }
        }
    </style>
</head>
<body>
<div class="box">
    <!-- TIÊU ĐỀ + ID -->
    <h1 class="main-title">INVOICE DETAIL</h1>
    <div class="invoice-id">Invoice #${invoice.id}</div>

    <!-- THÔNG TIN CHUNG -->
    <div class="grid">
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
        <h2>Services</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${invoice.services}">
                    <tr>
                        <td>${s.name}</td>
                        <td>${s.quantity}</td>
                        <td><fmt:formatNumber value="${s.total}" pattern="#,##0"/> VND</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- BẢNG PHỤ TÙNG -->
    <c:if test="${not empty invoice.spareparts}">
        <h2>Spare Parts</h2>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${invoice.spareparts}">
                    <tr>
                        <td>${p.name}</td>
                        <td>${p.quantity}</td>
                        <td><fmt:formatNumber value="${p.total}" pattern="#,##0"/> VND</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- TỔNG CỘNG -->
    <div class="total">
        TOTAL: <fmt:formatNumber value="${invoice.totalamount}" pattern="#,##0"/> VND
    </div>

    <!-- NÚT IN -->
    <div style="text-align:center;">
        <button class="btn" onclick="window.print()">Print Invoice</button>
    </div>

    <!-- NÚT BACK -->
    <div class="back">
        <a href="javascript:history.back()">Back to List</a> |
        <a href="${pageContext.request.contextPath}/Login/ifMainManagementStaff.jsp">Home</a>
    </div>
</div>
</body>
</html>