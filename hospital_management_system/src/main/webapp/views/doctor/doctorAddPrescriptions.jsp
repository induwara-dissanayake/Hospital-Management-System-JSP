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
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f6f9;
            padding: 30px;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        .center-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .center-container form {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 10px;
        }

        input[type="text"], select {
            padding: 8px;
            width: 200px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        button {
            padding: 8px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #0056b3;
        }

        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        #searchInput {
            padding: 8px;
            width: 250px;
            margin-top: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
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
        <select name="prescriptionType" required>
            <option value="">Select Type</option>
            <option value="Tablet">Tablet</option>
            <option value="Liquid">Liquid</option>
            <option value="Drops">Drops</option>
            <option value="Inhalers">Inhalers</option>
        </select>
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
            <th>Prescription type</th>
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
            <td colspan="4">No prescriptions found.</td>
        </tr>
    <% } %>
    </tbody>
</table>

</body>
</html>
