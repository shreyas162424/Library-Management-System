<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Library System</title>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f0f2f5; display: flex; align-items: center; justify-content: center; height: 100vh; }
        .login-box { background: white; padding: 30px; border-radius: 12px; box-shadow: 0 10px 25px rgba(0,0,0,0.1); width: 350px; }
        .login-box h2 { text-align: center; margin-bottom: 20px; color: #2c3e50; }
        .form-group { margin-bottom: 15px; }
        input[type="text"], input[type="password"] {
            width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 8px;
        }
        button { width: 100%; padding: 10px; background: #3498db; color: white; border: none; border-radius: 8px; font-size: 16px; }
        button:hover { background: #2980b9; cursor: pointer; }
        .error { color: red; text-align: center; margin-top: 10px; }
    </style>
</head>
<body>
<div class="login-box">
    <h2>Library Login</h2>
    <form action="LoginServlet" method="post">
        <div class="form-group">
            <input type="text" name="username" placeholder="Username" required />
        </div>
        <div class="form-group">
            <input type="password" name="password" placeholder="Password" required />
        </div>
        <button type="submit">Login</button>
        <div class="error">${error}</div>
    </form>
</div>
</body>
</html>
