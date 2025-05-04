<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("receptionLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receptionist Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptiondashboard.css">
</head>
<body>

<jsp:include page="receptionSidebar.jsp" />

<!-- Main Content -->
<div class="content">
    <div class="header">
        <h1 class="page-title">Receptionist Dashboard</h1>
        <div class="date-display" id="currentDate"></div>
    </div>

    <div class="dashboard-container">
        <div class="dashboard-grid">
          
            <a href="receptionOPD.jsp" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-hospital-user"></i></div>
                <div class="card-title">OPD</div>
                <div class="card-desc">Manage Outpatient Department patients.</div>
                <span class="card-btn">Open</span>
            </a>
            <a href="receptionClinic.jsp" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-calendar-check"></i></div>
                <div class="card-title">Clinic</div>
                <div class="card-desc">Check today's clinic appointments.</div>
                <span class="card-btn">View</span>
            </a>
            <a href="${pageContext.request.contextPath}/ReceptionMedicalRecordSearchServlet?role_id=2" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-file-medical-alt"></i></div>
                <div class="card-title">Medical History</div>
                <div class="card-desc">View patient treatment records.</div>
                <span class="card-btn">History</span>
            </a>
            <a href="${pageContext.request.contextPath}/ReceptionPatientSearchServlet" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-users"></i></div>
                <div class="card-title">View Patients</div>
                <div class="card-desc">Browse and search patient records.</div>
                <span class="card-btn">View</span>
            </a>
            <a href="receptionAttendance.jsp" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-user-check"></i></div>
                <div class="card-title">Reception Attendance</div>
                <div class="card-desc">Mark and view receptionist attendance.</div>
                <span class="card-btn">Attendance</span>
            </a>
           
        </div>
    </div>
</div>

<script>
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-US', options);
</script>

</body>
</html>