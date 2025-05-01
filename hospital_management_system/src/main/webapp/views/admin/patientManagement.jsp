<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Patient Management</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }
        
        /* Sidebar Styles */
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
        }
        
        .sidebar-header {
            padding: 20px;
            text-align: center;
            border-bottom: 1px solid #34495e;
        }
        
        .profile-pic {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            margin-bottom: 10px;
        }
        
        .username {
            font-weight: bold;
            font-size: 18px;
        }
        
        .role {
            font-size: 14px;
            color: #bdc3c7;
        }
        
        .nav {
            padding: 10px 0;
        }
        
        .nav-item {
            display: block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            transition: background-color 0.3s;
        }
        
        .nav-item:hover, .nav-item.active {
            background-color: #34495e;
        }
        
        .nav-header {
            display: flex;
            align-items: center;
        }
        
        .nav-icon {
            margin-right: 10px;
            width: 20px;
            text-align: center;
        }
        
        .submenu {
            padding-left: 30px;
            display: none;
        }
        
        .submenu-item {
            display: block;
            padding: 8px 10px;
            color: #ecf0f1;
            text-decoration: none;
            font-size: 14px;
        }
        
        .submenu-item:hover {
            background-color: #2980b9;
        }
        
        .logout {
            position: absolute;
            bottom: 20px;
            width: 100%;
        }
        
        /* Main Content Styles */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
        }
        
        h2 {
            color: #333;
            margin-top: 0;
        }
        
        form {
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f5f5f5;
            border-radius: 5px;
        }
        
        label {
            display: inline-block;
            width: 80px;
            margin-bottom: 10px;
        }
        
        input[type="text"] {
            padding: 5px;
            width: 200px;
            margin-bottom: 10px;
        }
        
        input[type="submit"] {
            padding: 8px 15px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        
        th {
            background-color: #f2f2f2;
        }
        
        .delete-link {
            color: #f44336;
            text-decoration: none;
        }
        
        .message {
            padding: 10px;
            margin-top: 20px;
            background-color: #e7f3fe;
            border-left: 6px solid #2196F3;
        }
    </style>
    <script>
        // Toggle submenu
        document.addEventListener('DOMContentLoaded', function() {
            var userItem = document.getElementById('userItem');
            if (userItem) {
                userItem.addEventListener('click', function() {
                    var submenu = this.querySelector('.submenu');
                    if (submenu.style.display === 'block') {
                        submenu.style.display = 'none';
                    } else {
                        submenu.style.display = 'block';
                    }
                });
            }
        });
    </script>
</head>
<body>
    <!-- Include admin sidebar -->
    <jsp:include page="adminSidebar.jsp" />

    <div class="main-content">
        <h2>Patient Management</h2>

        <form action="${pageContext.request.contextPath}/admin/PatientManagementServlet" method="post">
            <label>Name: </label>
            <input type="text" name="name" required><br>
            <label>NIC: </label>
            <input type="text" name="nic" required><br>
            <input type="submit" value="Add Patient">
        </form>

        <h3>Existing Patients</h3>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>NIC</th>
                <th>Actions</th>
            </tr>
            <!-- Loop through patients and display them -->
            <c:forEach var="patient" items="${patients}">
                <tr>
                    <td>${patient.id}</td>
                    <td>${patient.name}</td>
                    <td>${patient.nic}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/PatientManagementServlet?action=delete&id=${patient.id}" class="delete-link" 
                           onclick="return confirm('Are you sure you want to delete this patient?')">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <c:if test="${empty patients}">
            <p>No patients found. Add a new patient using the form above.</p>
        </c:if>

        <c:if test="${not empty param.message}">
            <div class="message">
                <strong>${param.message}</strong>
            </div>
        </c:if>
    </div>

    <!-- Load patients on page load if not already loaded -->
    <c:if test="${empty patients and empty param.message}">
        <script>
            window.onload = function() {
                window.location.href = "${pageContext.request.contextPath}/admin/PatientManagementServlet";
            }
        </script>
    </c:if>
</body>
</html>