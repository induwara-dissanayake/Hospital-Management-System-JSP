<%@ page import="com.hospital.model.ClinicOrder" %>
<%@ page import="java.util.*" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
    
    // Get clinic name based on clinic_id
    Integer clinicId = (Integer) session.getAttribute("clinic_id");
    String clinicName = "";
    if(clinicId != null) {
        switch(clinicId) {
            case 1:
                clinicName = "Eye";
                break;
            case 2:
                clinicName = "Cardiology";
                break;
            case 3:
                clinicName = "Gynecology";
                break;
            case 4:
                clinicName = "Neurology";
                break;
            case 5:
                clinicName = "Pediatric";
                break;
            default:
                clinicName = "";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Clinic Patients</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorclinicpatient.css">
    
</head>
<body>
    <!-- Sidebar -->
    <jsp:include page="doctorSidebar.jsp" />

    <!-- Main Content -->
    <div class="content-wrapper">
        <h2 class="page-title">
            <i class="fas fa-user-injured"></i>

            <%= clinicName %> Clinic Patient Orders

        </h2>

        <table class="custom-table">
            <thead>
                <tr>
                    <th><i class="fas fa-hashtag" style="margin-right: 8px;"></i>Order ID</th>
                    <th><i class="fas fa-user" style="margin-right: 8px;"></i>Patient ID</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<ClinicOrder> patients = (List<ClinicOrder>) request.getAttribute("clinicpatients");
                    if (patients != null && !patients.isEmpty()) {
                        for (ClinicOrder patient : patients) {
                            String viewUrl = request.getContextPath() + "/DoctorClinicViewServlet?patient_id=" + patient.getPatientId() + "&order_id=" + patient.getId();
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
                    <td colspan="2" class="no-patients">
                        <i class="fas fa-folder-open" style="margin-right: 10px;"></i>
                        No clinic patient orders found
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
