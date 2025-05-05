<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="refresh" content="5;URL=${pageContext.request.contextPath}/views/reception/receptionClinic.jsp" />
    <title>Registration Successful</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/logout.css">
</head>
<body>
    <div class="container">
        <h1>✅ Registration Successful!</h1>
        <p>Your patient registration has been successfully completed.</p>
        <p>Redirecting you back to the registration page...</p>
        <a href="<c:url value='/views/reception/receptionClinic.jsp' />">Click here if you are not redirected.</a>
    </div>
</body>
</html>
