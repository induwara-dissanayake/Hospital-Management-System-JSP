<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Records Search</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f9f9f9;
    }

    #patient-records-search {
      background-color: white;
      border-radius: 8px;
      padding: 24px;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
      max-width: 500px;
      margin: auto;
      display: flex;
      flex-direction: column;
      gap: 1px;
    }

    #patient-records-search h2 {
      font-weight: 600;
      color: #1a202c;
      font-size: 18px;
      margin-bottom: 15px;
    }

    .form-row {
      display: flex;
      align-items: center;
      gap: 10px;
      margin-bottom: 15px;
    }

    .form-row input {
      flex: 1;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #d2d6dc;
      font-size: 14px;
      color: #1a202c;
      outline: none;
    }

    .form-row input::placeholder {
      color: #718096;
    }

    .form-row input:focus {
      border-color: #4f5bd5;
      box-shadow: 0 0 0 3px rgba(79, 91, 213, 0.3);
    }

    .submit-btn {
      background-color: #4f5bd5;
      color: white;
      padding: 10px 15px;
      border-radius: 6px;
      font-weight: bold;
      cursor: pointer;
      border: none;
      outline: none;
      white-space: nowrap;
    }

    .submit-btn:hover {
      background-color: #3b44b1;
    }

    .submit-btn:focus {
      box-shadow: 0 0 0 3px rgba(79, 91, 213, 0.3);
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
  </style>
</head>
<body>
  <section id="patient-records-search" aria-label="Patient Records Search">
    <h2>Patient Records Search</h2>
    <form class="form-container" action="searchResults.jsp" method="post">
      <div class="form-row">
        <input type="text" id="nameorid" name="nameorid" placeholder="Enter NIC or Patient ID" required />
        <button type="submit" class="submit-btn">Search</button>
      </div>
    </form>
  </section>

  <%
    // Database part here, use server-side logic to retrieve patients from a database
    // sample data below
  %>

  <table>
    <thead>
      <tr>
        <th>Patient ID</th>
        <th>NIC</th>
        <th>Name</th>
        <th>Telephone Number</th>
        <th>Clinic Date</th>
        <th>Next Clinic Date</th>
      </tr>
    </thead>

    <tbody>
      <tr>
        <td>001</td>
        <td>199012345678</td>
        <td>John Silva</td>
        <td>0712345678</td>
        <td>2025-04-15</td>
        <td>2025-05-15</td>
      </tr>
      <tr>
        <td>002</td>
        <td>198956789012</td>
        <td>Mary Fernando</td>
        <td>0779876543</td>
        <td>2025-04-20</td>
        <td>2025-05-20</td>
      </tr>
      <tr>
        <td>003</td>
        <td>200145678901</td>
        <td>Kamal Perera</td>
        <td>0751234567</td>
        <td>2025-04-10</td>
        <td>2025-05-10</td>
      </tr>
      <tr>
        <td>004</td>
        <td>199876543210</td>
        <td>Nadeesha Wijesinghe</td>
        <td>0723456789</td>
        <td>2025-04-18</td>
        <td>2025-05-18</td>
      </tr>
      <tr>
        <td>005</td>
        <td>200234567890</td>
        <td>Ruwan Abeysekara</td>
        <td>0767890123</td>
        <td>2025-04-22</td>
        <td>2025-05-22</td>
      </tr>
    </tbody>
  </table>
</body>
</html>
