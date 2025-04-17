<%@ page import="java.util.List" %>
<%@ page import="com.hospital.model.DoctorAttendance" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%
    List<DoctorAttendance> attendanceList = (List<DoctorAttendance>) request.getAttribute("attendanceList");
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm:ss");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Doctor Attendance Records</title>
    <style>
        table {
            border-collapse: collapse;
            width: 60%;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Doctor Attendance History</h2>
    <table>
        <tr>
           
            <th>Date</th>
            <th>Time</th>
        </tr>
        <%
            for (DoctorAttendance da : attendanceList) {
                Date timestamp = da.getTime();
        %>
        <tr>
            <td><%= dateFormat.format(timestamp) %></td>
            <td><%= timeFormat.format(timestamp) %></td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
