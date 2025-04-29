
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Receptionist Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="receptiondashboard.css" />
</head>
<body>

<div class="sidebar">
    <div class="sidebar-header">        
        <img src="https://cdn-icons-png.flaticon.com/512/236/236832.png" alt="Receptionist" style="width: 80px; height: 80px; border-radius: 50%; margin: 0 auto 1rem; object-fit: cover; border: 3px solid #93c5fd;">


        <div class="username">Guest Receptionist</div>
        <div class="role">Reception</div>
    </div>

    <div class="nav">
        <a href="ReceptionDashboard.jsp" class="nav-item active">
            <div class="nav-header">
                <i class="fas fa-home nav-icon"></i>
                <span class="nav-text">Dashboard</span>
            </div>
        </a>
        <a href="opdCustomize.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-hospital nav-icon"></i>
                <span class="nav-text">OPD</span>
            </div>
        </a>
        <a href="clinicView.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-clinic-medical nav-icon"></i>
                <span class="nav-text">Clinic</span>
            </div>
        </a>
        <a href="medicalHistory.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-notes-medical nav-icon"></i>
                <span class="nav-text">Medical History</span>
            </div>
        </a>
        <a href="viewPatients.jsp" class="nav-item">
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
        <a href="receptionLogin.jsp" class="nav-item">
            <div class="nav-header">
                <i class="fas fa-sign-in-alt nav-icon"></i>
                <span class="nav-text">Reception Login</span>
            </div>
        </a>
        
        <a href="logout.jsp" class="nav-item logout">
            <div class="nav-header">
                <i class="fas fa-sign-out-alt nav-icon"></i>
                <span class="nav-text">Logout</span>
            </div>
        </a>
    </div>
</div>

<div class="content">
    <div class="header">
        <div class="page-title">Receptionist Dashboard</div>
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
            <a href="receptionClinic.html" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-calendar-check"></i></div>
                <div class="card-title">Clinic</div>
                <div class="card-desc">Check today's clinic appointments.</div>
                <span class="card-btn">View</span>
            </a>
            <a href="medicalHistory.jsp" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-file-medical-alt"></i></div>
                <div class="card-title">Medical History</div>
                <div class="card-desc">View patient treatment records.</div>
                <span class="card-btn">History</span>
            </a>
            <a href="viewPatients.jsp" class="dashboard-card">
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
            <a href="receptionLogin.jsp" class="dashboard-card">
                <div class="card-icon"><i class="fas fa-user-plus"></i></div>
                <div class="card-title">Reception Login</div>
                <div class="card-desc">Register new patients easily.</div>
                <span class="card-btn">Go</span>
                
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
