<%@page import="com.hospital.model.ClinicOrder"%>
<%@ page import="java.util.*, com.hospital.model.ClinicOrder" %>
<%
    if (session == null || session.getAttribute("doctor_id") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Clinic Patients</title>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>
<body>
    <h2 style="text-align:center;">Clinic Patient Orders</h2>
    <table border="1" align="center" cellpadding="10">
        <tr>
            <th>Order ID</th>
            <th>Patient Name</th>
        </tr>
        <%
            List<ClinicOrder> patients = (List<ClinicOrder>) request.getAttribute("clinicpatients");
            for (ClinicOrder patient : patients) {
        %>
        <tr>
            <td><%= patient.getId() %></td>
            <td><%= patient.getPatient_id() %></td>
           
        </tr>
        <% } %>
    </table>
</body>
</html>
