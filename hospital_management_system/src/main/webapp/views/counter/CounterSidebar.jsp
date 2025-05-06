<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String loggedInUser = (String) session.getAttribute("username");
    if (loggedInUser == null || loggedInUser.isEmpty()) {
        loggedInUser = "Guest Pharmacist";
    }
%>

<div class="sidebar">
    <div class="sidebar-header">
        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvEpPOPynNPtQDYaGvnSv2fiQsB8vY06ltRQ&s" 
             class="profile-pic" 
             alt="Pharmacist Avatar" />
        <div class="username"><%= loggedInUser %></div>
        <div class="role">Pharmacy Counter</div>
    </div>
    
    <div class="nav">
        <a href="${pageContext.request.contextPath}/views/counter/medicalDashboard.jsp" 
           class="nav-item ${pageContext.request.servletPath.endsWith('medicalDashboard.jsp') ? 'active' : ''}">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Dashboard</span>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/views/counter/CounterMedicinerecordsearch.jsp" 
           class="nav-item ${pageContext.request.servletPath.endsWith('CounterMedicinerecordsearch.jsp') ? 'active' : ''}">
            <div class="nav-header">
                <i class="fas fa-capsules nav-icon"></i>
                <span class="nav-text">Medicine Availability</span>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/views/counter/CounterAddMedicine.jsp" 
           class="nav-item ${pageContext.request.servletPath.endsWith('CounterAddMedicine.jsp') ? 'active' : ''}">
            <div class="nav-header">
                <i class="fas fa-plus-circle nav-icon"></i>
                <span class="nav-text">Add Medicine</span>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/views/counter/CounterAssignMedicine.jsp" 
           class="nav-item ${pageContext.request.servletPath.endsWith('CounterAssignMedicine.jsp') ? 'active' : ''}">
            <div class="nav-header">
                <i class="fas fa-server nav-icon"></i>
                <span class="nav-text">Assign Medicine</span>
            </div>
        </a>

        <a href="${pageContext.request.contextPath}/views/counter/CounterAttendance.jsp" 
           class="nav-item ${pageContext.request.servletPath.endsWith('CounterAttendance.jsp') ? 'active' : ''}">
            <div class="nav-header">
                <i class="fas fa-book-medical nav-icon"></i>
                <span class="nav-text">Pharmacy Attendance</span>
            </div>
        </a>
    </div>

    <div class="logout">
        <a href="${pageContext.request.contextPath}/views/counter/CounterLogout.jsp" 
           class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div> 