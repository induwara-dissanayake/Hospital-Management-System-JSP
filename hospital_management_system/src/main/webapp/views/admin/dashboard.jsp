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
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    padding: 20px;
    max-width: 1000px;
    margin: auto;
}

.card {
    background-color: #ffffff;
    border: 2px solid #a8afaf;
    border-radius: 10px;
    padding: 20px;
    text-align: center;
}

.card a {
    text-decoration: none;
    color: #1e3d59;
}


.card h2 {
    margin: 0;
    font-size: 24px;
    font-weight: bold;
}

.card:hover {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    cursor: pointer;
}
</style>
    <meta charset="UTF-8">
    <title> Dashboard </title>
</head>
<body>
    <header>
        <div class="header-content">
            <h1>Admin Panel</h1>
            <div class="user-info">
                Welcome <%= session.getAttribute("user") %> | <a href="login.jsp">Logout</a>
            </div>
        </div>
    </header>
    <div class="container">
        <div class="card"><a href="doctorSection.jsp"><h2>Doctor</h2></a></div>
        <div class="card"><a href="patientSection.jsp"><h2>Patient</h2></a></div>
        <div class="card"><a href="receptionSection.jsp"><h2>Reception</h2></a></div>
        <div class="card"><a href="pharmacySection.jsp"><h2>Pharmacy Counter</h2></a></div>
        <div class="card"><a href="userList.jsp"><h2>User</h2></a></div>
    </div>
</body>
</html>