<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Clinic Patient Registration Form</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionClinic.css">
</head>
<body>
  <section class="tiles-container">
    <div class="tile">
      <form class="form-container" action="register.jsp" method="post">
        <h3 class="form-header">Clinic Patient</h3>
        <div class="form-group">
          <label for="clinicName">Patient Name</label>
          <input type="text" id="clinicName" name="clinicName" placeholder="Enter patient name" required />
        </div>
        <div class="form-group">
          <label for="clinicDob">Date of Birth</label>
          <input type="date" id="clinicDob" name="clinicDob" required />
        </div>
        <div class="form-group">
          <label for="clinicNIC">NIC</label>
          <input type="text" id="clinicNIC" name="clinicNIC" placeholder="Enter NIC" required />
        </div>
        <div class="form-group">
          <label for="clinicTp">Telephone Number</label>
          <input type="tel" id="clinicTp" name="clinicTp" placeholder="Enter telephone number" required />
        </div>
        <div class="form-group">
          <label for="clinicAddress">Address</label>
          <textarea id="clinicAddress" name="clinicAddress" rows="2" placeholder="Enter address" required></textarea>
        </div>
        <button type="submit" class="submit-btn">Register Clinic Patient</button>
      </form>
    </div>
  </section>
</body>
</html>
