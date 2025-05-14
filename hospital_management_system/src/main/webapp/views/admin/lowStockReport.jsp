<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Medicine" %>

<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }

    List<Medicine> medicines = (List<Medicine>) request.getAttribute("medicines");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Low Stock Medicines</title>
    <style>
        :root {
            --primary: #3b82f6;
            --primary-light: #93c5fd;
            --primary-dark: #1d4ed8;
            --card-bg: #ffffff;
            --text-dark: #1e293b;
            --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);
            --radius: 12px;
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
            min-height: 100vh;
            padding: 40px;
        }

        h2 {
            margin-bottom: 20px;
        }

        .top-bar {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .print-button {
            background-color: #ef4444;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: bold;
            box-shadow: var(--shadow);
            transition: background-color 0.3s ease;
        }

        .print-button:hover {
            background-color: #dc2626;
        }

        .back-button {
            background-color: #3b82f6;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: var(--radius);
            cursor: pointer;
            font-weight: bold;
            box-shadow: var(--shadow);
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: var(--card-bg);
            box-shadow: var(--shadow);
            border-radius: var(--radius);
            overflow: hidden;
        }

        th, td {
            padding: 12px 16px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }

        th {
            background-color: var(--primary-light);
            color: var(--text-dark);
        }

        tr:hover {
            background-color: #f9fafb;
        }

        tr:last-child td {
            border-bottom: none;
        }

        @media print {
            .print-button, .top-bar {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <button class="print-button" onclick="window.print()">Print</button>
    </div>
    <div class="top-bar">
        <a href="${pageContext.request.contextPath}/views/admin/adminDashboard.jsp" button class="back-button" >Back to Dashborad</button></a>
    </div>

    <h2>Low Stock Medicines (Below 50 Units)</h2>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Dosage Form</th>
                <th>Strength</th>
                <th>Stock Quantity</th>
                <th>Category</th>
                <th>Last Updated</th>
            </tr>
        </thead>
        <tbody>
            <%
                if (medicines != null && !medicines.isEmpty()) {
                    for (Medicine med : medicines) {
            %>
                <tr>
                    <td><%= med.getMedicineId() %></td>
                    <td><%= med.getMedicineName() %></td>
                    <td><%= med.getDosageForm() %></td>
                    <td><%= med.getDosageStrength() %></td>
                    <td><%= med.getStockQuantity() %></td>
                    <td><%= med.getCategory() %></td>
                    <td><%= med.getUpdatedAt() %></td>
                </tr>
            <%
                    }
                } else {
            %>
                <tr><td colspan="9" style="text-align:center;">No low stock medicines found.</td></tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
