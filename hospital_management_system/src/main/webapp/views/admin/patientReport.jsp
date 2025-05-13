<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.PrintPatient" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Report</title>
    <style>
        :root {
            --primary: #3b82f6;
            --primary-light: #93c5fd;
            --primary-dark: #1d4ed8;
            --card-bg: #ffffff;
            --text-dark: #1e293b;
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --radius: 12px;
            --light-red: #fca5a5;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f1f5f9;
            color: var(--text-dark);
            display: flex;
            min-height: 100vh;
            justify-content: center;
            align-items: flex-start;
        }

        .container {
            width: 80%;
            max-width: 900px;
            background-color: var(--card-bg);
            box-shadow: var(--shadow);
            border-radius: var(--radius);
            padding: 20px;
            margin: 20px;
            margin-left: 280px;
            position: relative;
        }

        .header {
            text-align: center;
            margin-bottom: 30px;
        }

        .header h1 {
            font-size: 24px;
            color: #1e293b;
        }

        .search-bar {
            margin-bottom: 20px;
            text-align: center;
        }

        .search-bar input,
        .search-bar select {
            padding: 10px;
            font-size: 16px;
            border-radius: var(--radius);
            border: 1px solid #ccc;
            margin-right: 10px;
        }

        .search-bar button {
            padding: 10px 20px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            font-size: 16px;
        }

        .search-bar button:hover {
            background-color: var(--primary-dark);
        }

        .patient-info {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .patient-info div {
            background-color: var(--primary-light);
            padding: 15px;
            border-radius: var(--radius);
        }

        .patient-info div h3 {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .patient-info div p {
            font-size: 16px;
        }

        .report-details {
            margin-bottom: 20px;
        }

        .report-details h3 {
            font-size: 20px;
            margin-bottom: 10px;
            color: var(--primary-dark);
        }

        .report-details p {
            font-size: 16px;
            line-height: 1.5;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 14px;
            color: #6b7280;
        }

        .print-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            padding: 10px 20px;
            background-color: #f00d0d;
            color: white;
            border: none;
            border-radius: var(--radius);
            cursor: pointer;
            font-size: 16px;
        }

        .print-btn:hover {
            background-color: #e24242;
        }
    </style>
</head>
<body>
    <div class="container">
        <button class="print-btn" onclick="window.print()">Print</button>

        <div class="header">
            <h1>Patient Report</h1>
            <p>Report Date: <%= new java.util.Date() %></p>
        </div>

        <!-- Search Bar -->
        <div class="search-bar">
            <form action="${pageContext.request.contextPath}/searchPatient" method="get">
                <input type="text" name="searchTerm" placeholder="Enter NIC, Patient ID, or Name"
                       value="<%= request.getParameter("searchTerm") != null ? request.getParameter("searchTerm") : "" %>">
                <select name="searchBy">
                    <option value="nic" <%= "nic".equals(request.getParameter("searchBy")) ? "selected" : "" %>>Search by NIC</option>
                    <option value="id" <%= "id".equals(request.getParameter("searchBy")) ? "selected" : "" %>>Search by Patient ID</option>
                    <option value="name" <%= "name".equals(request.getParameter("searchBy")) ? "selected" : "" %>>Search by Name</option>
                </select>
                <button type="submit">Search</button>
            </form>
        </div>

        <% 
            List<PrintPatient> patients = (List<PrintPatient>) request.getAttribute("patients");
            if (patients != null && !patients.isEmpty()) {
                for (PrintPatient p : patients) {
        %>
            <div class="patient-info">
                <div>
                    <h3>Patient ID</h3>
                    <p><%= p.getId() %></p>
                </div>
                <div>
                    <h3>NIC</h3>
                    <p><%= p.getNic() %></p>
                </div>
                <div>
                    <h3>Name</h3>
                    <p><%= p.getName() %></p>
                </div>
                <div>
                    <h3>Gender</h3>
                    <p><%= p.getGender() %></p>
                </div>
                <div>
                    <h3>Age</h3>
                    <p><%= p.getAge() %></p>
                </div>
                <div>
                    <h3>Contact</h3>
                    <p><%= p.getContact() %></p>
                </div>
                <div>
                    <h3>Address</h3>
                    <p><%= p.getAddress() %></p>
                </div>
                <div>
                    <h3>Registered Date</h3>
                    <p><%= p.getCreatedAt() %></p>
                </div>
            </div>

            <div class="report-details">
                <h3>Diagnosis</h3>
                <p><%= p.getDiagnosis() %></p>
            </div>
        <% 
                }
            } else if (request.getParameter("searchTerm") != null) {
        %>
            <p style="text-align:center; color: red; font-weight: bold;">No patient records found for your search.</p>
        <% } %>

        <div class="footer">
            <p>Report Generated by: Hospital Management System</p>
        </div>
    </div>
</body>
</html>
