<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="3;URL=adminDashboard.jsp" />
    <title>Registration Successful</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding-top: 100px;
        }
        .message {
            font-size: 20px;
            color: green;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            <p>Registration successful!</p>
            <p>Redirecting to the admin dashboard...</p>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/javascript/admin.js"></script>
</body>
</html>
