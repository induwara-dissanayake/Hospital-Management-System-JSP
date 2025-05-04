<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.Attendance" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    List<Attendance> attendanceList = (List<Attendance>) request.getAttribute("attendanceList");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Reception Attendance Records</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/receptionSidebar.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f9f9;
            display: flex;
        }

        .content-wrapper {
            flex: 1;
            margin-left: 280px;
            padding: 20px;
        }

        .page-header {
    background-color: #ffffff;
    border-left: 6px solid #2b6cb0;
    padding: 20px 25px;
    border-radius: 8px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.06);
    margin-bottom: 24px;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.page-header h2 {
    font-size: 22px;
    color: #2b6cb0;
    display: flex;
    align-items: center;
    margin: 0;
}

.page-header h2 i {
    font-size: 20px;
    margin-right: 12px;
    color: #2b6cb0;
}


        h2 {
            color: #2d3748;
            margin: 0;
            font-size: 24px;
            display: flex;
            align-items: center;
        }

        h2 i {
            margin-right: 10px;
            color: #4a5568;
        }

        .attendance-table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 15px;
            border-bottom: 1px solid #e2e8f0;
            text-align: left;
            font-size: 14px;
        }

        th {
            background-color: #2b6cb0;
            color: white;
        }

        tr:hover {
            background-color: #f1f5f9;
        }

        .no-records {
            text-align: center;
            padding: 40px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            color: #4a5568;
        }

        @media (max-width: 768px) {
            .content-wrapper {
                margin-left: 0;
            }

            table, th, td {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="sidebar-align">
        <jsp:include page="../reception/receptionSidebar.jsp" />
    </div>

    <div class="content-wrapper">
        <div class="page-header">
    <h2><i class="fas fa-clipboard-list"></i>Reception Attendance History</h2>
</div>


        <div class="attendance-table">
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Login Date</th>
                        <th>Login Time</th>
                        <th>Logout Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int count = 1;
                        if (attendanceList != null && !attendanceList.isEmpty()) {
                            for (Attendance att : attendanceList) {
                                Date login = att.getLoginTime();
                                Date logout = att.getLogoutTime();
                    %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= dateFormat.format(login) %></td>
                        <td><%= timeFormat.format(login) %></td>
                        <td><%= logout != null ? timeFormat.format(logout) : "N/A" %></td>
                        <td><%= att.getStatus() %></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="5" class="no-records">No attendance records found.</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
