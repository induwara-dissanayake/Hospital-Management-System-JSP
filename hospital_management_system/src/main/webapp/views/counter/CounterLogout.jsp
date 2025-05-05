<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    // Invalidate the user session (logout the user)
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logged Out</title>
    <style>
        body {
            background-color: #eaf3f4;
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        h1 {
            color: #2e2e2e;
        }
        p {
            margin-top: 8px;
            color: #555555;
        }
        a {
            margin-top: 30px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #4fa0a6;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
        }
        a:hover {
            background-color: #4fa0a6;
        }
    </style>
</head>
<body>
    <h1>You have been logged out!</h1>
    <p>Thank you for using the Pharmacy Counter Dashboard.</p>
    <a href="counterLogin.jsp">Go to Login Page</a>
</body>
</html>