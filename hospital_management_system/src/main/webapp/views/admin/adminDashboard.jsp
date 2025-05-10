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
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Dashboard</title>

  <!-- Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">
  <style>
    :root {
      --primary: #3b82f6;
      --primary-light: #93c5fd;
      --primary-dark: #1d4ed8;
      --bg: #f1f5f9;
      --text-dark: #1e293b;
      --card-bg: #ffffff;
      --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      --radius: 12px;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: var(--bg);
      color: var(--text-dark);
      min-height: 100vh;
    }

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
      margin-left: 10rem;
      padding-top: 3rem;
    }

    .date-display {
      font-size: 0.9rem;
      color: #64748b;
    }

    .stats-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 1.5rem;
      margin-bottom: 2rem;
      margin-top: 3rem;
      width: 100%;
      max-width: 1000px;
      margin-left: 10rem;
    }

    .stat-card {
      background-color: var(--card-bg);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 1.5rem;
    }

    .stat-title {
      font-size: 1rem;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }

    .stat-value {
      font-size: 2rem;
      font-weight: bold;
      color: var(--primary-dark);
    }

    .dashboard-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
      gap: 1.5rem;
      width: 100%;
      max-width: 1000px;
      margin-left: 10rem;
      margin-top: 2rem;
      margin-bottom: 2rem;
    }

    .dashboard-card {
      background-color: var(--card-bg);
      border-radius: var(--radius);
      box-shadow: var(--shadow);
      padding: 1.75rem;
      text-align: center;
      text-decoration: none;
      color: inherit;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .dashboard-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 15px rgba(0, 0, 0, 0.1);
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
      margin-bottom: 0.5rem;
    }

    .card-desc {
      font-size: 0.9rem;
      color: #64748b;
      margin-bottom: 1.2rem;
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
    }

    .card-btn:hover {
      background-color: var(--primary-dark);
    }

    @media (max-width: 768px) {
      .main-content {
        margin-left: 0;
        padding: 1rem;
      }
    }
  </style>
</head>
<body>

<!-- Sidebar Include -->
<jsp:include page="adminSidebar.jsp" />

<!-- Main Content -->
<div class="main-content">
  <div class="header">
    <h1 class="page-title">Admin Overview</h1>
    <div class="date-display" id="currentDate"></div>
  </div>

  <!-- Quick Stats -->
  <div class="stats-grid">
    <div class="stat-card">
      <h2 class="stat-title">Appointments</h2>
      <div class="stat-value" data-target="49">0</div>
    </div>
    <div class="stat-card">
      <h2 class="stat-title">Today Registered Patients</h2>
      <div class="stat-value" data-target="18">0</div>
    </div>
    <div class="stat-card">
      <h2 class="stat-title">Total Patients</h2>
      <div class="stat-value" data-target="320">0</div>
    </div>
  </div>

  <!-- Management Cards -->
  <div class="dashboard-grid">
    <!-- User Management Card -->
    <a href="${pageContext.request.contextPath}/userManagementServlet" class="dashboard-card">
      <div class="card-icon"><i class="fas fa-users"></i></div>
      <h3 class="card-title">User Management</h3>
      <p class="card-desc">Current List</p>
      <span class="card-btn">View Details</span>
    </a>

    <!-- Medicine Management Card -->
    <a href="${pageContext.request.contextPath}/MedicineServlet" class="dashboard-card">
      <div class="card-icon"><i class="fas fa-pills"></i></div>
      <h3 class="card-title">Medicine Management</h3>
      <p class="card-desc">Manage Medicines</p>
      <span class="card-btn">View Details</span>
    </a>

    <!-- Reports Management Card -->
    <a href="${pageContext.request.contextPath}/views/admin/reportsManagement.jsp" class="dashboard-card">
      <div class="card-icon"><i class="fas fa-file-alt"></i></div>
      <h3 class="card-title">Reports Management</h3>
      <p class="card-desc">Generate Reports</p>
      <span class="card-btn">View Reports</span>
    </a>
  </div>
</div>

<!-- Script for Date -->
<script>
  document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-US', {
    weekday: 'long',
    year: 'numeric',
    month: 'long',
    day: 'numeric'
  });
  
  const counters = document.querySelectorAll('.stat-value');
  const speed = 100; // lower is faster

  counters.forEach(counter => {
    const animate = () => {
      const target = +counter.getAttribute('data-target');
      const count = +counter.innerText;

      const increment = Math.ceil(target / speed);

      if (count < target) {
        counter.innerText = count + increment;
        setTimeout(animate, 15);
      } else {
        counter.innerText = target;
      }
    };

    animate();
  });

</script>

</body>
</html>
