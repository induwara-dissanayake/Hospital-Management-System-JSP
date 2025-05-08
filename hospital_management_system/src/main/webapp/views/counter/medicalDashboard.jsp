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
    <!-- Include the sidebar component -->
    <jsp:include page="CounterSidebar.jsp" />

    <!-- Main Content -->
    <div class="content">
        <div class="header">
            <h1 class="page-title">Pharmacy Counter Dashboard</h1>
            <div class="date-display" id="currentDate"></div>
        </div>

        <div class="dashboard-container">
            <div class="dashboard-grid">
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

                <a href="${pageContext.request.contextPath}/CounterAssignMedicineServlet" class="dashboard-card">
                    <div class="card-icon">
                        <i class="fas fa-server"></i>
                    </div>
                    <h3 class="card-title">Assign Medicine</h3>
                    <p class="card-desc">Assign medicine to patients</p>
                    <span class="card-btn">Assign Now</span>
                </a>

                <a href="${pageContext.request.contextPath}/CounterAttendanceServlet" class="dashboard-card">
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
    </script>
</body>
</html>   