<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser == null || loggedInUser.isEmpty()) {
        loggedInUser = "Guest Admin";
    }
%>
 
<div class="sidebar">
    <div class="sidebar-header">
        <img src="https://cdn-icons-png.flaticon.com/512/4567/4567890.png" alt="Admin Profile" class="profile-pic">
        <div class="username"><%= loggedInUser %></div>
        <div class="role">Admin</div>
    </div>

    <div class="nav">
        <a href="adminDashboard.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Admin Panel</span>
            </div>
        </a>
        
        <a href="patient.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-user-injured nav-icon"></i>
                <span class="nav-text">Patient</span>
            </div>
        </a>
        
        <a href="doctor.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-calendar-check nav-icon"></i>
                <span class="nav-text">Doctor</span>
            </div>
        </a>

        <div class="nav-item" id="userItem">
            <div class="nav-header">
                <i class="fas fa-users nav-icon"></i>
                <span class="nav-text">User</span>
                <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
            </div>
            <div class="submenu">
                <a href="userRegistration.jsp" class="submenu-item">User Registration</a>
                <a href="userLogin.jsp" class="submenu-item">User Login</a>
                <a href="userUpdate.jsp" class="submenu-item">User Update</a>
            </div>
        </div>

        <a href="admin.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-user-shield nav-icon"></i>
                <span class="nav-text">Admin</span>
            </div>
        </a>
    </div>

    <div class="logout">
        <a href="${pageContext.request.contextPath}/AdminLogoutServlet" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div>
 