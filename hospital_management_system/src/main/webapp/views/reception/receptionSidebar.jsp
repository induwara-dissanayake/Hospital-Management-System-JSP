<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser == null || loggedInUser.isEmpty()) {
        loggedInUser = "Guest Receptionist";
    }
%>

<div class="sidebar">
    <div class="sidebar-header">
        <img src="https://cdn-icons-png.flaticon.com/512/236/236832.png" alt="Receptionist Profile" class="profile-pic">
        <div class="username"><%= loggedInUser %></div>
        <div class="role">Reception</div>
    </div>

    <div class="nav">
        <a href="receptionDashboard.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Dashboard</span>
            </div>
        </a>

        <div class="nav-item">
            <div class="nav-header">
                <div class="nav-icon"><i class="fas fa-hospital"></i></div>
                <div class="nav-text">Patient Registation</div>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="receptionOPD.jsp" class="submenu-item">OPD</a>
                <a href="receptionClinic.jsp" class="submenu-item">Clinic</a>
            </div>
        </div>

        <a href="receptionMedicalHistory.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-notes-medical nav-icon"></i>
                <span class="nav-text">Medical History</span>
            </div>
        </a>


        <a href="${pageContext.request.contextPath}/ReceptionPatientSearchServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-users nav-icon"></i>
                <span class="nav-text">View Patients</span>
            </div>
        </a>

        <a href="receptionAttendance.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-calendar-alt nav-icon"></i>
                <span class="nav-text">Reception Attendance</span>
            </div>
        </a>
    </div>

    <div class="logout">
        <a href="${pageContext.request.contextPath}/ReceptionLogoutServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div>
