<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.ExtendedUser" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="../../resources/css/admin.css">
</head>
<body>
    <h2>User Management</h2>
    <a href="views/admin/userRegistration.jsp">Add New User</a>
    <table border="1" cellpadding="8" cellspacing="0">
        <thead>
            <tr>
                <th>ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Address</th>
                <th>Role</th>
                <th>Specialization</th>
                <th>License Number</th>
                <th>Shift</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
        <%
            List<ExtendedUser> users = (List<ExtendedUser>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (ExtendedUser user : users) {
        %>
            <tr>
                <td><%= user.getId() %></td>
                <td><%= user.getFirstName() %></td>
                <td><%= user.getLastName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= user.getPhone() %></td>
                <td><%= user.getAddress() %></td>
                <td><%= user.getRole() %></td>
                <td><%= user.getSpecialization() %></td>
                <td><%= user.getLicenseNumber() %></td>
                <td><%= user.getShift() %></td>
                <td>
                    <form method="post" action="userManagementServlet" onsubmit="return confirm('Are you sure you want to remove this user?');">
                        <input type="hidden" name="removeId" value="<%= user.getId() %>" />
                        <button type="submit">Remove</button>
                    </form>
                </td>
            </tr>
        <%
                }
            } else {
        %>
            <tr><td colspan="11">No users found.</td></tr>
        <%
            }
        %>
        </tbody>
    </table>
</body>
</html>
