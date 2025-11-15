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
        :root{--p:#4a5568;--pd:#2d3748;--l:#f8f9fc;--b:#e2e8f0;--g:#48bb78}
        body{font-family:'Inter',sans-serif;background:linear-gradient(135deg,#f8f9fc 0%,#e2e8f0 100%);margin:0;padding:20px}
        .container{max-width:1100px;margin:40px auto;background:white;padding:32px;border-radius:16px;box-shadow:0 8px 32px rgba(0,0,0,0.1)}
        h1{text-align:center;color:#1a202c;margin-bottom:8px}
        .form-box{text-align:center;background:#f0fff4;padding:24px;border-radius:12px;margin-bottom:32px}
        input[type=date]{padding:10px;margin:0 8px;border:1.5px solid var(--b);border-radius:8px;font-size:1rem}
        button{padding:12px 28px;background:var(--p);color:white;border:none;border-radius:8px;font-weight:600;cursor:pointer}
        button:hover{background:var(--pd)}
        table{width:100%;border-collapse:collapse;margin-top:20px;font-size:0.95rem}
        th{background:#e2e8f0;padding:14px;text-align:left;color:var(--p);font-weight:600}
        td{padding:12px 14px;border-bottom:1px solid var(--b)}
        .link{color:#718096;font-weight:500;font-size:0.9rem;text-decoration:none}
        .link:hover{color:#4a5568;text-decoration:underline}

        .back{text-align:center;margin-top:40px}
        .back a{color:var(--p);font-weight:600;text-decoration:none;font-size:16px}
        .back a:hover{text-decoration:underline}

        .period{text-align:center;color:#718096;margin:10px 0 20px;font-size:1rem}

        .total-center {
            text-align: center;
            font-weight: 700;
            color: var(--g);
            font-size: 1.1rem;
            margin-top: 20px;
            padding: 16px;
            background: #f0fff4;
            border-radius: 12px;
            border: 2px solid var(--g);
            box-shadow: 0 4px 12px rgba(72, 187, 120, 0.1);
        }

        .text-right {
            text-align: right;
        }
        .text-center {
            text-align: center;
        }

        .col-id { width: 15%; }
        .col-name { width: 15%; }     /* Tăng từ 30% */
        .col-invoices { width: 10%; } /* Giảm từ 15% */
        .col-revenue { width: 20%; }
        .col-action { width: 20%; }

    </style>
</head>
<body>
<div class="container">
    <h1>Customer Revenue Statistics</h1>

    <c:if test="${not empty startDate}">
        <p class="period">
            <strong>Period:</strong>
            <fmt:parseDate value="${startDate}" pattern="yyyy-MM-dd" var="s"/>
            <fmt:formatDate value="${s}" pattern="dd/MM/yyyy"/> to
            <fmt:parseDate value="${endDate}" pattern="yyyy-MM-dd" var="e"/>
            <fmt:formatDate value="${e}" pattern="dd/MM/yyyy"/>
        </p>
    </c:if>

    <div class="form-box">
        <form action="${pageContext.request.contextPath}/customerstat" method="post">
            <label><strong>From:</strong></label>
            <input type="date" name="startDate" value="${startDate}" required>
            <label><strong>To:</strong></label>
            <input type="date" name="endDate" value="${endDate}" required>
            <button type="submit">Generate Report</button>
        </form>
    </div>

    <c:if test="${not empty stats}">
        <table>
            <tr>
                <th class="col-id">Customer ID</th>
                <th class="col-name">Name</th>
                <th class="col-invoices text-right">Invoices</th>
                <th class="col-revenue text-right">Revenue (VND)</th>
                <th class="col-action text-center">Action</th>
            </tr>
            <c:set var="totalRevenue" value="${0}"/>
            <c:forEach var="s" items="${stats}">
                <tr>
                    <td class="col-id"><strong>${s.customerId}</strong></td>
                    <td class="col-name">${s.customerName}</td>
                    <td class="col-invoices text-right">${s.numberOfInvoices}</td>
                    <td class="col-revenue text-right"><fmt:formatNumber value="${s.revenue}" pattern="#,##0"/></td>
                    <td class="col-action text-center">
                        <a href="${pageContext.request.contextPath}/paymentinvoice?action=viewInvoices&customerId=${s.customerId}&customerName=${s.customerName}&revenue=${s.revenue}&start=${startDate}&end=${endDate}" class="link">
                            View Invoices
                        </a>
                    </td>
                </tr>
                <c:set var="totalRevenue" value="${totalRevenue + s.revenue}" />
            </c:forEach>
        </table>

        <div class="total-center">
            Total Revenue: <fmt:formatNumber value="${totalRevenue}" pattern="#,##0"/> VND
        </div>
    </c:if>

    <div class="back">
            <a href="${pageContext.request.contextPath}/StaffViewStatistics/ifSelectStatistics.jsp">Back</a>
    </div>
</div>
</body>
</html>