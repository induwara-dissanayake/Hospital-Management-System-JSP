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
  <title>Login Attendance</title>

  <!-- Font Awesome & CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">

  <style>
    body {
      font-family:  'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      padding: 0.75rem 1rem;
      border-bottom: 2px solid #e2e8f0;
      text-align: left;
    }

    th {
      background-color: var(--primary-light, #93c5fd);
      color: var(--text-dark, #1e293b);
      font-weight: 600;
      border-bottom: 2px solid var(--primary, #3b82f6);
    }

    tr:hover {
      background-color: #f1f5f9;
    }

    .status {
      font-weight: bold;
      padding: 0.25rem 0.5rem;
      border-radius: 6px;
    }

    .present {
      background-color: #dcfce7;
      color: #16a34a;
    }

    .absent {
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
      <h1 class="page-title">Login Attendance</h1>
      <div class="date-display" id="currentDate"></div>
    </div>

    <div class="table-container">
      <table>
        <thead>
          <tr>
            <th>Staff Name</th>
            <th>Role</th>
            <th>Login Time</th>
            <th>Logout Time</th>
            <th>Status</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Dr. Amanda Silva</td>
            <td>Doctor</td>
            <td>08:05 AM</td>
            <td>03:45 PM</td>
            <td><span class="status present">Present</span></td>
          </tr>
          <tr>
            <td>John Perera</td>
            <td>Receptionist</td>
            <td>09:00 AM</td>
            <td>05:00 PM</td>
            <td><span class="status present">Present</span></td>
          </tr>
          <tr>
            <td>Nimesha Dissanayake</td>
            <td>Pharmacist</td>
            <td>-</td>
            <td>-</td>
            <td><span class="status absent">Absent</span></td>
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
