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
    <title>Patient List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorDashboard.css">
</head>
<body>
<jsp:include page="doctorSidebar.jsp" />

    <h1 style="text-align:center;">Patient List</h1>

    <div class="dashboard-container">
		<a href="${pageContext.request.contextPath}/DoctorOPDServlet" class="card">OPD</a>
        <a href="doctorClinicDepartments.jsp" class="card">Clinic</a>
    </div>
</body>
</html>
