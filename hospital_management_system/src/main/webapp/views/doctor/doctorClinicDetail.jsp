<%@ page import="com.hospital.model.Patient" %>
<%
    Patient patient = (Patient) request.getAttribute("patient");

    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }

    Integer clinicId = (Integer) session.getAttribute("clinic_id"); // getting clinic_id from session
%>

<!DOCTYPE html>
<html>
<head>
    <title>Clinic Order Details</title>
    <script>
        var clinicId = <%= clinicId != null ? clinicId : 0 %>; // if null, set 0

        window.onload = function() {
            // Hide all clinic-specific fields initially
            document.querySelectorAll('.clinic-field').forEach(e => e.style.display = 'none');

            if (clinicId === 1) {
                document.querySelectorAll('.clinic1').forEach(e => e.style.display = 'block');
            } else if (clinicId === 2) {
                document.querySelectorAll('.clinic2').forEach(e => e.style.display = 'block');
            } else if (clinicId === 3) {
                document.querySelectorAll('.clinic3').forEach(e => e.style.display = 'block');
            } else if (clinicId === 4) {
                document.querySelectorAll('.clinic4').forEach(e => e.style.display = 'block');
            } else if (clinicId === 5) {
                document.querySelectorAll('.clinic5').forEach(e => e.style.display = 'block');
            }
        };
    </script>
</head>
<body>
    <h2>Order Details</h2>
    <p><strong>Patient ID:</strong> <%= patient.getId() %></p>
    <p><strong>Patient Name:</strong> <%= patient.getPatientName() %></p>
    <p><strong>Patient NIC:</strong> <%= patient.getPatientNic() %></p>

    <form method="post" action="SavePrescriptionServlet">
        <!-- Common fields -->
        <label>General Notes: <input type="text" name="general_notes" /></label><br><br>

        <!-- Clinic 1 fields -->
        <div class="clinic-field clinic1">
            <label>Eye Pressure: <input type="text" name="eye_pressure" /></label><br>
            <label>Visual Acuity: <input type="text" name="visual_acuity" /></label><br>
        </div>

        <!-- Clinic 2 fields -->
        <div class="clinic-field clinic2">
            <label>Dental Diagnosis: <input type="text" name="dental_diagnosis" /></label><br>
            <label>Tooth Number: <input type="text" name="tooth_number" /></label><br>
        </div>

        <!-- Clinic 3 fields -->
        <div class="clinic-field clinic3">
            <label>Cardiology ECG: <input type="text" name="ecg_result" /></label><br>
        </div>

        <!-- Clinic 4 fields -->
        <div class="clinic-field clinic4">
            <label>ENT Hearing Test: <input type="text" name="hearing_test" /></label><br>
        </div>

        <!-- Clinic 5 fields -->
        <div class="clinic-field clinic5">
            <label>Dermatology Diagnosis: <input type="text" name="skin_diagnosis" /></label><br>
        </div>

        <button type="submit">Save Prescription</button>
    </form>

    <br>
    <a href="${pageContext.request.contextPath}/DoctorEyeClinicServlet?clinic_id=1">Back to List</a>
</body>
</html>
