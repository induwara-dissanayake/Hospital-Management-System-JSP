<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminDashboard.css">
</head>
<body>

<jsp:include page="adminSidebar.jsp" />

<!-- Main Content -->
<div class="content">
    <div class="header">
        <h1 class="page-title">Admin Overview</h1>
        <div class="date-display" id="currentDate"></div>
    </div>
    
    <div class="dashboard-container">
        <div class="dashboard-grid">
            <!-- User Management Card -->
            <a href="userManagement.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-user-injured"></i>
                </div>
                <h3 class="card-title">User Management</h3>
                <p class="card-desc">Current List</p>
                <span class="card-btn">View Details</span>
            </a>
            
            <!-- Medicine Management Card -->
            <a href="medicineManagement.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-pills"></i>
                </div>
                <h3 class="card-title">Medicine Management</h3>
                <p class="card-desc">Manage Medicines</p>
                <span class="card-btn">View Details</span>
            </a>

            <!-- Reports Management Card -->
            <a href="reportsManagement.jsp" class="dashboard-card">
                <div class="card-icon">
                    <i class="fas fa-file-alt"></i>
                </div>
                <h3 class="card-title">Reports Management</h3>
                <p class="card-desc">Generate Reports</p>
                <span class="card-btn">View Reports</span>
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
