<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medicine Management</title>
</head>
<body>
    <h1>Medicine Management</h1>
    <a href="addMedicine.jsp">Add New Medicine</a>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Dosage Form</th>
                <th>Dosage Strength</th>
                <th>Stock Quantity</th>
                <th>Prescribed For</th>
                <th>Category</th>
                <th>Created At</th>
                <th>Updated At</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="medicine" items="${medicines}">
                <tr>
                    <td>${medicine.medicineId}</td>
                    <td>${medicine.medicineName}</td>
                    <td>${medicine.dosageForm}</td>
                    <td>${medicine.dosageStrength}</td>
                    <td>${medicine.stockQuantity}</td>
                    <td>${medicine.prescribedFor}</td>
                    <td>${medicine.category}</td>
                    <td>${medicine.createdAt}</td>
                    <td>${medicine.updatedAt}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>