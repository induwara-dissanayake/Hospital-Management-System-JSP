<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
   
    if (session == null || session.getAttribute("doctor_id") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/dashboard.css">
</head>
<body>
    <h1>Welcome, Dr. <%= session.getAttribute("username") %></h1>
    <p style="text-align:center;">Your Doctor ID: <%= session.getAttribute("doctor_id") %></p>

    <div class="dashboard-container">
        <a href="doctorPatientList.jsp" class="card">Patient List</a>
        <a href="attendance.jsp" class="card">Attendance</a>
        <a href="appointment.jsp" class="card">Appointment</a>
        <a href="notification.jsp" class="card">Notification</a>
        <a href="logout.jsp" class="card">Logout</a>
    </div>
</body>
</html>
