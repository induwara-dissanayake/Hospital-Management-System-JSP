<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="refresh" content="3;URL=${pageContext.request.contextPath}/views/admin/adminDashboard.jsp" />
    <title>Registration Successful</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

    <style>
        :root {
            --primary: #3b82f6;
            --primary-dark: #1d4ed8;
            --bg-light: #f1f5f9;
            --card-bg: #ffffff;
            --text-dark: #1e293b;
            --radius: 12px;
            --shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--bg-light);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: var(--card-bg);
            padding: 40px;
            border-radius: var(--radius);
            box-shadow: var(--shadow);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .message {
            font-size: 1.2rem;
            color: var(--primary-dark);
        }

        .message i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 10px;
        }

        .message p {
            margin: 12px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="message">
            <i class="fas fa-check-circle"></i>
            <p><strong>Registration Successful!</strong></p>
            <p>Redirecting to the Admin Panel...</p>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/resources/javascript/admin.js"></script>
</body>
</html>
