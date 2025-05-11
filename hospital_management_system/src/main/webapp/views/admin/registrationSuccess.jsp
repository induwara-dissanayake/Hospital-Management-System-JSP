<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/views/admin/adminDashboard.jsp" />
    <title>Registration Successful</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            text-align: center;
            padding-top: 100px;
        }
        .message {
            font-size: 20px;
            color: #1d4ed8;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            <p>Registration Successful!</p>
            <p>Redirecting to the Admin Panel...</p>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/javascript/admin.js"></script>
</body>
</html>
