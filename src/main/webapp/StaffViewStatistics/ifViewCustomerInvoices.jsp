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
        body { font-family: 'Inter', sans-serif; background: #f8f9fc; padding: 20px; margin: 0; }
        .container { max-width: 1000px; margin: 40px auto; background: white; padding: 40px; border-radius: 16px; box-shadow: 0 8px 32px rgba(0,0,0,.1); }
        h1 { text-align: center; color: #1a202c; font-size: 28px; margin-bottom: 10px; }
        .subtitle { text-align: center; color: #4a5568; font-size: 18px; margin: 0 0 30px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th { background: #e2e8f0; padding: 16px; text-align: left; color: #2d3748; font-weight: 600; }
        td { padding: 14px; border-bottom: 1px solid #e2e8f0; }
        .link { color: #4a5568; text-decoration: none; font-weight: 600; }
        .link:hover { text-decoration: underline; color: #2d3748; }
        .back { text-align: center; margin-top: 40px; }
        .back a { color: #4a5568; font-weight: 600; text-decoration: none; font-size: 16px; }
        .back a:hover { text-decoration: underline; }
        @media print {
            body { background: white; padding: 10px; }
            .back { display: none; }
        }
    </style>
</head>
<body>
<div class="container">

    <!-- TIÊU ĐỀ TO GIỮA -->
    <h1>INVOICE HISTORY</h1>
    <p class="subtitle">
        <strong>Customer:</strong> ${customerName}<br>
        <strong>Period:</strong>
        <fmt:parseDate value="${start}" pattern="yyyy-MM-dd" var="s" type="date"/>
        <fmt:formatDate value="${s}" pattern="dd/MM/yyyy"/>
        →
        <fmt:parseDate value="${end}" pattern="yyyy-MM-dd" var="e" type="date"/>
        <fmt:formatDate value="${e}" pattern="dd/MM/yyyy"/>
    </p>

    <c:if test="${not empty invoices}">
        <table>
            <tr>
                <th>ID</th>
                <th>Date</th>
                <th>Total Amount</th>
                <th>Type</th>
                <th>Action</th>
            </tr>
            <c:forEach var="inv" items="${invoices}">
                <tr>
                    <td><strong>${inv.id}</strong></td>
                    <td>
                        <fmt:parseDate value="${inv.time}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDate" type="both"/>
                        <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy"/>
                    </td>
                    <td><fmt:formatNumber value="${inv.totalamount}" pattern="#,##0"/> VND</td>
                    <td>${inv.type}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/paymentinvoice?action=viewDetail&invoiceId=${inv.id}" class="link">
                            View →
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>

    <c:if test="${empty invoices}">
        <p style="text-align:center; color:#718096; font-size:18px; margin-top:50px;">
            No invoices found for this period.
        </p>
    </c:if>

    <div class="back">
        <a href="javascript:history.back()">← Back to Statistics</a>
    </div>
</div>
</body>
</html>