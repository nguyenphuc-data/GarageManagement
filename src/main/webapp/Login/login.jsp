<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: linear-gradient(135deg, #4facfe, #00f2fe);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0;
        }

        .login-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 50px;
            width: 380px;
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            color: #0078d7;
            font-size: 26px;
        }

        h2 {
            margin-bottom: 30px;
            color: #333;
            font-weight: normal;
        }

        input[type="text"], input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
            transition: 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #0078d7;
            outline: none;
            box-shadow: 0 0 5px #0078d7;
        }

        input[type="submit"] {
            background: #0078d7;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: 0.3s;
        }

        input[type="submit"]:hover {
            background: #005fa3;
        }

        .error {
            color: red;
            margin-top: 10px;
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <h1>Welcome to Garage Web</h1>
    <h2>Login to your account</h2>

    <form method="post" action="login">
        <input type="text" name="username" placeholder="Username" required/><br>
        <input type="password" name="password" placeholder="Password" required/><br>
        <input type="submit" value="Login"/>
    </form>

    <p class="error">${error}</p>
</div>
</body>
</html>
