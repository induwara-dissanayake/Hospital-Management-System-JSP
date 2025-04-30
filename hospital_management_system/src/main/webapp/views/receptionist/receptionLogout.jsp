<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Logged Out</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/logout.css">
</head>
<body>
    <h1>You have been logged out!</h1>
    <p>Thank you for using the Reception Dashboard.</p>
    <a href="receptionLogin.jsp">Go to Login Page</a>
</body>
</html>
