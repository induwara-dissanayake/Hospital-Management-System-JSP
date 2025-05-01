<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title> Patient Registration Form</title>
  <link rel="stylesheet" href="register.css" />
</head>
<body>

<section class="tiles-container">
  <div class="tile">
    <form class="form-container" action="register.jsp" method="post">
      <h3 class="form-header">Register New Patient</h3>

      <div class="form-group">
        <label for="clinicName">Patient Name</label>
        <input type="text" id="clinicName" name="clinicName" placeholder="Enter patient name" required />
      </div>

      <div class="form-group">
        <label for="guardianName">Guardian Name</label>
        <input type="text" id="guardianName" name="guardianName" placeholder="Enter guardian name" />
      </div>

      <div class="form-group">
        <label for="clinicDob">Date of Birth</label>
        <input type="date" id="clinicDob" name="clinicDob" required />
      </div>

      <div class="form-group">
        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
          <option value="">--Select Gender--</option>
          <option value="Male">Male</option>
          <option value="Female">Female</option>
          <option value="Other">Other</option>
        </select>
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
        <label for="bloodGroup">Blood Group</label>
        <select id="bloodGroup" name="bloodGroup">
          <option value="">--Select Blood Group--</option>
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
        <label for="clinicAddress">Address</label>
        <textarea id="clinicAddress" name="clinicAddress" rows="2" placeholder="Enter address" required></textarea>
      </div>

      <div class="form-group">
        <label for="allergies">Allergies</label>
        <textarea id="allergies" name="allergies" rows="2" placeholder="Mention allergies if any"></textarea>
      </div>

      <div class="form-group">
        <label for="medicalHistory">Previous Medical History</label>
        <textarea id="medicalHistory" name="medicalHistory" rows="2" placeholder="Mention previous illnesses, surgeries etc."></textarea>
      </div>

      <button type="submit" class="submit-btn">Register Clinic Patient</button>

    </form>
  </div>
</section>

</body>
</html>
