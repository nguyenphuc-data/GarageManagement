<!-- src/main/webapp/Login/ifCustomerHome.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ khách hàng</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; text-align: center; }
        h2 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 15px 0; }
        a { text-decoration: none; color: #007BFF; font-size: 18px; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h2>Chào mừng khách hàng!</h2>
    <p>Chọn chức năng bạn muốn sử dụng:</p>
    <ul>
        <li><a href="${pageContext.request.contextPath}/SearchService/ifSearchService.jsp">Tìm kiếm thông tin dịch vụ</a></li>
        <li><a href="${pageContext.request.contextPath}/SearchSparePart/ifSearchSparePart.jsp">Tìm kiếm thông tin linh kiện</a></li>
    </ul>
    <br>
    <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a> <!-- Giả định có servlet logout -->
</body>
</html>