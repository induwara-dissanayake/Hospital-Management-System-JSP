<%@ page import="java.sql.*" %>
<%@ page import="com.hospital.util.DBConnection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/admin.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">
    
</head>
<body>

<div class="sidebar-wrapper">
  <jsp:include page="adminSidebar.jsp" />
</div>


<div class="container">

        <h2>User Management</h2>

        <%
            String message = request.getParameter("message");
            if (message != null) {
        %>
            <p style="color: green;"><%= message %></p>
        <%
            }
            try {
                Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM user_registrations");
        %>

        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th><th>Name</th><th>Email</th><th>Phone</th><th>Role</th><th>Action</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("first_name") %> <%= rs.getString("last_name") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("phone") %></td>
                <td><%= rs.getString("role") %></td>
                <td>
                    <form method="post" action="<%= request.getContextPath() %>/deleteUser">

                        <input type="hidden" name="userId" value="<%= rs.getInt("id") %>">
                        <input type="submit" value="remove User" onclick="return confirm('Are you sure you want to delete this user?');">
                    </form>
                </td>
            </tr>
            <%
                }
                conn.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
            %>
        </table>
    </div>
    <script src="${pageContext.request.contextPath}/resources/javascript/admin.js"></script>
</body>
</html>
