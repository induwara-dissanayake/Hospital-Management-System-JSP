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
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .content-wrapper {
            margin-left: 280px;
            padding: 30px;
            min-height: 100vh;
        }

        .page-title {
            color: #1e293b;
            font-size: 24px;
            margin-bottom: 30px;
            padding-bottom: 10px;
            border-bottom: 2px solid #3498db;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .custom-table {
            width: 100%;
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border-collapse: collapse;
            margin-top: 20px;
        }

        .custom-table th {
            background-color: #3b82f6;
            color: white;
            text-align: left;
            padding: 15px 20px;
            font-weight: 500;
            font-size: 0.95rem;

        }

        .custom-table td {
            padding: 15px 20px;
            border-bottom: 1px solid #eee;
            color: #2c3e50;
        }

        .custom-table tr {
            cursor: pointer;
            transition: background-color 0.2s ease;
        }

        .custom-table tr:hover {
            background-color: #f8f9fa;
        }


        .custom-table tr:last-child td {
            border-bottom: none;
        }

        .no-patients {
            text-align: center;
            padding: 40px;
            color: #64748b;
            font-style: italic;
        }

        .hidden-link {
            display: none;
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 0;
                padding: 15px;
            }
            
            .custom-table {
                display: block;
                overflow-x: auto;
            }

            .page-title {
                font-size: 1.5rem;
                margin-bottom: 20px;
            }
        }
    </style>
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
