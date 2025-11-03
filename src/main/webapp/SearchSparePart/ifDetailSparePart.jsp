<!-- src/main/webapp/SearchSparePart/ifDetailSparePart.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chi tiết linh kiện</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .detail-box { border: 1px solid #ddd; padding: 20px; border-radius: 8px; max-width: 600px; }
        .label { font-weight: bold; }
        .stock { color: green; font-weight: bold; }
        .outstock { color: red; font-weight: bold; }
        .back-link { margin-top: 20px; display: inline-block; }
    </style>
</head>
<body>
    <h2>Chi tiết linh kiện</h2>
    <c:choose>
        <c:when test="${not empty sparePart}">
            <div class="detail-box">
                <p><span class="label">Mã linh kiện:</span> ${sparePart.id}</p>
                <p><span class="label">Tên linh kiện:</span> ${sparePart.name}</p>
                <p><span class="label">Giá:</span> ${sparePart.price} VNĐ</p>
                <p><span class="label">Số lượng tồn:</span> <c:choose><c:when test="${sparePart.quantity > 0}"><span class="stock">${sparePart.quantity}</span></c:when><c:otherwise><span class="outstock">Hết hàng</span></c:otherwise></c:choose></p>
                <p><span class="label">Mô tả:</span> ${sparePart.desc}</p>
            </div>
        </c:when>
        <c:otherwise>
            <p style="color: red;">Không tìm thấy thông tin linh kiện.</p>
        </c:otherwise>
    </c:choose>
    <div class="back-link">
        <a href="${pageContext.request.contextPath}/SearchSparePart/ifSearchSparePart.jsp">Quay lại tìm kiếm</a>
        <span> | </span>
        <a href="${pageContext.request.contextPath}/Login/ifCustomerHome.jsp">Trang chủ</a>
    </div>
</body>
</html>