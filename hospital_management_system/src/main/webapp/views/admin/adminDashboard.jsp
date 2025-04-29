<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dashboard.css">
</head>
<body>

<jsp:include page="adminSidebar.jsp" />



<!-- Main Content -->
<div class="content">
    <div class="header">
        <h1 class="page-title">Admin Panel</h1>
        <div class="date-display" id="currentDate"></div>
    </div>
    
    <div class="dashboard-container">
        <div class="dashboard-grid">
            <!-- Patient Card -->
            <a href="patient.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-injured"></i>
                </div>
                <h3 class="card-title">Patient</h3>
                <p class="card-desc">Patient List</p>
                <span class="card-btn">View Details</span>
            </a>
    
            <!-- Doctor Card -->
            <a href="doctor.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-calendar-check"></i>
                </div>
                <h3 class="card-title">Doctor</h3>
                <p class="card-desc">Doctor Appointments</p>
                <span class="card-btn">View Details</span>
            </a>
            
            <!-- Reception Card -->
            <a href="reception.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-concierge-bell"></i>
                </div>
                <h3 class="card-title">Reception</h3>
                <p class="card-desc">Reception Desk</p>
                <span class="card-btn">View Details</span>
            </a>
            
            <!-- Pharmacy Card -->
            <a href="pharmacy.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-prescription-bottle"></i>
                </div>
                <h3 class="card-title">Pharmacy</h3>
                <p class="card-desc">Pharmacy Counter</p>
                <span class="card-btn">View Details</span>
            </a>
            
            <!-- User Registration Card -->
            <a href="userRegistration.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-plus"></i>
                </div>
                <h3 class="card-title">User Registration</h3>
                <p class="card-desc">Registration Form</p>
                <span class="card-btn">View Form</span>
            </a>
            
            <!-- User Login Card -->
            <a href="userLogin.jsp" class="dashboard-card">
               <div class="card-icon">
                    <i class="fas fa-sign-in-alt"></i>
                </div>
                <h3 class="card-title">User Login</h3>
                <p class="card-desc">Login Form</p>
                <span class="card-btn">View Form</span>
            </a>
            
            <!-- User Update Card -->
            <a href="userUpdate.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-edit"></i>
                </div>
                <h3 class="card-title">User Update</h3>
                <p class="card-desc">User List</p>
                <span class="card-btn">View Details</span>
            </a>
            
            <!-- Admin Card -->
            <a href="admin.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-shield"></i>
                </div>
                <h3 class="card-title">Admin</h3>
                <p class="card-desc">Admin Control</p>
                <span class="card-btn">View Details</span>
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
                        
    