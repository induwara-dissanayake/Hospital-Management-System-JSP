 <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.CounterMedicine" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Medicine Details</title>
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

<h2>Medicine Details</h2>

<%
  CounterMedicine medicine = (CounterMedicine) request.getAttribute("oneMedicine");
  if (medicine == null) {
%>
  <div class="no-result">No medicine found matching the input.</div>
<%
  } else {
%>
  <table>
    <thead>
      <tr>
        <th>Medicine ID</th>
        <th>Medicine Name</th>
        <th>Stock Availability</th>
        <th>Dosage</th>
        <th>Prescribed For</th>
      </tr>
    </thead>
    <tbody>
      <tr>
        <td><%= medicine.getMedicineId() %></td>
        <td><%= medicine.getMedicineName() %></td>
        <td><%= medicine.getStockQuantity() %></td>
        <td><%= medicine.getDosageForm() %></td>
        <td><%= medicine.getPrescribedFor() %></td>
      </tr>
    </tbody>
  </table>
<%
  }
%>

</body>
</html>