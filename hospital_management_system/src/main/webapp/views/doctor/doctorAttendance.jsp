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
    <title>Doctor Attendance Records</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />    
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/doctorattendance.css">
</head>
<body>
    <!-- Sidebar -->
    <jsp:include page="doctorSidebar.jsp" />

    <!-- Main Content -->
    <div class="content-wrapper">
        <h2 class="page-title">
            <i class="fas fa-calendar-check" style="margin-right: 10px;"></i>
            Attendance History
        </h2>

        <table class="custom-table">
            <thead>
                <tr>
                    <th><i class="fas fa-hashtag icon-column"></i>No</th>
                    <th><i class="fas fa-calendar icon-column"></i>Date</th>
                    <th><i class="fas fa-sign-in-alt icon-column"></i>Login Time</th>
                    <th><i class="fas fa-sign-out-alt icon-column"></i>Logout Time</th>
                    <th><i class="fas fa-info-circle icon-column"></i>Status</th>
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
                    <td><%= logout != null ? timeFormat.format(logout) : "<span class='text-muted'>Not logged out</span>" %></td>
                    <td><span class="status-badge"><%= att.getStatus() %></span></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" style="text-align: center; color: #6c757d;">
                        <i class="fas fa-folder-open" style="margin-right: 10px;"></i>
                        No attendance records found
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
