<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Medicine</title>
</head>
<body>
    <h1>Add Medicine</h1>
    <form action="${pageContext.request.contextPath}/MedicineServlet" method="POST">
        <input type="hidden" name="action" value="addMedicine">
        <label for="medicineName">Medicine Name:</label>
        <input type="text" id="medicineName" name="medicineName" required><br>

        <label for="dosageForm">Dosage Form:</label>
        <input type="text" id="dosageForm" name="dosageForm" required><br>

        <label for="dosageStrength">Dosage Strength:</label>
        <input type="text" id="dosageStrength" name="dosageStrength" required><br>

        <label for="stockQuantity">Stock Quantity:</label>
        <input type="number" id="stockQuantity" name="stockQuantity" required><br>

        <label for="prescribedFor">Prescribed For:</label>
        <input type="text" id="prescribedFor" name="prescribedFor" required><br>

        <label for="category">Category:</label>
        <input type="text" id="category" name="category"><br>

        <button type="submit">Add Medicine</button>
	</form>
</body>
</html>