<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    background-color: #e6f0f2;
    font-family: sans-serif;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    margin: 0;
}

.login-container {
    background-color: #ffffff;
    border: 2px solid #a8afaf;
    border-radius: 10px;
    padding: 20px;
    width: 300px;
    text-align: center;
}

.login-container h2 {
    color: #1e3d59;
    margin-bottom: 20px;
}

.login-container label {
    display: block;
    margin-bottom: 5px;
    color: #1e3d59;
}

.login-container input {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #a8afaf;
    border-radius: 5px;
}

.login-container button {
    background-color: #1e3d59;
    color: #ffffff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.login-container button:hover {
    background-color: #a8afaf;
}
</style>
    <meta charset="UTF-8">
    <title>Login</title>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <% if (request.getParameter("error") != null) { %>
            <p style="color: red;">Invalid username or password.</p>
        <% } %>
        <form action="login" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>