<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.hospital.model.Prescription" %>
<%@ page import="java.util.List" %>

    
    
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
<title>Add Prescriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/opdPatients.css">

</head>
<body>

 <h2>Prescriptions List</h2>

    <table>
        <tr>
            <th>Prescriptions ID</th>
            <th>Prescriptions Name</th>
            <th></th>
            <th></th>
        </tr>
        <%
            List<Prescription> Prescriptions = (List<Prescription>) request.getAttribute("prescription");
            if (Prescriptions != null) {
                for (Prescription prescription : Prescriptions) {
        %>
        <tr>
            <td><%= prescription.getId() %></td>
            <td><%= prescription.getprescription() %></td>
            <td><a href="${pageContext.request.contextPath}/DoctorOPDViewServlet?id=<%= prescription.getId() %>" class="view-link">Update</a></td>
            <td><a href="${pageContext.request.contextPath}/DoctorOPDViewServlet?id=<%= prescription.getId() %>" class="view-link">Delete</a></td>
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