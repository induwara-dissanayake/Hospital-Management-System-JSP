<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Records Search</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionPatientrecordsearch.css">
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

  <%-- Database processing happens here --%>

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
    </tbody>
  </table>
</body>
</html>