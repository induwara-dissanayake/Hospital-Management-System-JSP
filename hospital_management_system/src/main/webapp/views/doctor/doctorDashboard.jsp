<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Doctor Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorDashboard.css">
</head>
<body>

<jsp:include page="doctorSidebar.jsp" />



<!-- Main Content -->
<div class="content">
    <div class="header">
        <h1 class="page-title">Doctor Dashboard</h1>
        <div class="date-display" id="currentDate"></div>
    </div>
    
    <div class="dashboard-container">
        <div class="dashboard-grid">
            <!-- Patient List Card -->
            <a href="doctorPatientList.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-injured"></i>
                </div>
                <h3 class="card-title">Patient List</h3>
                <p class="card-desc">View and manage all your patients</p>
                <span class="card-btn">View Patients</span>
            </a>
            
            <!-- Attendance Card -->
            <a href="${pageContext.request.contextPath}/DoctorAttendanceServlet" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <h3 class="card-title">Attendance</h3>
                <p class="card-desc">Track your daily appointments</p>
                <span class="card-btn">Check Schedule</span>
            </a>
            
            <!-- Customize Card -->
            <a href="doctorCustomize.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-cog"></i>
                </div>
                <h3 class="card-title">Customize</h3>
                <p class="card-desc">Personalize your dashboard</p>
                <span class="card-btn">Settings</span>
            </a>
            
            <!-- Notifications Card -->
            <a href="notification.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-bell"></i>
                </div>
                <h3 class="card-title">Notifications</h3>
                <p class="card-desc">You have 3 new notifications</p>
                <span class="card-btn">View Alerts</span>
            </a>
        </div>
    </div>
</div>

<script>
    // Display current date
    const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
    document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-US', options);
    
    // Add active class to clicked nav item
    document.querySelectorAll('.nav-item').forEach(item => {
        item.addEventListener('click', function(e) {
            // Don't close if clicking on submenu or chevron
            if (e.target.closest('.submenu') || e.target.classList.contains('fa-chevron-down')) {
                return;
            }
            
            document.querySelectorAll('.nav-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
        });
    });
    
    // Toggle submenus when clicking the chevron
    document.querySelectorAll('.fa-chevron-down').forEach(chevron => {
        chevron.addEventListener('click', function(e) {
            e.stopPropagation();
            const navItem = this.closest('.nav-item');
            navItem.classList.toggle('active');
        });
    });
</script>

</body>
</html>