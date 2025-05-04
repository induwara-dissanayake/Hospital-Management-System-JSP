<%@ page import="com.hospital.model.ClinicOrder" %>
<%@ page import="java.util.*" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Clinic Patients</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 20px;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #fff;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #e0e0e0;
        }

        th {
            background-color: #007BFF;
            color: white;
            font-weight: normal;
        }

        tr {
            cursor: pointer;
            transition: background-color 0.2s;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        .no-patients {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>
<body>

    <h2>Clinic Patient Orders</h2>

    <table>
        <thead>
            <tr>
                <th>Order ID</th>
                <th>Patient ID</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<ClinicOrder> patients = (List<ClinicOrder>) request.getAttribute("clinicpatients");
                if (patients != null && !patients.isEmpty()) {
                    for (ClinicOrder patient : patients) {
                        String viewUrl = request.getContextPath() + "/DoctorClinicViewServlet?id=" + patient.getId();
            %>
            <tr onclick="window.location.href='<%= viewUrl %>'">
                <td><%= patient.getId() %></td>
                <td><%= patient.getPatientId() %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="2" class="no-patients">No clinic patient orders found.</td>
            </tr>
            <% } %>
        </tbody>
    </table>

</body>
</html>
