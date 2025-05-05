<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/userRegistration.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">

<body>

<div class="sidebar-wrapper">
  <jsp:include page="adminSidebar.jsp" />
</div>


<div class="main-content">
<section class="tiles-container">
  <div class="tile">
    <form class="form-container" action="${pageContext.request.contextPath}/userRegister" method="post">
      <h3 class="form-header">User Registration</h3>

      <div class="form-group">
        <label for="firstName">First Name</label>
        <input type="text" id="firstName" name="firstName" placeholder="Enter first name" required />
      </div>
      
       <div class="form-group">
        <label for="lastName">Last Name</label>
        <input type="text" id="lastName" name="lastName" placeholder="Enter last name" required />
      </div>
      
       <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="Enter email" required />
      </div>

       <div class="form-group">
        <label for="phone">Phone</label>
        <input type="tel" id="phone" name="phone" placeholder="Enter phone number" required />
      </div>



      <div class="form-group">
        <label for="role">Role</label>
        <select id="role" name="role">
          <option value="">Select Role</option>
          <option value="doctor">Doctor</option>
          <option value="pharmacist">Pharmacist</option>
          <option value="receptionist">Receptionist</option>
        </select>
      </div>

      <div class="form-group">
        <label for="address">Address</label>
        <textarea id="address" name="address" rows="2" placeholder="Enter address" required></textarea>
      </div>
      
       <!-- Role-specific fields -->
            <div id="doctorFields" style="display:none;">
                <label>Specialization</label>
                <input type="text" name="specialization"><br><br>
            </div>

            <div id="pharmacistFields" style="display:none;">
                <label>License Number</label>
                <input type="text" name="license"><br><br>
            </div>

            <div id="receptionistFields" style="display:none;">
                <label>Preferred Shift</label>
                <input type="text" name="shift"><br><br>
            </div>
      
      
       <button type="submit" class="submit-btn">Register</button>

</form>
</div>
</section>
  
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