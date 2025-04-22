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
    <title>Customize</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>
    <h1 style="text-align:center;">Customize Tables</h1>

    <div class="dashboard-container">
		<a href="${pageContext.request.contextPath}/DoctorAddPrescriptionServlet" class="card">Add Prescriptions</a>
        <a href="${pageContext.request.contextPath}/DoctorSearchPatientServlet" class="card">Search Patient Records</a>
    </div>
</body>
</html>
