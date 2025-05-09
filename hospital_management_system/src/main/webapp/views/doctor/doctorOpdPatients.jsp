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
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctoropdpatients.css">
</head>
<body>

<div style="display: flex; min-height: 100vh;">

    <!-- Sidebar -->
    <div class="sidebar-wrapper">
        <jsp:include page="doctorSidebar.jsp" />
    </div>


    <!-- Main Content -->
    <div style="flex: 1; padding: 30px 50px 30px 50px; margin-left: 182px; background-color: #f4f6f8;">
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