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
    max-width: 1000px;
    margin: auto;
}

.add-button {
    display: inline-block;
    background-color: #1e3d59;
    color: #ffffff;
    padding: 10px 20px;
    text-decoration: none;
    border-radius: 5px;
    margin-bottom: 20px;
}

.add-button:hover {
    background-color: #a8afaf;
}

table {
    width: 100%;
    border-collapse: collapse;
}

table th, table td {
    padding: 10px;
    border: 1px solid #a8afaf;
    text-align: left;
}

table th {
    background-color: #1e3d59;
    color: #ffffff;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table a {
    color: #1e3d59;
    text-decoration: none;
}

table a:hover {
    text-decoration: underline;
}
</style>
    <meta charset="UTF-8">
    <title>User List</title>
    <link rel="stylesheet" type="text/css" href="css/userList.css">
</head>
<body>
    <header>
        <div class="header-content">
            <h1>User List</h1>
            <div class="user-info">
                Welcome, <%= session.getAttribute("user") %> | <a href="dashboard.jsp">Logout</a>
            </div>
        </div>
    </header>
    <div class="container">
        <a href="userForm.jsp" class="add-button">Add New User</a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dummy data; replace with dynamic data in production -->
                <tr>
                    <td>1</td>
                    <td>admin</td>
                    <td>Admin</td>
                    <td><a href="userForm.jsp?id=1">Edit</a> | <a href="deleteUser?id=1">Delete</a></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>staff</td>
                    <td>Staff</td>
                    <td><a href="userForm.jsp?id=2">Edit</a> | <a href="deleteUser?id=2">Delete</a></td>
                </tr>
            </tbody>
        </table>
    </div>
</body>
</html>
                    