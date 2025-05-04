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
<html>
<head>
    <title>Reception Attendance Records</title>
    
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
            padding: 30px;
            font-family: Arial, sans-serif;
        }
        h2 {
            text-align: center;
            margin-bottom: 30px;
        }
        table {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        .table-container {
            display: flex;
            justify-content: center;
        }
    </style>
</head>
<body>

    <h2>Reception Attendance History</h2>
    <div class="table-container">
        <table class="table table-bordered table-hover w-75">
            <thead>
                <tr>
                    <th>ID</th>
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
                    <td>
                        <%= logout != null ? timeFormat.format(logout) : "N/A" %>
                    </td>
                    <td><%= att.getStatus() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-center text-muted">No attendance records found.</td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
