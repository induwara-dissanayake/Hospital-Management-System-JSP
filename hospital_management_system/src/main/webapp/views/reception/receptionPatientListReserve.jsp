<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.Patient" %>
<%@ page import="com.hospital.model.ClinicOrder" %>
<%@ page import="java.sql.Timestamp" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Details</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSidebar.css">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f9f9f9;
      display: flex;
    }

    .content-wrapper {
      flex: 1;
      margin-left: 280px;
      padding: 20px;
    }

    .page-header {
      background: white;
      padding: 20px;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
    }

    h2 {
      color: #2d3748;
      margin: 0;
      font-size: 24px;
      display: flex;
      align-items: center;
    }

    h2 i {
      margin-right: 10px;
      color: #4a5568;
    }

    .patient-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      overflow: hidden;
    }

    .patient-header {
      background: #4a5568;
      color: white;
      padding: 15px 20px;
      font-weight: bold;
      display: flex;
      align-items: center;
    }

    .patient-header i {
      margin-right: 10px;
    }

    .patient-info {
      padding: 20px;
    }

    .info-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 20px;
    }

    .info-item {
      background: #f7fafc;
      padding: 15px;
      border-radius: 8px;
    }

    .info-label {
      font-size: 12px;
      color: #718096;
      margin-bottom: 5px;
      text-transform: uppercase;
    }

    .info-value {
      font-size: 14px;
      color: #2d3748;
      font-weight: 500;
    }

    .no-result {
      text-align: center;
      padding: 40px;
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }

    .no-result i {
      font-size: 48px;
      color: #cbd5e0;
      margin-bottom: 20px;
      display: block;
    }

    .no-result p {
      color: #4a5568;
      margin: 0;
      font-size: 16px;
    }

    .back-button {
      margin-top: 20px;
      text-align: center;
    }

    .back-button a {
      background-color: #4a5568;
      color: white;
      padding: 10px 20px;
      text-decoration: none;
      border-radius: 6px;
      font-weight: bold;
      transition: background-color 0.3s;
    }

    .back-button a:hover {
      background-color: #2d3748;
    }

    @media (max-width: 768px) {
      .content-wrapper {
        margin-left: 0;
      }

      .info-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>
  <div class="sidebar-align">
    <jsp:include page="../reception/receptionSidebar.jsp" />
  </div>

  <div class="content-wrapper">
    <div class="page-header">
      <h2><i class="fas fa-user-circle"></i>Clinic Patient Token Number Details</h2>
    </div>

    <%
      Patient patient = (Patient) request.getAttribute("onepatient");
      ClinicOrder clinicOrder = (ClinicOrder) request.getAttribute("clinicOrder");

      if (patient == null) {
    %>
      <div class="no-result">
        <i class="fas fa-user-slash"></i>
        <p>No patient found matching the input.</p>
      </div>
    <%
      } else {
    %>
      <div class="patient-card">
        <div class="patient-header">
          <i class="fas fa-id-card"></i>
          Patient ID: <%= patient.getId() %>
        </div>
        <div class="patient-info">
          <div class="info-grid">
            <div class="info-item">
              <div class="info-label">Name</div>
              <div class="info-value"><%= patient.getPatientName() %></div>
            </div>
            <div class="info-item">
              <div class="info-label">Clinic ID</div>
              <div class="info-value"><%= patient.getClinicId() %></div>
            </div>
            <div class="info-item">
              <div class="info-label">NIC</div>
              <div class="info-value"><%= patient.getPatientNic() %></div>
            </div>
            <div class="info-item">
              <div class="info-label">Patient ID</div>
              <div class="info-value">
			  <div class="info-value"><%= clinicOrder.getPatientId() %></div>
              </div>
            </div>
            <div class="info-item">
              <div class="info-label">Token Number</div>
              <div class="info-value">
                <%= clinicOrder != null ? clinicOrder.getTolkenNo() : "Token not yet generated" %>
              </div>
            </div>
            <div class="info-item">
              <div class="info-label">Date</div>
              <div class="info-value">
                <%= clinicOrder != null && clinicOrder.getDate() != null ? clinicOrder.getDate().toString() : "Date not available" %>
              </div>
            </div>
          </div>
        </div>
      </div> 

      <div class="back-button">
        <a href="${pageContext.request.contextPath}/ReceptionListSearchServlet">
          ← Back to Patient List
        </a>
      </div>
    <%
      }
    %>
  </div>
</body>
</html>
