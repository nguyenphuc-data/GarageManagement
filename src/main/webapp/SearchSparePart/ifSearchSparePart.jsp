<!-- src/main/webapp/SearchSparePart/ifSearchSparePart.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Tìm kiếm linh kiện</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        .search-box { margin-bottom: 20px; }
        input[type="text"] { padding: 8px; width: 300px; }
        input[type="submit"] { padding: 8px 15px; }
        table { width: 100%; border-collapse: collapse; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: left; }
        th { background-color: #f2f2f2; }
        .detail-link { color: blue; text-decoration: underline; cursor: pointer; }
        .stock { color: green; font-weight: bold; }
        .outstock { color: red; font-weight: bold; }
    </style>
</head>
<body>
    <h2>Tìm kiếm linh kiện</h2>
    <div class="search-box">
        <form action="${pageContext.request.contextPath}/searchSparePart" method="get">
            <input type="text" name="keyword" placeholder="Nhập tên linh kiện..."
                   value="${param.keyword != null ? param.keyword : ''}" required>
            <input type="submit" value="Tìm kiếm">
        </form>
    </div>
    <c:if test="${not empty sparePartList}">
        <h3>Kết quả tìm kiếm cho: "${param.keyword}"</h3>
        <table>
            <tr><th>Mã linh kiện</th><th>Tên linh kiện</th><th>Giá</th><th>Số lượng tồn</th><th>Mô tả</th><th>Xem chi tiết</th></tr>
            <c:forEach var="part" items="${sparePartList}">
                <tr>
                    <td>${part.id}</td>
                    <td>${part.name}</td>
                    <td>${part.price} VNĐ</td>
                    <td><c:choose><c:when test="${part.quantity > 0}"><span class="stock">${part.quantity}</span></c:when><c:otherwise><span class="outstock">Hết hàng</span></c:otherwise></c:choose></td>
                    <td>${part.desc}</td>
                    <td><a href="${pageContext.request.contextPath}/searchSparePart?id=${part.id}" class="detail-link">Xem chi tiết</a></td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
    <c:if test="${empty sparePartList && param.keyword != null}">
        <p>Không tìm thấy linh kiện nào phù hợp với từ khóa: "${param.keyword}"</p>
    </c:if>
    <br>
    <a href="${pageContext.request.contextPath}/Login/ifCustomerHome.jsp">Quay lại trang chủ khách hàng</a>
</body>
</html>