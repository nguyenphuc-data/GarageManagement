<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customer Revenue Statistics</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --p: #4a5568;
            --pd: #2d3748;
            --l: #f8f9fc;
            --b: #e2e8f0;
            --g: #48bb78;
        }
        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #f8f9fc 0%, #e2e8f0 100%);
            margin:0;
            padding:20px;
        }
        .container {
            max-width: 1100px;
            margin: 40px auto;
            background: white;
            padding: 32px;
            border-radius: 16px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.1);
        }
        h1 {
            text-align:center;
            color:#1a202c;
            margin-bottom:8px;
        }
        .form-box {
            text-align:center;
            background:#f0fff4;
            padding:24px;
            border-radius:12px;
            margin-bottom:32px;
        }
        input[type=date] {
            padding:10px;
            margin:0 8px;
            border:1.5px solid var(--b);
            border-radius:8px;
            font-size:1rem;
        }
        button {
            padding:12px 28px;
            background:var(--p);
            color:white;
            border:none;
            border-radius:8px;
            font-weight:600;
            cursor:pointer;
        }
        button:hover {
            background:var(--pd);
        }
        table {
            width:100%;
            border-collapse:collapse;
            margin-top: 20px;
            font-size:0.95rem;
        }
        th {
            background:#e2e8f0;
            padding:14px;
            text-align:left;
            color:var(--p);
            font-weight:600;
        }
        td {
            padding:12px 14px;
            border-bottom:1px solid var(--b);
        }
        .link {
            color:var(--p);
            font-weight:600;
            text-decoration:none;
        }
        .link:hover {
            text-decoration:underline;
        }
        .summary {
            text-align:right;
            font-weight:700;
            color:var(--g);
            margin-top:16px;
            font-size:1rem;
        }
        .back-btn {
            display:inline-block;
            background:var(--l);
            border:1px solid var(--b);
            color:var(--p);
            font-weight:600;
            text-decoration:none;
            padding:10px 20px;
            border-radius:8px;
            margin-top:30px;
            transition:all 0.3s ease;
        }
        .back-btn:hover {
            background:var(--p);
            color:white;
        }
        .bottom {
            text-align:center;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Customer Revenue Statistics</h1>

    <!-- FORM -->
    <div class="form-box">
        <form action="${pageContext.request.contextPath}/customerstat" method="post">
            <label><strong>From:</strong></label>
            <input type="date" name="startDate" value="${startDate}" required>
            <label><strong>To:</strong></label>
            <input type="date" name="endDate" value="${endDate}" required>
            <button type="submit">Generate Report</button>
        </form>
    </div>

    <!-- RESULT TABLE -->
    <c:if test="${not empty stats}">
        <table>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Revenue (VND)</th>
                <th>Invoices</th>
                <th>Action</th>
            </tr>
            <c:set var="totalRevenue" value="0"/>
            <c:forEach var="s" items="${stats}">
                <tr>
                    <td><strong>${s.customerId}</strong></td>
                    <td>${s.customerName}</td>
                    <td><fmt:formatNumber value="${s.revenue}" type="number"/> VND</td>
                    <td>${s.numberOfInvoices}</td>
                    <td>
                        <!-- ĐÃ SỬA: 1 DÒNG LIÊN TỤC – KHÔNG XUỐNG DÒNG -->
                        <a href="${pageContext.request.contextPath}/paymentinvoice?action=viewInvoices&customerId=${s.customerId}&customerName=${s.customerName}&start=${startDate}&end=${endDate}" class="link">
                            View Invoices →
                        </a>
                    </td>
                </tr>
                <c:set var="totalRevenue" value="${totalRevenue + s.revenue}" />
            </c:forEach>
        </table>

        <!-- TOTAL REVENUE -->
        <div class="summary">
            Total Revenue: <fmt:formatNumber value="${totalRevenue}" type="number"/> VND
        </div>
    </c:if>

    <!-- BACK BUTTON -->
    <div class="bottom">
        <a href="javascript:history.back()" class="back-btn">← Back</a>
    </div>
</div>
</body>
</html>