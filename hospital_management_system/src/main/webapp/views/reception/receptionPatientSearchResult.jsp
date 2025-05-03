<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.Patient" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Patient Details</title>
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
    .view-btn {
      display: inline-block;
      font-size: 14px;
      padding: 6px 12px;
      background: #4caf50;
      border-radius: 4px;
      color: white;
      text-decoration: none;
      }
      
    .view-btn:hover {
      background: #45a049;
    }
  </style>
</head>
<body>

    <h2>Patient Details</h2>
    
    <%
    Patient patient = (Patient) request.getAttribute("onepatient");
    if (patient == null) {
    %>
        <div class="no-result">No patient found matching the input.</div>
    <%
    } else {
    %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>DOB</th>
                    <th>Clinic ID</th>
                    <th>Gender</th>
                    <th>Blood Type</th>
                    <th>Address</th>
                    <th>NIC</th>
                    <th>Contact No</th>
                    <th>Guardian Name</th>
                    <th>Guardian Contact No</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><%= patient.getId() %></td>
                    <td><%= patient.getPatientName() %></td>
                    <td><%= patient.getPatientDob() %></td>
                    <td><%= patient.getClinicId() %></td>
                    <td><%= patient.getGender() %></td>
                    <td><%= patient.getBloodType() %></td>          
                    <td><%= patient.getPatientAddress() %></td>
                    <td><%= patient.getPatientNic() %></td>
                    <td><%= patient.getPatientContactNo() %></td>
                    <td><%= patient.getPatientGuardianName() %></td>
                    <td><%= patient.getPatientGuardianContactNo() %></td>
                </tr>
            </tbody>
        </table>
    <%
    }
    %>

</body>
</html>
