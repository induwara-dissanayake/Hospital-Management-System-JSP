<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 
  String loggedInUser = (String) session.getAttribute("username"); 
  if (loggedInUser == null || loggedInUser.isEmpty()) { 
    loggedInUser = "Guest Receptionist"; 
  }

  // Get the current page
  String currentPage = request.getRequestURI();
%>

<div class="sidebar">
  <div class="sidebar-header">
    <img src="https://cdn-icons-png.flaticon.com/512/236/236832.png" alt="Receptionist Profile" class="profile-pic"/>
    <div class="username"><%= loggedInUser %></div>
    <div class="role">Reception</div>
  </div>

  <div class="nav">
    <a href="${pageContext.request.contextPath}/views/reception/receptionDashboard.jsp" 
       class="nav-item <%= currentPage.contains("receptionDashboard.jsp") ? "active" : "" %>">
      <div class="nav-header">
        <i class="fas fa-home nav-icon"></i>
        <span class="nav-text">Dashboard</span>
      </div>
    </a>

    <div class="nav-item">
      <div class="nav-header">
        <div class="nav-icon"><i class="fas fa-hospital"></i></div>
        <div class="nav-text">Token Counter</div>
        <i class="fas fa-chevron-down" style="margin-left: auto; font-size: 0.8rem;"></i>
      </div>
      
      <div class="submenu">
        <a href="${pageContext.request.contextPath}/views/reception/receptionOPD.jsp" 
           class="submenu-item <%= currentPage.contains("receptionOPD.jsp") ? "active" : "" %>">
          OPD Patients
        </a>
        <a href="${pageContext.request.contextPath}/ReceptionListSearchServlet" 
           class="submenu-item <%= currentPage.contains("ReceptionListSearchServlet") ? "active" : "" %>">
          Clinic Patients
        </a>
      </div>
    </div>


<div class="nav-item">
  <div class="nav-header">
    <div class="nav-icon"><i class="fas fa-user-plus"></i></div> <!-- Changed icon -->
    <div class="nav-text">Patient Registration</div>
  </div>
</div>


    <a href="${pageContext.request.contextPath}/ReceptionMedicalRecordSearchServlet?role_id=2" 
       class="nav-item <%= currentPage.contains("ReceptionMedicalRecordSearchServlet") ? "active" : "" %>">
      <div class="nav-header">
        <i class="fas fa-notes-medical nav-icon"></i>
        <span class="nav-text">Medical History</span>
      </div>
    </a>

    <a href="${pageContext.request.contextPath}/ReceptionPatientSearchServlet" 
       class="nav-item <%= currentPage.contains("ReceptionPatientSearchServlet") ? "active" : "" %>">
      <div class="nav-header">
        <i class="fas fa-users nav-icon"></i>
        <span class="nav-text">View Patients</span>
      </div>
    </a>

    <a href="${pageContext.request.contextPath}/ReceptionAttendanceServlet" 
       class="nav-item <%= currentPage.contains("ReceptionAttendanceServlet") ? "active" : "" %>">
      <div class="nav-header">
        <i class="fas fa-calendar-alt nav-icon"></i>
        <span class="nav-text">Reception Attendance</span>
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
