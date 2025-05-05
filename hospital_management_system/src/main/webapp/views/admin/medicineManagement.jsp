<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Medicine Management</title>
</head>
<body>
    <h1>Medicine Management</h1>
    <a href="views/admin/addMedicine.jsp">Add New Medicine</a>
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
                <th>Action</th> <!-- New column for actions -->
            </tr>
        </thead>
        <tbody>
            <c:if test="${empty medicines}">
                <tr><td colspan="10">No medicines found.</td></tr>
            </c:if>
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
                    <td>
                        <!-- Delete option -->
                        <a href="${pageContext.request.contextPath}/MedicineServlet?action=removeMedicine&medicineId=${medicine.medicineId}">Remove</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
