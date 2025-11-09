<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Statistics</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        :root{--primary:#4a5568;--primary-dark:#2d3748;--light:#f8f9fc;--border:#e2e8f0}
        body{font-family:'Inter',sans-serif;background:linear-gradient(135deg,#f8f9fc 0%,#e2e8f0 100%);padding:40px;margin:0;display:flex;align-items:center;justify-content:center;min-height:100vh}
        .card{max-width:500px;width:100%;background:white;padding:40px 30px;border-radius:16px;box-shadow:0 10px 30px rgba(0,0,0,0.08);text-align:center;border:1px solid var(--border)}
        .card h1{font-size:1.8rem;color:var(--primary-dark);margin-bottom:24px;font-weight:700}
        .btn-block{display:block;padding:16px;background:var(--primary);color:white;text-decoration:none;border-radius:12px;font-weight:600;margin:15px 0;transition:all .3s ease;cursor:pointer}
        .btn-block:hover{background:var(--primary-dark);transform:translateY(-2px);box-shadow:0 6px 18px rgba(74,85,104,0.15)}
        .back-btn{display:inline-block;margin-top:10px;font-size:.95rem;color:var(--primary);text-decoration:none;font-weight:600;padding:10px 14px;border-radius:8px;border:1px solid var(--border);transition:all .3s ease}
        .back-btn:hover{background:var(--light);border-color:var(--primary);color:var(--primary-dark)}
    </style>
</head>
<body>
<div class="card">
    <h1>Select Statistics</h1>

    <!-- THAY <a href> BẰNG FORM ẨN + JS -->
    <form id="customerStatForm"
          action="${pageContext.request.contextPath}/customerstat?action=showForm"
          method="post"
          style="display:none;">
    </form>

    <div class="btn-block"
         onclick="document.getElementById('customerStatForm').submit();">
        Customer Revenue Statistics
    </div>

    <div class="btn-block"
          onclick="document.getElementById('customerStatForm').submit();">
         Supplier Statistics
    </div>

    <!-- NÚT BACK VẪN DÙNG href (VÌ KHÔNG QUA CONTROLLER) -->
    <a href="${pageContext.request.contextPath}/Login/ifMainManagementStaff.jsp" class="back-btn">
        Back to Main Interface
    </a>
</div>
</body>
</html>