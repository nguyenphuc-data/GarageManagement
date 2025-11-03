<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Thống kê doanh thu khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .form-group { margin-bottom: 15px; }
        label { font-weight: bold; }
        input[type="date"] { padding: 5px; }
        input[type="submit"] { padding: 8px 15px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .detail-link { color: blue; text-decoration: underline; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Thống kê doanh thu khách hàng</h2>
    <form action="${pageContext.request.contextPath}/CustomerStatController" method="get">
        <div class="form-group">
            <label for="startDate">Ngày bắt đầu:</label>
            <input type="date" id="startDate" name="startDate" required>
        </div>
        <div class="form-group">
            <label for="endDate">Ngày kết thúc:</label>
            <input type="date" id="endDate" name="endDate" required>
        </div>
        <input type="submit" value="Xem thống kê">
    </form>

    <c:if test="${not empty customerStats}">
        <h3>Kết quả thống kê từ ${param.startDate} đến ${param.endDate}</h3>
        <table>
            <tr><th>Mã khách hàng</th><th>Tên khách hàng</th><th>Doanh thu</th><th>Chi tiết</th></tr>
            <c:forEach var="stat" items="${customerStats}">
                <tr>
                    <td>${stat.idCustomer}</td>
                    <td>${stat.name}</td>
                    <td>${stat.revenue} VNĐ</td>
                    <td><a href="${pageContext.request.contextPath}/PaymentInvoiceController?idCustomer=${stat.idCustomer}&startDate=${param.startDate}&endDate=${param.endDate}" class="detail-link">Xem hóa đơn</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <br>
    <a href="${pageContext.request.contextPath}/StaffViewStatistics/ifSelectStatistics.jsp">Quay lại</a>
</body>
</html>