<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.PatientReport" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Medical Report</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
    }
    h2 {
      text-align: center;
      font-weight: 600;
      color: #1a202c;
      font-size: 18px;
    }
    table {
      width: 100%;
      border-collapse: collapse;
      border: 1px solid #477ac6;
      border-radius: 6px;
      overflow: hidden;
      font-size: 14px;
      color: #182946;
      text-align: left;
      margin-top: 30px;
    }
    thead {
      background-color: #a3c2d7;
    }
    th, td {
      padding: 8px 12px;
      border-bottom: 1px solid #afc5e7;
    }
    td {
      font-size: 14px;
    }
    .no-result {
      text-align: center;
      padding: 20px;
      background: #fff3cd;
      color: #856404;
      margin-top: 30px;
      border: 1px solid #ffeeba;
      border-radius: 6px;
    }
  </style>
</head>
<body>

  <h2>Medical Report</h2>

  <%
    PatientReport report = (PatientReport) request.getAttribute("medicalReport");
    if (report == null) {
  %>
    <div class="no-result">No medical report available for this patient.</div>
  <%
    } else {
  %>
    <table>
      <thead>
        <tr>
          <th>Order ID</th>
          <th>Doctor ID</th>
          <th>Patient ID</th>
          <th>Date</th>
          <th>Weight</th>
          <th>Blood Pressure</th>
          <th>Sugar Level</th>
          <th>Lipid Profile</th>
          <th>Hemoglobin</th>
          <th>Vision</th>
          <th>Eye Pressure</th>
          <th>VDRL</th>
          <th>HIV</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td><%= report.getOrder_id() %></td>
          <td><%= report.getDoctor_id() %></td>
          <td><%= report.getPatient_id() %></td>
          <td><%= report.getDate() %></td>
          <td><%= report.getWeight() %></td>
          <td><%= report.getBp() %></td>
          <td><%= report.getSugar_level() %></td>
          <td><%= report.getLipid_profile() %></td>
          <td><%= report.getHemoglobin() %></td>
          <td><%= report.getVision() %></td>
          <td><%= report.getEye_pressure() %></td>
          <td><%= report.getVdrl() %></td>
          <td><%= report.getHiv() %></td>
        </tr>
      </tbody>
    </table>
  <%
    }
  %>

</body>
</html>
