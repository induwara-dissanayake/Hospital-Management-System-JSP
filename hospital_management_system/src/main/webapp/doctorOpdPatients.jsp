<%@ page import="java.util.*, com.hospital.model.OPDOrder" %>
<%
    if (session == null || session.getAttribute("doctor_id") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>OPD Patients</title>
    <link rel="stylesheet" type="text/css" href="css/dashboard.css">
</head>
<body>
    <h2 style="text-align:center;">OPD Patient Orders</h2>
    <table border="1" align="center" cellpadding="10">
        <tr>
            <th>Order ID</th>
            <th>Patient Name</th>
            <th>Age</th>
        </tr>
        <%
            List<OPDOrder> patients = (List<OPDOrder>) request.getAttribute("opdpatients");
            for (OPDOrder patient : patients) {
        %>
        <tr>
            <td><%= patient.getId() %></td>
            <td><%= patient.getName() %></td>
            <td><%= patient.getAge() %></td>
        </tr>
        <% } %>
    </table>
</body>
</html>
