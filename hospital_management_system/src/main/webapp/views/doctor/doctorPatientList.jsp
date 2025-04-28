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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>
<%
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser == null || loggedInUser.isEmpty()) {
        loggedInUser = "Guest Doctor";
    }
%>
<div class="sidebar">
    <div class="sidebar-header">
        <img src="https://cdn-icons-png.flaticon.com/512/3304/3304567.png" alt="Doctor Profile" class="profile-pic">
        <div class="username"><%= loggedInUser %></div>
        <div class="role">Doctor</div>
    </div>

    <div class="nav">
        <a href="home.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Dashboard</span>
            </div>
        </a>

        <!-- Patient List with Submenu -->
        <div class="nav-item" id="patientListItem">
            <div class="nav-header">
                <i class="fas fa-user-injured nav-icon"></i>
                <span class="nav-text">Patient List</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="opdPatients.jsp" class="submenu-item">OPD</a>
                <a href="clinicPatients.jsp" class="submenu-item">Clinic</a>
            </div>
        </div>

        <a href="${pageContext.request.contextPath}/DoctorAttendanceServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-calendar-check nav-icon"></i>
                <span class="nav-text">Attendance</span>
            </div>
        </a>

        <!-- Customize with Submenu -->
        <div class="nav-item" id="customizeItem">
            <div class="nav-header">
                <i class="fas fa-cog nav-icon"></i>
                <span class="nav-text">Customize</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="addPrescription.jsp" class="submenu-item">Add Prescription</a>
                <a href="searchPatientRecords.jsp" class="submenu-item">Search Patient Records</a>
            </div>
        </div>

        <a href="notification.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-bell nav-icon"></i>
                <span class="nav-text">Notifications</span>
                <span class="badge">3</span>
            </div>
        </a>
    </div>

    <div class="logout">
        <a href="${pageContext.request.contextPath}/DoctorLogoutServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div>

    <h1 style="text-align:center;">Patient List</h1>

    <div class="dashboard-container">
		<a href="${pageContext.request.contextPath}/DoctorOPDServlet" class="card">OPD</a>
        <a href="doctorClinicDepartments.jsp" class="card">Clinic</a>
    </div>
</body>
</html>
