<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Danh sách hóa đơn khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .customer-info { border: 1px solid #ddd; padding: 10px; margin-bottom: 20px; background-color: #f9f9f9; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .detail-link { color: blue; text-decoration: underline; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Danh sách hóa đơn của khách hàng</h2>
    <c:if test="${not empty param.idCustomer}">
        <div class="customer-info">
            <p><strong>Mã khách hàng:</strong> ${param.idCustomer}</p>
            <p><strong>Tên khách hàng:</strong> ${customerName}</p>
            <p><strong>Tổng doanh thu:</strong> ${totalRevenue} VNĐ</p>
            <p><strong>Thời gian:</strong> Từ ${param.startDate} đến ${param.endDate}</p>
        </div>
    </c:if>
    <c:if test="${not empty invoices}">
        <table>
            <tr><th>Mã hóa đơn</th><th>Thời gian</th><th>Tổng tiền</th><th>Chi tiết</th></tr>
            <c:forEach var="invoice" items="${invoices}">
                <tr>
                    <td>${invoice.id}</td>
                    <td>${invoice.time}</td>
                    <td>${invoice.totalAmount} VNĐ</td>
                    <td><a href="${pageContext.request.contextPath}/PaymentInvoiceController?id=${invoice.id}&idCustomer=${param.idCustomer}&startDate=${param.startDate}&endDate=${param.endDate}" class="detail-link">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty invoices}">
        <p>Không có hóa đơn nào trong khoảng thời gian này.</p>
    </c:if>
    <br>
    <a href="${pageContext.request.contextPath}/StaffViewStatistics/ifViewCustomerStatistics.jsp?startDate=${param.startDate}&endDate=${param.endDate}">Quay lại</a>
</body>
</html>