<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Doctor Dashboard</title>
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorcustomize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">

</head>
<body>
    <div class="sidebar-wrapper">
        <jsp:include page="doctorSidebar.jsp" />
    </div>

    <div class="main-content">
        <h1>Doctor Dashboard</h1>

        <div class="dashboard-container">
            <a href="${pageContext.request.contextPath}/ReceptionMedicalRecordSearchServlet?role_id=1" class="card">
                <i class="fas fa-search"></i>
                Search Patient Records
            </a>

            <a href="${pageContext.request.contextPath}/DoctorAddPrescriptionServlet" class="card">
                <i class="fas fa-prescription-bottle-alt"></i>
                Add Prescriptions
            </a>
        </div>

    </div>
</body>
</html>
