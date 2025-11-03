<!-- src/main/webapp/SearchService/ifDetailService.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Chi tiết dịch vụ</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 30px; }
        .detail-box { border: 1px solid #ddd; padding: 20px; border-radius: 8px; max-width: 600px; }
        .label { font-weight: bold; }
        .back-link { margin-top: 20px; display: inline-block; }
    </style>
</head>
<body>
    <h2>Chi tiết dịch vụ</h2>
    <c:choose>
        <c:when test="${not empty service}">
            <div class="detail-box">
                <p><span class="label">Mã dịch vụ:</span> ${service.id}</p>
                <p><span class="label">Tên dịch vụ:</span> ${service.name}</p>
                <p><span class="label">Giá:</span> ${service.price} VNĐ</p>
                <p><span class="label">Mô tả:</span> ${service.desc}</p>
            </div>
        </c:when>
        <c:otherwise>
            <p style="color: red;">Không tìm thấy thông tin dịch vụ.</p>
        </c:otherwise>
    </c:choose>
    <div class="back-link">
        <a href="${pageContext.request.contextPath}/SearchService/ifSearchService.jsp">Quay lại tìm kiếm</a>
        <span> | </span>
        <a href="${pageContext.request.contextPath}/Login/ifCustomerHome.jsp">Trang chủ</a>
    </div>
</body>
</html>