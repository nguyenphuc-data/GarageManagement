<!-- src/main/webapp/SearchService/ifSearchService.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tìm kiếm dịch vụ</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .search-box { margin-bottom: 20px; }
        input[type="text"] { padding: 8px; width: 300px; }
        input[type="submit"] { padding: 8px 15px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .detail-link { color: blue; text-decoration: underline; cursor: pointer; }
    </style>
</head>
<body>
    <h2>Tìm kiếm dịch vụ</h2>
    <div class="search-box">
        <form action="${pageContext.request.contextPath}/searchService" method="get">
            <input type="text" name="keyword" placeholder="Nhập tên dịch vụ..."
                   value="${param.keyword != null ? param.keyword : ''}" required>
            <input type="submit" value="Tìm kiếm">
        </form>
    </div>
    <c:if test="${not empty serviceList}">
        <h3>Kết quả tìm kiếm cho: "${param.keyword}"</h3>
        <table>
            <tr><th>Mã dịch vụ</th><th>Tên dịch vụ</th><th>Giá</th><th>Mô tả</th><th>Xem chi tiết</th></tr>
            <c:forEach var="service" items="${serviceList}">
                <tr>
                    <td>${service.id}</td>
                    <td>${service.name}</td>
                    <td>${service.price} VNĐ</td>
                    <td>${service.desc}</td>
                    <td><a href="${pageContext.request.contextPath}/searchService?id=${service.id}" class="detail-link">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty serviceList && param.keyword != null}">
        <p>Không tìm thấy dịch vụ nào phù hợp với từ khóa: "${param.keyword}"</p>
    </c:if>
    <br>
    <a href="${pageContext.request.contextPath}/Login/ifCustomerHome.jsp">Quay lại trang chủ khách hàng</a>
</body>
</html>