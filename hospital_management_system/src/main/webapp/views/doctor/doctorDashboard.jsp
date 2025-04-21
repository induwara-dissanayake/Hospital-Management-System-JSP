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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>
    <h1>Welcome, Dr. <%= session.getAttribute("username") %></h1>
    <p style="text-align:center;">Your Doctor ID: <%= session.getAttribute("doctor_id") %></p>

    <div class="dashboard-container">
        <a href="doctorPatientList.jsp" class="card">Patient List</a>
        <a href="${pageContext.request.contextPath}/DoctorAttendanceServlet" class="card">Attendance</a>
        <a href="appointment.jsp" class="card">Customize</a>
        <a href="notification.jsp" class="card">Notification</a>
        <a href="${pageContext.request.contextPath}/DoctorLogoutServlet" class="card">Logout</a>
    </div>
</body>
</html>
