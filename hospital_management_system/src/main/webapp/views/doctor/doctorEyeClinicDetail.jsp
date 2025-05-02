<%@ page import="com.hospital.model.Patient" %>
<%
Patient patient = (Patient) request.getAttribute("eyepatient");
%>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Clinic Order Details</title>
</head>
<body>
    <h2>Order Details</h2>
    <p><strong>Patient ID:</strong> <%= patient.getId() %></p>
    <p><strong>Patient Name:</strong> <%= patient.getName() %></p>
    <p><strong>Patient Nic:</strong> <%= patient.getNic() %></p>
    <a href="${pageContext.request.contextPath}/DoctorEyeClinicServlet?clinic_id=1">Back to List</a>
</body>
</html>
