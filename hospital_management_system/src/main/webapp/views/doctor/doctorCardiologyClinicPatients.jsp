<%@ page import="com.hospital.model.ClinicOrder" %>
<%@ page import="java.util.*" %>
<%
    if (session == null || session.getAttribute("doctor_id") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cardiology Clinic Patients</title>
    <link rel="stylesheet" type="text/css" href="resources/css/dashboard.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
        }

        h2 {
            text-align: center;
            margin-top: 30px;
            color: #333;
        }

        table {
            margin: 30px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 18px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .view-btn {
            padding: 6px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }

        .view-btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

    <h2>Cardiology Clinic Patient Orders</h2>

    <table>
        <tr>
            <th>Order ID</th>
            <th>Patient ID</th>
            <th>Action</th>
        </tr>
        <%
            List<ClinicOrder> patients = (List<ClinicOrder>) request.getAttribute("cardiologyclinicpatients");
            if (patients != null) {
                for (ClinicOrder patient : patients) {
        %>
        <tr>
            <td><%= patient.getId() %></td>
            <td><%= patient.getPatient_id() %></td>
            <td>
                <a class="view-btn" href="${pageContext.request.contextPath}/DoctorCardiologyClinicViewServlet?id=<%= patient.getPatient_id() %>">View</a>
            </td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="3">No clinic patient orders found.</td>
        </tr>
        <% } %>
    </table>

</body>
</html>
