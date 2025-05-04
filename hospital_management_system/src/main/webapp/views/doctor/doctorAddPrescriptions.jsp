<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.hospital.model.Prescription" %>
<%@ page import="java.util.List" %>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("doctorLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Prescriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/opdPatients.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f7;
        }

        .sidebar-wrapper {
            position: fixed;
            left: 0;
            top: 0;
            height: 100%;
            width: 220px;
            background-color: #2c3e50;
            box-shadow: 2px 0 8px rgba(0,0,0,0.1);
            z-index: 999;
        }

        .main-content {
            margin-left: 220px;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .center-container {
            max-width: 800px;
            margin: 0 auto 40px;
            text-align: center;
        }

        .center-container form {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 12px;
            margin-bottom: 20px;
        }

        input[type="text"], select {
            padding: 10px;
            width: 220px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        button {
            padding: 10px 18px;
            background-color: #3498db;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #2980b9;
        }

        #searchInput {
            padding: 10px;
            width: 300px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
        }

        table {
            width: 90%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #3498db;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }
    </style>

    <script>
        function searchPrescriptions() {
            const input = document.getElementById("searchInput").value.toLowerCase();
            const rows = document.querySelectorAll("#prescriptionTable tbody tr");
            rows.forEach(row => {
                const prescriptionName = row.cells[1].textContent.toLowerCase();
                row.style.display = prescriptionName.includes(input) ? "" : "none";
            });
        }

        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this prescription?")) {
                window.location.href = "DoctorDeletePrescriptionServlet?id=" + id;
            }
        }

        function promptUpdate(id, currentName) {
            const newName = prompt("Enter the new prescription name:", currentName);
            if (newName && newName.trim() !== "") {
                window.location.href = "DoctorUpdatePrescriptionServlet?id=" + id + "&name=" + encodeURIComponent(newName);
            }
        }
    </script>
</head>
<body>

<!-- Sidebar -->
<div class="sidebar-wrapper">
    <jsp:include page="doctorSidebar.jsp" />
</div>

<!-- Main Content -->
<div class="main-content">
    <h2>Prescription Management</h2>

    <div class="center-container">
        <!-- Add Prescription Form -->
        <form action="DoctorAddPrescriptionServlet" method="post">
            <input type="text" name="prescriptionName" placeholder="New prescription..." required>
            <select name="prescriptionType" required>
                <option value="">Select Type</option>
                <option value="Tablet">Tablet</option>
                <option value="Liquid">Liquid</option>
                <option value="Drops">Drops</option>
                <option value="Inhalers">Inhalers</option>
            </select>
            <button type="submit">Add</button>
        </form>

        <!-- Search Input -->
        <input type="text" id="searchInput" placeholder="Search prescriptions..." onkeyup="searchPrescriptions()">
    </div>

    <!-- Table -->
    <table id="prescriptionTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Type</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<Prescription> prescriptions = (List<Prescription>) request.getAttribute("prescription");
            if (prescriptions != null && !prescriptions.isEmpty()) {
                for (Prescription prescription : prescriptions) {
        %>
            <tr>
                <td><%= prescription.getId() %></td>
                <td><%= prescription.getPrescription() %></td>
                <td><%= prescription.getType() %></td>
                <td><button onclick="promptUpdate(<%= prescription.getId() %>, '<%= prescription.getPrescription() %>')">Update</button></td>
                <td><button onclick="confirmDelete(<%= prescription.getId() %>)">Delete</button></td>
            </tr>
        <%
                }
            } else {
        %>
            <tr>
                <td colspan="5">No prescriptions found.</td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>

