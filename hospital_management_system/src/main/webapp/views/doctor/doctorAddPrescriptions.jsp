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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/opdPatients.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctoraddprescriptions.css">
    

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

