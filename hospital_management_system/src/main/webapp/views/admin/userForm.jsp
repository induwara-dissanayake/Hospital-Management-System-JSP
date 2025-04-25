<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
body {
    background-color: #e6f0f2;
    font-family: sans-serif;
    margin: 0;
    padding: 0;
}

header {
    background-color: #1e3d59;
    color: #ffffff;
    padding: 10px 20px;
}

.header-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.user-info {
    font-size: 14px;
}

.user-info a {
    color: #ffffff;
    text-decoration: none;
}

.user-info a:hover {
    text-decoration: underline;
}

.container {
    padding: 20px;
    max-width: 600px;
    margin: auto;
}

form {
    background-color: #ffffff;
    border: 2px solid #a8afaf;
    border-radius: 10px;
    padding: 20px;
}

form label {
    display: block;
    margin-bottom: 5px;
    color: #1e3d59;
}

form input, form select {
    width: 100%;
    padding: 8px;
    margin-bottom: 10px;
    border: 1px solid #a8afaf;
    border-radius: 5px;
}

form button {
    background-color: #1e3d59;
    color: #ffffff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

form button:hover {
    background-color: #a8afaf;
}
</style>
    <meta charset="UTF-8">
    <title>User Form</title>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>User Form</h1>
            <div class="user-info">
                Welcome, <%= session.getAttribute("user") %> <a href="dashboard.jsp">Logout</a>
            </div>
        </div>
    </header>
    <div class="container">
        <form action="saveUser" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="Admin">Admin</option>
                <option value="Staff">Staff</option>
            </select>
            <button type="submit">Save</button>
        </form>
    </div>
</body>
</html>