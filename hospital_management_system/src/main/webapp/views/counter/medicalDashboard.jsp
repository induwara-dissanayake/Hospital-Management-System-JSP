<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <!DOCTYPE html>
 <html lang="en">
 <head>
     
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Pharmacy Counter Dashboard</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/CounterDashboard.css">
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/CounterSidebar.css">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
     
 </head>


 <body>
 <!-- sidebar -->
<div class="sidebar">
    <div class="sidebar-header">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvEpPOPynNPtQDYaGvnSv2fiQsB8vY06ltRQ&s" class="profile-pic" alt="Pharmacist Avatar" />

        <div class="username">Pharmacy</div>
        <div class="role">Pharmacy Counter</div>
    </div>
    
    <div class="nav">
        <a href="CounterDashboard.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Dashboard</span>
            </div>
        </a>

        <a href="CounterMedicinerecordsearch.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-capsules nav-icon"></i>
                <span class="nav-text">Medicine Availability</span>
            </div>
        </a>

        <a href="CounterAddMedicine.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-plus-circle nav-icon"></i>
                <span class="nav-text">Add Medicine</span>
            </div>
        </a>

        <a href="CounterAssignMedicine.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-server nav-icon"></i>
                <span class="nav-text">Assign Medicine</span>
            </div>
        </a>

        <a href="CounterAttendance.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-book-medical nav-icon"></i>
                <span class="nav-text">Pharmacy Attendance</span>
            </div>
        </a>

        <a href="CounterLogout.jsp" class="nav-item logout">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div><!-- Main Content -->
 <div class="content">
     <div class="header">
         <h1 class="page-title">Pharmacy Counter Dashboard</h1>
         <div class="date-display" id="currentDate"></div>
     </div>
 
     <div class="dashboard-container">
         <div class="dashboard-grid">
 <!-- Customize Card -->
             <a href="CounterMedicinerecordsearch.jsp" class="dashboard-card">
                 <div class="card-icon">
                     <i class="fas fa-capsules"></i>
                 </div>
                 <h3 class="card-title">Medicine Availability</h3>
                 <p class="card-desc">Track current medicine stock</p>
                 <span class="card-btn">Check Stock</span>
             </a> 
             <a href="CounterAddMedicine.jsp" class="dashboard-card">
                 <div class="card-icon">
                     <i class="fas fa-plus-circle"></i>
                 </div>
                 <h3 class="card-title">Add Medicine</h3>
                 <p class="card-desc">Browse available medicine items</p>
                 <span class="card-btn">Manage Medicine</span>
             </a> 
             <a href="CounterAssignMedicine.jsp" class="dashboard-card">
                 <div class="card-icon">
                     <i class="fas fa-server"></i>
                 </div>
                 <h3 class="card-title">Assign Medicine</h3>
                 <p class="card-desc">Assign medicine to patients</p>
                 <span class="card-btn">Assign Now</span>
             </a> 
 
             <a href="CounterAttendance.jsp" class="dashboard-card">
                 <div class="card-icon">
                     <i class="fas fa-book-medical"></i>
                 </div>
                 <h3 class="card-title">Pharmacy Attendance</h3>
                 <p class="card-desc">View staff attendance records</p>
                 <span class="card-btn">Check Attendance</span>
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