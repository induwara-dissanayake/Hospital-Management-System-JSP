<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8">
    <title>OPD Patients</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/opdPatients.css">

</head>
<body>

    <h2>OPD Patient Orders</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>Patient Name</th>
            <th>Age</th>
            <th>Action</th>
        </tr>
        <%
            List<OPDOrder> patients = (List<OPDOrder>) request.getAttribute("opdpatients");
            if (patients != null && !patients.isEmpty()) {
                for (OPDOrder patient : patients) {
        %>
        <tr>
            <td><%= patient.getId() %></td>
            <td><%= patient.getName() %></td>
            <td><%= patient.getAge() %></td>
            <td><a href="${pageContext.request.contextPath}/DoctorOPDViewServlet?id=<%= patient.getId() %>" class="view-link">View</a></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="4">No OPD orders found.</td>
        </tr>
        <% } %>
    </table>
</body>
</html>
