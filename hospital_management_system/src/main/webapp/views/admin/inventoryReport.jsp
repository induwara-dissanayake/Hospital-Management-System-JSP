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
  <title>Inventory Report</title>

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

    /* Table Styling */
    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 2rem;
      background-color: #ffffff;
      border-radius: 8px;
      box-shadow: var(--shadow);
    }

    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 2px solid #ddd;
    }

    th {
      background-color: var(--primary-light, #93c5fd);
      color: var(--text-dark, #1e293b);
      font-weight: 600;
      border-bottom: 2px solid var(--primary, #3b82f6);
    }

    tr:hover {
      background-color: #f5f5f5;
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
      <h1 class="page-title">Inventory Report</h1>
      <div class="date-display" id="currentDate"></div>
    </div>

    <div class="dashboard-container">
      <div class="dashboard-grid">
        <!-- Inventory Report Card -->
        <a href="inventoryReport.jsp" class="dashboard-card">
          <div class="card-icon"><i class="fas fa-pills"></i></div>
          <h3 class="card-title">Inventory Report</h3>
          <p class="card-desc">Check stock, expiry & reorder alerts</p>
          <span class="card-btn">View Inventory</span>
        </a>
      </div>
    </div>

    <!-- Medicine Table -->
    <table>
      <thead>
        <tr>
          <th>Medicine Name</th>
          <th>Dosage Form</th>
          <th>Dosage Strength</th>
          <th>Stock Quantity</th>
          <th>Prescribed For</th>
          <th>Category</th>
        </tr>
      </thead>
      <tbody>
        <% 
          // Assuming a method fetchMedicines() that retrieves the medicines from your database
          List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
          for (Medicine medicine : medicines) {
        %>
        <tr>
          <td><%= medicine.getMedicineName() %></td>
          <td><%= medicine.getDosageForm() %></td>
          <td><%= medicine.getDosageStrength() %></td>
          <td><%= medicine.getStockQuantity() %></td>
          <td><%= medicine.getPrescribedFor() %></td>
          <td><%= medicine.getCategory() %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
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
