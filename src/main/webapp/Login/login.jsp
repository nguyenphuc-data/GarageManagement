<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4a5568;
            --primary-dark: #2d3748;
            --secondary: #718096;
            --light: #f8f9fc;
            --border: #e2e8f0;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --radius: 16px;
            --bg-gradient: linear-gradient(135deg, #e2e8f0 0%, #f8f9fc 100%);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: var(--bg-gradient);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
            color: #2d3748;
        }

        .login-container {
            background: white;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            padding: 48px 40px;
            width: 100%;
            max-width: 420px;
            text-align: center;
            border: 1px solid var(--border);
        }

        .logo {
            width: 80px;
            height: 80px;
            margin: 0 auto 20px;
            background: var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 2rem;
            font-weight: 700;
        }

        h1 {
            margin-bottom: 8px;
            color: #1a202c;
            font-size: 1.75rem;
            font-weight: 700;
        }

        h2 {
            margin-bottom: 32px;
            color: var(--secondary);
            font-weight: 500;
            font-size: 1.1rem;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 14px 16px;
            margin: 12px 0;
            border: 1.5px solid var(--border);
            border-radius: 12px;
            font-size: 16px;
            transition: all 0.2s ease;
            background: #fdfdfe;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(74, 85, 104, 0.15);
            background: white;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: 600;
            margin-top: 16px;
            transition: background 0.2s ease;
        }

        input[type="submit"]:hover {
            background: var(--primary-dark);
        }

        .error {
            color: #e53e3e;
            margin-top: 16px;
            font-size: 0.95rem;
            font-weight: 500;
            background: #fff5f5;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #feb2b2;
        }

        .footer {
            margin-top: 32px;
            font-size: 0.875rem;
            color: var(--secondary);
        }

        @media (max-width: 480px) {
            .login-container { padding: 36px 24px; }
            h1 { font-size: 1.6rem; }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Logo -->
        <div class="logo">G</div>

        <h1>Hanoi Garage</h1>
        <h2>Login to your account</h2>

        <!-- FORM ĐÚNG: action="/login" -->
        <form method="post" action="${pageContext.request.contextPath}/login">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <input type="submit" value="Login">
        </form>

        <!-- Hiển thị lỗi -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <div class="footer">
            © 2025 Garage Management System
        </div>
    </div>
</body>
</html>