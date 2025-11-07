<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Main Management Staff Interface</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        :root {
            --primary: #4a5568;
            --primary-dark: #2d3748;
            --secondary: #718096;
            --light: #f8f9fc;
            --border: #e2e8f0;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            --radius: 16px;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: linear-gradient(135deg, #f8f9fc 0%, #e2e8f0 100%);
            color: #2d3748;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            max-width: 480px;
            width: 100%;
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            overflow: hidden;
            border: 1px solid var(--border);
        }

        .header {
            background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
            color: white;
            padding: 32px 24px;
            text-align: center;
        }

        .header h1 {
            font-size: 1.8rem;
            font-weight: 700;
            margin-bottom: 8px;
        }

        .header p {
            font-size: 1rem;
            opacity: 0.9;
            font-weight: 500;
        }

        .menu {
            padding: 32px 24px;
        }

        .menu-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 16px 20px;
            background: var(--light);
            border: 1px solid var(--border);
            border-radius: 12px;
            transition: all 0.3s ease;
            text-decoration: none;
            color: var(--primary);
            font-weight: 600;
            font-size: 1.05rem;
        }

        .menu-item:hover {
            background: white;
            border-color: var(--primary);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(74, 85, 104, 0.12);
        }

        .menu-item i {
            font-size: 1.4rem;
            margin-right: 14px;
            color: var(--primary);
            width: 28px;
            text-align: center;
        }

        .menu-item span {
            flex: 1;
            text-align: left;
        }

        .logout {
            display: block;
            margin-top: 32px;
            text-align: center;
            color: #e53e3e;
            text-decoration: none;
            font-weight: 600;
            font-size: 0.95rem;
            padding: 12px;
            border-radius: 10px;
            transition: all 0.2s;
        }

        .logout:hover {
            background: #fff5f5;
            color: #c53030;
        }

        .logout i {
            margin-right: 8px;
        }

        @media (max-width: 480px) {
            .container { margin: 10px; }
            .header h1 { font-size: 1.6rem; }
            .menu-item { padding: 14px 16px; font-size: 1rem; }
        }
    </style>
</head>
<body>
<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>Welcome, Management Staff!</h1>
        <p>Manage reports and statistics</p>
    </div>

    <!-- Menu -->
    <div class="menu">
        <ul class="menu-list">
            <li>
                <a href="${pageContext.request.contextPath}/StaffViewStatistics/ifSelectStatistics.jsp" class="menu-item">
                    <i class="fas fa-chart-bar"></i>
                    <span>View Statistical Report</span>
                    <i class="fas fa-chevron-right" style="margin-left: auto; opacity: 0.5; font-size: 0.9rem;"></i>
                </a>
            </li>
        </ul>

        <!-- Logout -->
        <a href="${pageContext.request.contextPath}/logout" class="logout">
            <i class="fas fa-sign-out-alt"></i>
            Log out
        </a>
    </div>
</div>
</body>
</html>
