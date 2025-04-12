<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="com.hospital.model.Student" %>

<%
    Student student = (Student) request.getAttribute("student");
    String idString = request.getParameter("id");
    int id =  Integer.parseInt(idString);

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input {
            width: 90%;
            padding: 8px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #28a745;
            color: white;
            cursor: pointer;
            width: 100%;
            border: none;
            padding: 10px;
            font-size: 16px;
        }
        input[type="submit"]:hover {
            background-color: #218838;
        }
        a {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
            color: #007BFF;
            font-size: 14px;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Update Student</h2>
    <form action="StudentServlet?action=update" method="post">
        <input type="hidden" name="id" value="<%= id %>"/>
		
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" value="<%= student.getName() %>" required/>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required/>

        <label for="course">Course:</label>
        <input type="text" id="course" name="course" value="<%= student.getCourse() %>" required/>

        <input type="submit" value="Update">
    </form>

    <a href="studentList.jsp">Back to Student List</a>
</div>

</body>
</html>
