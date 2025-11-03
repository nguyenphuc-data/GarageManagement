<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chi tiết hóa đơn</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .detail-box { border: 1px solid #ddd; padding: 20px; border-radius: 8px; max-width: 800px; }
        .label { font-weight: bold; }
        .section { margin-bottom: 15px; }
        .back-link { margin-top: 20px; display: inline-block; }
        table { width: 100%; border-collapse: collapse; margin-top: 10px; }
        th, td { border: 1px solid #ccc; padding: 5px; text-align: left; }
        th { background-color: #f2f2f2; }
    </style>
</head>
<body>
    <h2>Chi tiết hóa đơn</h2>
    <c:if test="${not empty invoice}">
        <div class="detail-box">
            <div class="section">
                <h3>Thông tin hóa đơn</h3>
                <p><span class="label">Mã hóa đơn:</span> ${invoice.id}</p>
                <p><span class="label">Thời gian:</span> ${invoice.time}</p>
                <p><span class="label">Tổng tiền:</span> ${invoice.totalAmount} VNĐ</p>
                <p><span class="label">Trạng thái:</span> ${invoice.status}</p>
            </div>
            <div class="section">
                <h3>Thông tin khách hàng</h3>
                <p><span class="label">Mã khách hàng:</span> ${invoice.customerId}</p>
                <p><span class="label">Tên khách hàng:</span> ${invoice.customerName}</p>
            </div>
            <div class="section">
                <h3>Thông tin xe</h3>
                <p><span class="label">Mã xe:</span> ${invoice.vehicleId}</p>
                <p><span class="label">Biển số:</span> ${invoice.vehicleLicensePlate}</p>
                <p><span class="label">Mô tả:</span> ${invoice.vehicleDescription}</p>
            </div>
            <div class="section">
                <h3>Thông tin nhân viên</h3>
                <p><span class="label">Mã nhân viên:</span> ${invoice.staffId}</p>
                <p><span class="label">Tên nhân viên:</span> ${invoice.staffName}</p>
            </div>
            <div class="section">
                <h3>Dịch vụ</h3>
                <table>
                    <tr><th>Mã dịch vụ</th><th>Tên dịch vụ</th><th>Số lượng</th><th>Thành tiền</th><th>Nhân viên kỹ thuật</th></tr>
                    <c:forEach var="service" items="${invoice.serviceDetails}">
                        <tr>
                            <td>${service.id}</td>
                            <td>${service.name}</td>
                            <td>${service.quantity}</td>
                            <td>${service.totalAmount} VNĐ</td>
                            <td>${service.technicalStaffId}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="section">
                <h3>Linh kiện</h3>
                <table>
                    <tr><th>Mã linh kiện</th><th>Tên linh kiện</th><th>Số lượng</th><th>Thành tiền</th></tr>
                    <c:forEach var="sparePart" items="${invoice.sparePartDetails}">
                        <tr>
                            <td>${sparePart.id}</td>
                            <td>${sparePart.name}</td>
                            <td>${sparePart.quantity}</td>
                            <td>${sparePart.totalAmount} VNĐ</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
    </c:if>
    <c:if test="${empty invoice}">
        <p style="color: red;">Không tìm thấy thông tin hóa đơn.</p>
    </c:if>
    <div class="back-link">
        <a href="${pageContext.request.contextPath}/StaffViewStatistics/ifViewCustomerInvoices.jsp?idCustomer=${param.idCustomer}&startDate=${param.startDate}&endDate=${param.endDate}">Quay lại</a>
    </div>
</body>
</html>