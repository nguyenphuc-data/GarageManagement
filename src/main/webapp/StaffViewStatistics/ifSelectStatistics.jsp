<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Chọn loại thống kê</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h2 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin: 15px 0; }
        a { text-decoration: none; color: #007BFF; font-size: 18px; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h2>Chọn loại thống kê</h2>
    <ul>
        <li><a href="${pageContext.request.contextPath}/StaffViewStatistics/ifViewCustomerStatistics.jsp">Thống kê doanh thu khách hàng</a></li>
    </ul>
    <br>
    <a href="${pageContext.request.contextPath}/Login/ifMainManagementStaff.jsp">Quay lại</a>
</body>
</html>