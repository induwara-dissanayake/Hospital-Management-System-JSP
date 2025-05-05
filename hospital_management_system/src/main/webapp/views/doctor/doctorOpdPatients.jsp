<%@ page import="com.hospital.model.OPDOrder" %>
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
    <title>OPD Patients</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin-top: 20px;
            color: #333;
        }

        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 90%;
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
        }

        tr {
            cursor: pointer;
            transition: background-color 0.2s;
        }

        tr:hover {
            background-color: #f5f5f5;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:nth-child(even):hover {
            background-color: #f0f0f0;
        }

        .no-patients {
            text-align: center;
            padding: 20px;
            color: #666;
        }
    </style>
</head>
<body>

<div style="display: flex; min-height: 100vh;">

    <!-- Sidebar -->
    <div class="sidebar-wrapper">
        <jsp:include page="doctorSidebar.jsp" />
    </div>


    <!-- Main Content -->
    <div style="flex: 1; padding: 30px;">
        <h2>OPD Patient Orders</h2>

        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Name</th>
                    <th>Age</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<OPDOrder> patients = (List<OPDOrder>) request.getAttribute("opdpatients");
                    if (patients != null && !patients.isEmpty()) {
                        for (OPDOrder patient : patients) {
                            String viewUrl = request.getContextPath() + "/DoctorOPDViewServlet?id=" + patient.getId();
                %>
                <tr onclick="window.location.href='<%= viewUrl %>'">
                    <td><%= patient.getId() %></td>
                    <td><%= patient.getPatientName() %></td>
                    <td><%= patient.getPatientAge() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="3" class="no-patients">No clinic patient orders found.</td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>

</html>