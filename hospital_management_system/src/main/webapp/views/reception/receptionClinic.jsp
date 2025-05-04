<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Patient Registration Form</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionClinic.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSidebar.css">
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSideLink.css">
</head>
<body>

<div class="sidebar-wrapper">
  <jsp:include page="receptionSidebar.jsp" />
</div>

<div class="main-content">
<section class="tiles-container">
  <div class="tile">
    <form class="form-container" action="${pageContext.request.contextPath}/ReceptionClinicServlet" method="post">
      <h3 class="form-header">Register New Patient</h3>

      <div class="form-group">
        <label for="patientName">Patient Name</label>
        <input type="text" id="patientName" name="patientName" placeholder="Enter patient name" required />
      </div>

      <div class="form-group">
        <label for="dob">Date of Birth</label>
        <input type="date" id="dob" name="dob" required />
      </div>

      <div class="form-group">
        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
          <option value="">Select Gender</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
        </select>
      </div>

      <div class="form-group">
        <label for="nic">NIC</label>
        <input type="text" id="nic" name="nic" placeholder="Enter NIC" required />
      </div>

      <div class="form-group">
        <label for="clinicType">Clinic Type</label>
        <select id="clinicType" name="clinicType">
          <option value="">Select Clinic Type</option>
          <option value="1">Eye Clinic</option>
          <option value="2">Cardiology Clinic</option>
          <option value="3">Gynecology Clinic</option>
          <option value="4">Neurology Clinic</option>
          <option value="5">Pediatric Clinic</option>
        </select>
      </div>

      <div class="form-group">
        <label for="bloodGroup">Blood Group</label>
        <select id="bloodGroup" name="bloodGroup">
          <option value="">Select Blood Group</option>
          <option value="A+">A+</option>
          <option value="A-">A-</option>
          <option value="B+">B+</option>
          <option value="B-">B-</option>
          <option value="O+">O+</option>
          <option value="O-">O-</option>
          <option value="AB+">AB+</option>
          <option value="AB-">AB-</option>
        </select>
      </div>

      <div class="form-group">
        <label for="telephone">Telephone Number</label>
        <input type="tel" id="telephone" name="telephone" placeholder="Enter telephone number" required />
      </div>

      <div class="form-group">
        <label for="address">Address</label>
        <textarea id="address" name="address" rows="2" placeholder="Enter address" required></textarea>
      </div>

      <div class="form-group">
        <label for="guardianName">Guardian Name</label>
        <input type="text" id="guardianName" name="guardianName" placeholder="Enter guardian name" />
      </div>

      <div class="form-group">
        <label for="guardianTelephone">Guardian Telephone Number</label>
        <input type="tel" id="guardianTelephone" name="guardianTelephone" placeholder="Enter telephone number" required />
      </div>

      <button type="submit" class="submit-btn">Register Clinic Patient</button>

    </form>
  </div>
</section>
</div>
</body>
</html>
