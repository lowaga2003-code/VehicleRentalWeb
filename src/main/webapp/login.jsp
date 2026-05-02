<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>System Login</title>
    <style>
        body { font-family: sans-serif; background: #2c3e50; display: flex; justify-content: center; align-items: center; height: 100vh; margin: 0; }
        .login-box { background: white; padding: 40px; border-radius: 8px; width: 300px; text-align: center; }
        input { width: 100%; padding: 10px; margin: 10px 0; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        button { width: 100%; padding: 10px; background: #3498db; color: white; border: none; border-radius: 4px; cursor: pointer; font-weight: bold; }
    </style>
</head>
<body>
    <div class="login-box">
        <h2>Vehicle Rental System</h2>
        <p style="color: gray; font-size: 14px;">Please login to continue</p>

        <form action="LoginServlet" method="post">
            <input type="text" name="username" placeholder="Username (type: admin)" required>
            <input type="password" name="password" placeholder="Password (type: 1234)" required>
            <button type="submit">Login</button>
        </form>

        <% if(request.getParameter("error") != null) { %>
            <p style="color: red; font-size: 12px;">Invalid credentials!</p>
        <% } %>
    </div>
</body>
</html>