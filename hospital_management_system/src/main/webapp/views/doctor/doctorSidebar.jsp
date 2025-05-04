<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        <a href="doctorDashboard.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Dashboard</span>
            </div>
        </a>

        <div class="nav-item" id="patientListItem">
            <div class="nav-header">
                <i class="fas fa-user-injured nav-icon"></i>
                <span class="nav-text">Patient List</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="${pageContext.request.contextPath}/DoctorOPDServlet" class="submenu-item">OPD</a>
                <a href="${pageContext.request.contextPath}/views/doctor/doctorClinicDepartments.jsp" class="submenu-item">Clinic</a>
            </div>
        </div>

        <a href="${pageContext.request.contextPath}/DoctorAttendanceServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-calendar-check nav-icon"></i>
                <span class="nav-text">Attendance</span>
            </div>
        </a>

        <div class="nav-item" id="customizeItem">
            <div class="nav-header">
                <i class="fas fa-cog nav-icon"></i>
                <span class="nav-text">Customize</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="${pageContext.request.contextPath}/DoctorAddPrescriptionServlet" class="submenu-item">Add Prescription</a>
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
        <a href="${pageContext.request.contextPath}/CommonLogoutServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div>
