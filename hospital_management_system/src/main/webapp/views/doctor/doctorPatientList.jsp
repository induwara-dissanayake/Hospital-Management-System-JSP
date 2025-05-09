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
    <title>Patient List</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorDashboard.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorpatientkist.css">
</head>
<body>

  <div class="sidebar-wrapper">
        <jsp:include page="doctorSidebar.jsp" />
    </div>

   <div class="cards-container">
    <!-- OPD Card -->
    <a href="${pageContext.request.contextPath}/DoctorOPDServlet" style="text-decoration: none;">
        <div class="card">
            <div class="card-icon">
                <i class="fas fa-procedures"></i>
            </div>
            <h3>OPD</h3><br>
            <h4>OPD Patient Orders</h4>
        </div>
    </a>

    <!-- Clinic Card -->
    <a  href="doctorClinicDepartments.jsp" style="text-decoration: none;">
        <div class="card">
            <div class="card-icon">
                <i class="fas fa-clinic-medical"></i>
            </div>
            <h3>Clinic</h3><br>
            <h4>Clinic Departments</h4>
        </div>
    </a>
</div>
</body>
</html>
