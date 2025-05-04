<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.PatientReport" %>
<%@ page import="java.util.List" %>
<%
    Integer roleId = (Integer) session.getAttribute("role_id");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Medical History</title>
  <!-- Add Font Awesome CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
  <%
    if (roleId != null) {
        if (roleId == 1) {
  %>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
  <%
        } else if (roleId == 2) {
  %>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSidebar.css">
  <%
        }
    }
  %>
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

    .patient-info {
      background: #e6f7ff;
      padding: 15px;
      border-radius: 8px;
      margin: 20px 0;
      border-left: 4px solid #1890ff;
    }

    .report-card {
      background: white;
      border-radius: 10px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      overflow: hidden;
    }

    .report-header {
      background: #4a5568;
      color: white;
      padding: 15px 20px;
      font-weight: bold;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .report-body {
      padding: 20px;
    }

    .report-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 15px;
    }

    .report-item {
      padding: 10px;
      border-radius: 6px;
      background: #f7fafc;
    }

    .report-label {
      font-size: 12px;
      color: #718096;
      margin-bottom: 5px;
    }

    .report-value {
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
    }

    .no-result p {
      color: #4a5568;
      margin: 0;
      font-size: 16px;
    }

    @media (max-width: 768px) {
      .content-wrapper {
        margin-left: 0;
      }
      
      .report-grid {
        grid-template-columns: 1fr;
      }
    }
  </style>
</head>
<body>
<%
    if (roleId != null) {
        if (roleId == 1) {
%>
            <div class="sidebar-align">
                <jsp:include page="../doctor/doctorSidebar.jsp" />
            </div>
<%
        } else if (roleId == 2) {
%>
            <div class="sidebar-align">
                <jsp:include page="../reception/receptionSidebar.jsp" />
            </div>
<%
        }
    }
%>

<div class="content-wrapper">
    <div class="page-header">
        <h2><i class="fas fa-file-medical"></i> Patient Medical History</h2>
    </div>

    <div class="patient-info">
        <strong>Patient ID:</strong> <%= request.getAttribute("patientId") %>
    </div>

    <%
    List<PatientReport> reports = (List<PatientReport>) request.getAttribute("reports");
    if (reports == null || reports.isEmpty()) {
    %>
        <div class="no-result">
            <i class="fas fa-file-medical-alt"></i>
            <p>No medical reports available for this patient.</p>
        </div>
    <%
    } else {
        for (PatientReport report : reports) {
    %>
        <div class="report-card">
            <div class="report-header">
                <span>Report Date: <%= report.getDate() %></span>
                <span>Order ID: <%= report.getOrder_id() %></span>
            </div>
            <div class="report-body">
                <div class="report-grid">
                    <div class="report-item">
                        <div class="report-label">Doctor ID</div>
                        <div class="report-value"><%= report.getDoctor_id() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Weight</div>
                        <div class="report-value"><%= report.getWeight() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Blood Pressure</div>
                        <div class="report-value"><%= report.getBp() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Sugar Level</div>
                        <div class="report-value"><%= report.getSugar_level() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Lipid Profile</div>
                        <div class="report-value"><%= report.getLipid_profile() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Hemoglobin</div>
                        <div class="report-value"><%= report.getHemoglobin() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Vision</div>
                        <div class="report-value"><%= report.getVision() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">Eye Pressure</div>
                        <div class="report-value"><%= report.getEye_pressure() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">VDRL</div>
                        <div class="report-value"><%= report.getVdrl() %></div>
                    </div>
                    <div class="report-item">
                        <div class="report-label">HIV</div>
                        <div class="report-value"><%= report.getHiv() %></div>
                    </div>
                </div>
            </div>
        </div>
    <%
        }
    }
    %>
</div>

</body>
</html>
