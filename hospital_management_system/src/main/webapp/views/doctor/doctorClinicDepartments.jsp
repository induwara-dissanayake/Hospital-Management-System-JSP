<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Clinic Departments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 30px;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .card-container {
            display: flex;
            flex-wrap: nowrap;
            justify-content: center;
            gap: 16px;
            overflow-x: auto;
        }

        .clinic-card {
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 10px;
            width: 180px;
            height: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            font-size: 16px;
            font-weight: bold;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            transition: transform 0.2s ease-in-out;
            flex-shrink: 0;
            text-decoration: none;
            color: #333;
        }

        .clinic-card:hover {
            transform: scale(1.05);
            background-color: #e8f4fc;
            cursor: pointer;
        }
    </style>
</head>
<body>

    <h2>Clinic Departments</h2>

    <div class="card-container">
        <a href="${pageContext.request.contextPath}/DoctorEyeClinicServlet?clinic_id=1" class="clinic-card">Eye Clinic</a>
        <a href="${pageContext.request.contextPath}/DoctorCardiologyClinicServlet?clinic_id=2" class="clinic-card">Cardiology Clinic</a>
        <a href="${pageContext.request.contextPath}/DoctorGynecologyClinicServlet?clinic_id=3" class="clinic-card">Gynecology Clinic</a>
        <a href="${pageContext.request.contextPath}/DoctorNeurologyClinicServlet?clinic_id=4" class="clinic-card">Neurology Clinic</a>
        <a href="${pageContext.request.contextPath}/DoctorPediatricClinicServlet?clinic_id=5" class="clinic-card">Pediatric Clinic</a>
    </div>

</body>
</html>
