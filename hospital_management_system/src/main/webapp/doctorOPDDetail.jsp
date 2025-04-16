<%@ page import="com.hospital.model.OPDOrder" %>
<%
    OPDOrder order = (OPDOrder) request.getAttribute("order");
%>

<%
    if (session == null || session.getAttribute("doctor_id") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>OPD Order Details</title>
</head>
<body>
    <h2>Order Details</h2>
    <p><strong>Order ID:</strong> <%= order.getId() %></p>
    <p><strong>Patient Name:</strong> <%= order.getName() %></p>
    <p><strong>Patient Age:</strong> <%= order.getAge() %></p>
    <a href="DoctorOPDServlet">Back to List</a>
</body>
</html>
