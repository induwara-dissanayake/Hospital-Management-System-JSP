<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Hospital Reports</title>

  <!-- Icons and CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">

  <style>
    :root {
      --primary: #3b82f6;
      --primary-light: #93c5fd;
      --primary-dark: #1d4ed8;
      --card-bg: #ffffff;
      --text-dark: #1e293b;
      --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
      --radius: 12px;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f1f5f9;
      color: var(--text-dark);
      min-height: 100vh;
    }

    /* MAIN CONTENT OFFSET FOR SIDEBAR */
    .main-content {
      margin-left: 280px;
      padding: 2rem;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 2rem;
    }

    .page-title {
      font-size: 1.8rem;
      font-weight: 700;
      color: var(--text-dark);
    }

    .date-display {
      font-size: 0.9rem;
      color: #64748b;
    }

    .dashboard-container {
      display: flex;
      justify-content: center;
    }

    .dashboard-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
      width: 100%;
      max-width: 1200px;
    }

    .dashboard-card {
      background-color: var(--card-bg);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 1.75rem;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;
      text-align: center;
      text-decoration: none;
      color: inherit;
    }

    .dashboard-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1),
                  0 4px 6px -2px rgba(0, 0, 0, 0.05);
    }

    .card-icon {
      width: 60px;
      height: 60px;
      margin: 0 auto 1rem;
      display: flex;
      align-items: center;
      justify-content: center;
      background-color: var(--primary-light);
      border-radius: 50%;
      color: var(--primary-dark);
      font-size: 1.5rem;
    }

    .card-title {
      font-size: 1.1rem;
      font-weight: 600;
      margin-bottom: 0.75rem;
    }

    .card-desc {
      font-size: 0.9rem;
      color: #64748b;
      margin-bottom: 1.5rem;
    }

    .card-btn {
      display: inline-block;
      padding: 0.6rem 1.25rem;
      background-color: var(--primary);
      color: white;
      border: none;
      border-radius: 6px;
      font-weight: 500;
      text-decoration: none;
      transition: background-color 0.2s;
    }

    .card-btn:hover {
      background-color: var(--primary-dark);
    }

    @media (max-width: 768px) {
      .main-content {
        margin-left: 0;
      }
      .dashboard-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>
  <!-- Sidebar -->
  <jsp:include page="adminSidebar.jsp" />

  <!-- Main Content -->
  <div class="main-content">
    <div class="header">
      <h1 class="page-title">Hospital Reports</h1>
      <div class="date-display" id="currentDate"></div>
    </div>

    <div class="dashboard-container">
      <div class="dashboard-grid">
        <!-- Patient Report -->
        <a href="patientReport.jsp" class="dashboard-card">
          <div class="card-icon"><i class="fas fa-notes-medical"></i></div>
          <h3 class="card-title">Patient Report</h3>
          <p class="card-desc">View details, history, and treatments</p>
          <span class="card-btn">View Report</span>
        </a>

        <!-- Appointment Report -->
        <a href="appointmentReport.jsp" class="dashboard-card">
          <div class="card-icon"><i class="fas fa-calendar-alt"></i></div>
          <h3 class="card-title">Appointment Report</h3>
          <p class="card-desc">View schedules by day, week, or month</p>
          <span class="card-btn">Generate</span>
        </a>

        <!-- Doctor Performance Report -->
        <a href="doctorPerformance.jsp" class="dashboard-card">
          <div class="card-icon"><i class="fas fa-user-md"></i></div>
          <h3 class="card-title">Doctor Performance</h3>
          <p class="card-desc">Appointments, prescriptions & feedback</p>
          <span class="card-btn">Analyze</span>
        </a>

        <!-- Login Attendance Report -->
        <a href="loginAttendance.jsp" class="dashboard-card">
          <div class="card-icon"><i class="fas fa-clock"></i></div>
          <h3 class="card-title">Login Attendance</h3>
          <p class="card-desc">Track staff logins & working hours</p>
          <span class="card-btn">View Logs</span>
        </a>

        <!-- Inventory Report -->
        <a href="inventoryReport.jsp" class="dashboard-card">
          <div class="card-icon"><i class="fas fa-pills"></i></div>
          <h3 class="card-title">Inventory Report</h3>
          <p class="card-desc">Check stock, expiry & reorder alerts</p>
          <span class="card-btn">View Inventory</span>
        </a>
      </div>
    </div>
  </div>

  <!-- Script for date -->
  <script>
    document.getElementById('currentDate').textContent =
      new Date().toLocaleDateString('en-US', {
        weekday: 'long',
        year: 'numeric',
        month: 'long',
        day: 'numeric'
      });
  </script>
</body>
</html>
