<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
</head>
<body>
    <div class="container">
        <h2>User Registration Form</h2>
        <form action="${pageContext.request.contextPath}/userRegister" method="POST">

            <label>First Name:</label>
            <input type="text" name="firstName" required><br><br>

            <label>Last Name:</label>
            <input type="text" name="lastName" required><br><br>

            <label>Email:</label>
            <input type="email" name="email" required><br><br>

            <label>Phone:</label>
            <input type="tel" name="phone" required><br><br>

            <label>Address:</label>
            <textarea name="address" required></textarea><br><br>

            <label>Select Role:</label>
            <select name="role" id="role" required>
                <option value="">-- Select --</option>
                <option value="doctor">Doctor</option>
                <option value="pharmacist">Pharmacist</option>
                <option value="receptionist">Receptionist</option>
            </select><br><br>

            <!-- Role-specific fields -->
            <div id="doctorFields" style="display:none;">
                <label>Specialization:</label>
                <input type="text" name="specialization"><br><br>
            </div>

            <div id="pharmacistFields" style="display:none;">
                <label>License Number:</label>
                <input type="text" name="license"><br><br>
            </div>

            <div id="receptionistFields" style="display:none;">
                <label>Preferred Shift:</label>
                <input type="text" name="shift"><br><br>
            </div>

            <button type="submit">Register</button>
        </form>
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
