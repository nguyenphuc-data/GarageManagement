<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chính - Nhân viên quản lý</title>
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
    <h2>Chào mừng, <%= session.getAttribute("username") != null ? session.getAttribute("username") : "Nhân viên quản lý" %>!</h2>
    <p>Chọn chức năng bạn muốn sử dụng:</p>
    <ul>
        <li><a href="${pageContext.request.contextPath}/StaffViewStatistics/ifSelectStatistics.jsp">Xem báo cáo thống kê</a></li>
        <!-- Thêm các chức năng khác nếu cần, ví dụ: quản lý dịch vụ, linh kiện -->
    </ul>
    <br>
    <a href="${pageContext.request.contextPath}/logout">Đăng xuất</a>
</body>
</html>