<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Clinic Departments</title>
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorclinicdepartment.css">
     <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
   
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar-wrapper">
        <jsp:include page="doctorSidebar.jsp" />
    </div>

    <!-- Main content -->
    <div class="main-content">
        <div class="header">
            <h1>Clinic Departments</h1>
        </div>

        <div class="departments-grid">
            <!-- Eye Clinic -->
             <div class="department-box" onclick="location.href='${pageContext.request.contextPath}/DoctorClinicServlet?clinic_id=1'">
                <div class="department-icon"><i class="fas fa-eye"></i></div>
                   <p class="department-name">Eye Clinic</p>
             </div>


            <!-- Cardiology Clinic -->
            <div class="department-box" onclick="location.href='${pageContext.request.contextPath}/DoctorClinicServlet?clinic_id=2'">
                <div class="department-icon"><i class="fas fa-heartbeat"></i></div>
                <p class="department-name">Cardiology Clinic</p>
            </div>

            <!-- Gynecology Clinic -->
            <div class="department-box" onclick="location.href='${pageContext.request.contextPath}/DoctorClinicServlet?clinic_id=3'">
                <div class="department-icon"><i class="fas fa-female"></i></div>
                <p class="department-name">Gynecology Clinic</p>
            </div>

            <!-- Neurology Clinic -->
            <div class="department-box" onclick="location.href='${pageContext.request.contextPath}/DoctorClinicServlet?clinic_id=4'">
                <div class="department-icon"><i class="fas fa-brain"></i></div>
                <p class="department-name">Neurology Clinic</p>
            </div>

            <!-- Pediatric Clinic -->
            <div class="department-box" onclick="location.href='${pageContext.request.contextPath}/DoctorClinicServlet?clinic_id=5'">
                <div class="department-icon"><i class="fas fa-baby"></i></div>
                <p class="department-name">Pediatric Clinic</p>
            </div>
        </div>
    </div>

</body>
</html>

