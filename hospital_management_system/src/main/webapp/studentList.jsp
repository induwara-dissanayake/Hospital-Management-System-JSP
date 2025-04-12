<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.List,com.hospital.model.Student" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 900px;
        }

        h2 {
            text-align: center;
            color: #333;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4CAF50;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        tr:hover {
            background-color: #ddd;
        }

        a {
            display: inline-block;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            color: white;
            text-align: center;
            font-size: 16px;
        }

        .update-btn {
            background-color: #28a745; 
        }

        .delete-btn {
            background-color: #dc3545; 
        }

        a:hover {
            opacity: 0.8;
        }

        .action-links {
            text-align: center;
        }

        .form-footer {
            text-align: center;
            font-size: 14px;
            margin-top: 15px;
        }
    </style>
</head>
<body>

    <div class="container">
        <h2>List of Registered Students</h2>
        
        <table>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Course</th>
                <th>Actions</th>
            </tr>
            <c:forEach var="student" items="${studentList}">
                <tr>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>${student.course}</td>
                    <td class="action-links">
<a href="StudentServlet?action=update&id=${student.id}" class="update-btn">Update</a>
                        <a href="StudentServlet?action=delete&id=${student.id}" onclick="return confirm('Are you sure you want to delete this student?');" class="delete-btn">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <a href="studentForm.jsp">Register New Student</a>
    </div>

</body>
</html>
