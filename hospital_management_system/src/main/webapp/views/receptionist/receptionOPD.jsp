<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>OPD Patient Registration Form</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionOPD.css">
</head>
<body>
  <div class="tile">
    <form class="form-container" action="register.jsp" method="post">
      <div class="form-header">OPD Patient</div>

      <div class="form-group">
        <label for="opdName">Patient Name</label>
        <input type="text" id="opdName" name="opdName" placeholder="Enter patient name" required />
      </div>

      <div class="form-group">
        <label for="opdNIC">NIC</label>
        <input type="text" id="opdNIC" name="opdNIC" placeholder="Enter NIC" required />
      </div>

      <div class="form-group">
        <label for="opdAge">Age</label>
        <input type="number" id="opdAge" name="opdAge" placeholder="Enter age" min="0" required />
      </div>

      <button type="submit" class="submit-btn">Register OPD Patient</button>
    </form>
  </div>
</body>
</html>
