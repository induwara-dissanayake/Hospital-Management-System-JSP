<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Prescriptions</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/opdPatients.css">
    <style>
        .center-container {
            text-align: center;
            margin-bottom: 20px;
        }
        .center-container input[type="text"] {
            padding: 5px;
            width: 300px;
        }
        .center-container form {
            display: inline-block;
            margin-right: 20px;
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

<h2>Prescriptions List</h2>

<div class="center-container">
    <!-- Insert Prescription Form -->
    <form action="DoctorAddPrescriptionServlet" method="post">
        <input type="text" name="prescriptionName" placeholder="New prescription..." required>
        <button type="submit">Insert Prescription</button>
    </form>

    <!-- Search bar -->
    <input type="text" id="searchInput" placeholder="Search prescription..." onkeyup="searchPrescriptions()">
</div>

<table id="prescriptionTable">
    <thead>
        <tr>
            <th>Prescription ID</th>
            <th>Prescription Name</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
    </thead>
    <tbody>
    <%
        List<Prescription> prescriptions = (List<Prescription>) request.getAttribute("prescription");
        if (prescriptions != null) {
            for (Prescription prescription : prescriptions) {
    %>
        <tr>
            <td><%= prescription.getId() %></td>
            <td><%= prescription.getprescription() %></td>
            <td><button onclick="promptUpdate(<%= prescription.getId() %>, '<%= prescription.getprescription() %>')">Update</button></td>
            <td><button onclick="confirmDelete(<%= prescription.getId() %>)">Delete</button></td>
        </tr>
    <%
            }
        } else {
    %>
        <tr>
            <td colspan="4">No prescriptions found.</td>
        </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
