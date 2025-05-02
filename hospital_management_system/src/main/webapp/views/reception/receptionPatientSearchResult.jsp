<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Patient" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Search Results</title>
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

<h2>Search Results for: <%= request.getAttribute("searchInput") %></h2>

<%
  List<Patient> patients = (List<Patient>) request.getAttribute("patients");

  if (patients == null || patients.isEmpty()) {
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
          <th>Address</th>
          <th>NIC</th>
          <th>Contact No</th>
          <th>Guardian Name</th>
          <th>Guardian Contact No</th>
        </tr>
      </thead>
      <tbody>
      <%
        for (Patient patient : patients) {
      %>
<tr>
    <td><%= patient.getId() %></td>
    <td><%= patient.getPatient_name() %></td>
    <td><%= patient.getPatient_dob() %></td>
    <td><%= patient.getClinic_id() %></td>
    <td><%= patient.getPatient_address() %></td>
    <td><%= patient.getPatient_nic() %></td>
    <td><%= patient.getPatient_contact_no() %></td>
    <td><%= patient.getPatient_guardian_name() %></td>
    <td><%= patient.getPatient_guardian_contact_no() %></td>
</tr>

      <%
        }
      %>
      </tbody>
    </table>
<%
  }
%>

</body>
</html>
