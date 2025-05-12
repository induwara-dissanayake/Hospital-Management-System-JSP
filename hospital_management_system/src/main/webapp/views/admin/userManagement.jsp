<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.ExtendedUser" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminManagement.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSidebar.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/adminSideLink.css">
</head>
<body>
<div class="sidebar-wrapper">
    <jsp:include page="adminSidebar.jsp" />
</div>
<div class="main-content">
    <h2>User Management</h2>
    <a href="${pageContext.request.contextPath}/views/admin/userRegistration.jsp" class="btn"><i class="fas fa-plus"></i> Add New User</a>
    <div class="table-container">
        <table class="medicine-table">
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
                        <form method="post" action="${pageContext.request.contextPath}/adminUserManagement" onsubmit="return confirm('Are you sure you want to remove this user?');" style="display:inline;">
                            <input type="hidden" name="removeId" value="<%= user.getId() %>" />
                            <button type="submit" class="btn-delete" title="Delete"><i class="fas fa-trash"></i></button>
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
    </div>
</div>
</body>
</html>
