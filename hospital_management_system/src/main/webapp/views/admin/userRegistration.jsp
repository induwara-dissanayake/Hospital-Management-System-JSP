<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>User Registration</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <style>
    body {
      margin: 0;
      padding: 0;
      min-height: 100vh;
      background: linear-gradient(120deg, #e0eafc, #cfdef3);
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    .form-container {
      background: rgba(255, 255, 255, 0.95);
      padding: 40px 30px;
      border-radius: 20px;
      box-shadow: 0 8px 32px rgba(31, 38, 135, 0.15);
      width: 400px;
      margin: 60px auto;
      backdrop-filter: blur(4px);
      border: 1px solid rgba(255, 255, 255, 0.18);
    }
    h2 {
      margin-bottom: 30px;
      color: #2e2e2e;
      letter-spacing: 1px;
      text-align: center;
      font-size: 28px;
      font-weight: 600;
      position: relative;
      padding-bottom: 10px;
    }
    h2:after {
      content: '';
      position: absolute;
      bottom: 0;
      left: 50%;
      transform: translateX(-50%);
      width: 60px;
      height: 3px;
      background: linear-gradient(90deg, #3b82f6, #1d4ed8);
      border-radius: 2px;
    }
    .input-group {
      position: relative;
      margin-bottom: 25px;
    }
    .input-group i {
      position: absolute;
      left: 15px;
      top: 50%;
      transform: translateY(-50%);
      color: #1d4ed8;
      font-size: 18px;
    }
    input, select {
      width: 100%;
      padding: 15px 15px 15px 45px;
      border: 2px solid #3b82f6;
      border-radius: 12px;
      font-size: 16px;
      background: #f1f5f9;
      transition: 0.3s;
      box-sizing: border-box;
    }
    input:focus, select:focus {
      border-color: #1d4ed8;
      outline: none;
      box-shadow: 0 0 0 3px rgba(79, 160, 166, 0.1);
      background: #fff;
    }
    input::placeholder {
      color: #94a3b8;
    }
    button {
      width: 100%;
      padding: 15px;
      background: #3b82f6;
      color: #fff;
      border: none;
      border-radius: 12px;
      font-size: 16px;
      font-weight: 600;
      cursor: pointer;
      transition: 0.3s;
      margin-top: 10px;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 10px;
    }
    button:hover {
      background: #1d4ed8;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(79, 160, 166, 0.3);
    }
    button:active {
      transform: translateY(0);
    }
    .content-wrapper {
      margin-left: 280px;
      padding: 40px 0;
      min-height: 100vh;
      display: flex;
      align-items: flex-start;
      justify-content: center;
    }
    @media (max-width: 768px) {
      .content-wrapper {
        margin-left: 0;
        padding: 20px 0;
      }
      .form-container {
        margin: 20px auto;
        width: 90%;
        max-width: 400px;
      }
    }
  </style>
</head>
<body>
<%@ include file="adminSidebar.jsp" %>
<div class="content-wrapper">
  <div class="form-container">
    <h2>User Registration</h2>
    <form action="${pageContext.request.contextPath}/adminUserManagement" method="post">
      <!-- First Name -->
      <div class="input-group">
        <i class="fas fa-user"></i>
        <input type="text" name="firstName" placeholder="First Name" required />
      </div>

      <!-- Last Name -->
      <div class="input-group">
        <i class="fas fa-user"></i>
        <input type="text" name="lastName" placeholder="Last Name" required />
      </div>

      <!-- Email -->
      <div class="input-group">
        <i class="fas fa-envelope"></i>
        <input type="email" name="email" placeholder="Email" required />
      </div>

      <!-- Phone -->
      <div class="input-group">
        <i class="fas fa-phone"></i>
        <input type="tel" name="phone" placeholder="Phone Number" required />
      </div>

      <!-- Role -->
      <div class="input-group">
        <i class="fas fa-user-tag"></i>
        <select id="role" name="role" required>
          <option value="" disabled selected>Select Role</option>
          <option value="doctor">Doctor</option>
          <option value="pharmacist">Pharmacist</option>
          <option value="receptionist">Receptionist</option>
        </select>
      </div>

      <!-- Address -->
      <div class="input-group">
        <i class="fas fa-map-marker-alt"></i>
        <input type="text" name="address" placeholder="Address" required />
      </div>

      <!-- Doctor Field -->
      <div id="doctorFields" style="display:none;">
        <div class="input-group">
          <i class="fas fa-stethoscope"></i>
          <input type="text" name="specialization" placeholder="Specialization" />
        </div>
      </div>

      <!-- Pharmacist Field -->
      <div id="pharmacistFields" style="display:none;">
        <div class="input-group">
          <i class="fas fa-certificate"></i>
          <input type="text" name="license" placeholder="License" />
        </div>
      </div>

      <!-- Receptionist Field -->
      <div id="receptionistFields" style="display:none;">
        <div class="input-group">
          <i class="fas fa-clock"></i>
          <input type="text" name="shift" placeholder="Shift" />
        </div>
      </div>

      <!-- Submit -->
      <button type="submit">
        <i class="fas fa-user-plus"></i>
        Register
      </button>
    </form>
  </div>
</div>

<script src="${pageContext.request.contextPath}/resources/javascript/admin.js"></script>
<script>
  const role = document.getElementById("role");
  const doctorFields = document.getElementById("doctorFields");
  const pharmacistFields = document.getElementById("pharmacistFields");
  const receptionistFields = document.getElementById("receptionistFields");

  role.addEventListener("change", function () {
    doctorFields.style.display = "none";
    pharmacistFields.style.display = "none";
    receptionistFields.style.display = "none";

    if (this.value === "doctor") {
      doctorFields.style.display = "block";
    } else if (this.value === "pharmacist") {
      pharmacistFields.style.display = "block";
    } else if (this.value === "receptionist") {
      receptionistFields.style.display = "block";
    }
  });
</script>
</body>
</html>
