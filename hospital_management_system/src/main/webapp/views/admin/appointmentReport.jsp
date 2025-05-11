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
  <title>Appointment Report</title>

  <!-- Font Awesome & CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">

  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f1f5f9;
      margin: 0;
      padding: 0;
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
      font-weight: bold;
      color: #1e293b;
    }

    .date-display {
      color: #64748b;
      font-size: 0.9rem;
    }

    .table-container {
      background: white;
      border-radius: 12px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.05);
      padding: 2rem;
      overflow-x: auto;
      margin-bottom: 2rem;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 0.75rem 1rem;
      border-bottom: 1px solid #e2e8f0;
      text-align: left;
    }

    th {
      background-color: #f8fafc;
      color: #334155;
    }

    tr:hover {
      background-color: #f1f5f9;
    }

    .appointment-status {
      font-weight: bold;
      padding: 0.25rem 0.5rem;
      border-radius: 6px;
    }

    .completed {
      background-color: #dcfce7;
      color: #16a34a;
    }

    .pending {
      background-color: #fef3c7;
      color: #ca8a04;
    }

    .canceled {
      background-color: #fee2e2;
      color: #dc2626;
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
  <jsp:include page="adminSidebar.jsp" />

  <div class="main-content">
    <div class="header">
      <h1 class="page-title">Appointment Report</h1>
      <div class="date-display" id="currentDate"></div>
    </div>

    <!-- OPD Report Section -->
    <div class="table-container">
      <h2>OPD Appointments</h2>
      <table>
        <thead>
          <tr>
            <th>Appointment ID</th>
            <th>Doctor</th>
            <th>Patient</th>
            <th>Time</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>OPD-001</td>
            <td>Dr. Amanda Silva</td>
            <td>John Doe</td>
            <td>9:00 AM</td>
            <td><span class="appointment-status completed">Completed</span></td>
          </tr>
          <tr>
            <td>OPD-002</td>
            <td>Dr. Nishan Fernando</td>
            <td>Sarah Lee</td>
            <td>10:00 AM</td>
            <td><span class="appointment-status pending">Pending</span></td>
          </tr>
          <tr>
            <td>OPD-003</td>
            <td>Dr. Sanduni Jayasekara</td>
            <td>Mark Smith</td>
            <td>11:00 AM</td>
            <td><span class="appointment-status canceled">Canceled</span></td>
          </tr>
          <!-- Add dynamic rows from backend here -->
        </tbody>
      </table>
    </div>

    <!-- Clinic Report Section -->
    <div class="table-container">
      <h2>Clinic Appointments</h2>
      <table>
        <thead>
          <tr>
            <th>Appointment ID</th>
            <th>Doctor</th>
            <th>Patient</th>
            <th>Time</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>CLINIC-001</td>
            <td>Dr. Amanda Silva</td>
            <td>Jane Doe</td>
            <td>1:00 PM</td>
            <td><span class="appointment-status completed">Completed</span></td>
          </tr>
          <tr>
            <td>CLINIC-002</td>
            <td>Dr. Nishan Fernando</td>
            <td>Peter Chang</td>
            <td>2:00 PM</td>
            <td><span class="appointment-status pending">Pending</span></td>
          </tr>
          <tr>
            <td>CLINIC-003</td>
            <td>Dr. Sanduni Jayasekara</td>
            <td>Lily Roberts</td>
            <td>3:00 PM</td>
            <td><span class="appointment-status canceled">Canceled</span></td>
          </tr>
          <!-- Add dynamic rows from backend here -->
        </tbody>
      </table>
    </div>

  </div>

  <script>
    document.getElementById('currentDate').textContent = new Date().toLocaleDateString('en-US', {
      weekday: 'long',
      year: 'numeric',
      month: 'long',
      day: 'numeric'
    });
  </script>
</body>
</html>
